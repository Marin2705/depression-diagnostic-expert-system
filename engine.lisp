;; Chargement des fichiers BR.lisp BF.lisp et questions.lisp
(load "BR.lisp")
(load "BF.lisp")
(load "questions.lisp")
(load "depression.lisp")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Définition des fonctions pour récupérer les différentes parties d'une règle
(defun getConclusionRule (rule)
	(caddr rule))

(defun getPremisseRule (rule)
	(cadr rule))

(defun getNumberRule (rule)
	(car rule))
 
;; Définition des fonctions pour agir avec les différentes règles
(defun isFactDefined (fact)
	(if (member fact *BF*) T NIL))
  
(defun checkPremisse (premisse)
    (if (funcall (cadr premisse) (symbol-value (car premisse)) (caddr premisse)) 1 0)) ;;possible erreur

(defun desactivateRule (rule) ;; a voir
	(setf *BR* (delete-if #'(lambda (item) (eq (symbol-value item) rule)) *BR*)))
	
(defun executeRule (rule)
    (let ((conclusion (getConclusionRule rule)))
		(pushnew conclusion *BF*)))
  
(defun checkRule (rule)
    (let ((toDelete 0)(execute 1))
        (dolist (premisse (getPremisseRule rule)) 
            (if (isFactDefined  (cadr premisse)) 
                (progn 
					(setq execute (* (checkPremisse premisse) execute)) ;; a regarder
					(if (= (checkPremisse premisse) 0) (setq toDelete 1)))
                (setq execute 0)))
        (if (= execute 1) (progn (executeRule rule)(desactivateRule rule))) 
        (if (= toDelete 1)(desactivateRule rule)) 
        execute))
		
(defun checkRules ()
    (let ((executed NIL))
    (dolist (rule *BR* T)
      (if (= (checkRule (symbol-value rule)) 1) (setq executed T)))
      executed))
	 
	 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	 
;; Définition des fonctions d'accès aux questions
(defun getQuestion (question)
	(car question))
	
(defun getResponse (question)
    (cadr question))
  
;; Définition des fonctions pour agir sur les questions
(defun askQuestion (question)
    (format t "~%~S~%> " (getQuestion question))
    (clear-input)
    (set (getResponse question) (read))
    (pushnew (getResponse question) *BF*)
    (setf *questions* (delete-if #'(lambda (item) (eq (symbol-value item) question)) *questions*)))
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;; Définition des fonctions d'accès aux différentes dépressions 
(defun getConditionsDepression (depression)
    (car depression))
	
(defun getNameDepression (depression)
    (cadr depression))
	
(defun getDescriptionDepression (depression)
    (caddr depression))
  
;; Définition des fonctions pour agir sur les différentes dépressions
(defun askDepression ()
    (let ((dep NIL)(nameDep NIL))
		(format t "~%Indiquez le nom de la dépression que vous pensez avoir~%> ")
		(clear-input)
		(setq dep (read))
		(dolist (depression *depression*)
			(if (equal (getNameDepression (symbol-value depression)) dep) (setq nameDep depression)))
	nameDep))
  
(defun desactiveDepression (depression)
    (setf *depression* (delete-if #'(lambda (item) (eq (symbol-value item) depression)) *depression*)))
  
(defun isFactPossible (fact)
    (let ((possible NIL))
		(dolist (rule *BR*) 
			(if (equal (getConclusionRule (symbol-value rule)) fact) (setq possible T)))
    possible))
  
(defun isConditionPossible (condition)
    (let ((possible NIL))
		(dolist (fact condition)
			(if (isFactPossible fact) (setq possible T)))
    possible))
  
(defun isFactApproved (fact)
	(if (member fact *BF*) T NIL))
  
(defun isConditionApproved (condition)
    (let ((approved NIL))
      (dolist (fact condition)
        (if (isFactApproved fact) (setq approved T)))
      approved))
  
(defun checkDepression (depression)
    (let ((possible T)(to-delete NIL))
      (dolist (condition (getConditionsDepression depression))
        (if (not (isConditionApproved condition)) 
            (progn 
              (setq possible NIL)
              (if (not (isConditionPossible condition)) 
                  (setq to-delete T)))))
      (if to-delete (desactiveDepression depression)) 
      possible))
  
(defun checkDepressions ()
    (let ((dep NIL))
		(dolist (depression *depression*)
			(if (checkDepression (symbol-value depression)) (setq dep depression)))
		(if (= (length *depression*) 1) (setq dep (car *depression*)))
    dep))
  
(defun askBetterQuestion ()
    (let ((questions NIL)(param NIL)(best-score 0)(questionToAsk NIL))
		(dolist (depression *depression*)
			(dolist (condition (getConditionsDepression (symbol-value depression)))
			(dolist (fact condition)
				(setq questions (incrementVarToFact fact questions)))))
		(dolist (q questions)
			(if (>= (cadr q) bestScore)
				(progn
					(setq bestScore (cadr q))
					(setq questionToAsk (car q)))))
		(if questionToAsk (progn (askQuestion (symbol-value questionToAsk)) T) NIL)))
  
(defun incrementVarToFact (fact variables)
	(let ((variablesR variables)) 
		(dolist (rule *BR*)
			(if (eq (getConclusionRule (symbol-value rule)) fact)
				(progn 
					(dolist (condition (getPremisseRule (symbol-value rule)))
						(setq variablesR (incrementQuestionPriority variablesR (car condition)))))))
    variables-r))
  
(defun incrementQuestionPriority (variables param)
    (let ((variablesR variables)(tmp NIL))
		(dolist (question *questions*)
			(if (eq (getResponse (symbol-value question)) param)
				(if (assoc question variablesR)
					(progn
					(setf tmp (cadr (assoc question variablesR)))
					(setf (cadr (assoc question variablesR)) (+ tmp 1)))
				(pushnew (list question 1) variablesR))))
      variablesR))
  
  
  (format t "~%Lancez le (chainage-avant) ou (chainage-arriere) pour essayer le SE ~%")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;; CHAINAGE AVANT 
  (defun chainageAvant ()
    (let ((end NIL)(depression NIL))
		(loop
			(if (not (askBetterQuestion)) (setq end T)
				(progn 
					(loop (when (not (checkRules)) (return T)))
					(setq depression (checkActivities))
				(if depression (setq end T))))   
			(when end (return depression)))
		(if depression
			(progn (format t "~%~%###################################~%~%Nous avons trouvé la maladie dont vous êtes atteint")
            (format t "~%Il s'agit de la dépression ~S" (getNameDepression (symbol-value activity)))
            (format t "~%~S" (getDescriptionDepression (symbol-value activity))))
			(format t "~%~%###################################~%~%Vous n'avez pas de dépression~%")))
 


;;;;;;;;;;;;;;;;;;;
;; CHAINAGE ARRIERE
;; Indiquez le nom exact de la dépression : exemple> "dépression réactionnelle"
(defun chainageAarriere ()
    (let ((end NIL) (depression NIL))
		(setq *depression* (list (askDepression)))
		(loop
			(if (not (askBetterQuestion)) (setq end T)
				(progn 
					(loop (when (not (checkRules)) (return T)))
					(setq depression (checkDepressions))))   
			(when end (return depression)))
		(if depression
			(format t "~%~%###################################~%~%Vous semblez de bien êtr atteint par cette maladie.")
			(format t "~%~%###################################~%~%Vous n'avez pas cette maladie"))))



;;;;;;;;;;;;;;;;;;;;;;
;; FONCTION PRINCIPALE
(defun runEngine (type)
    (cond 
		((= type 1)
			chainageAarriere)
		((= type 2)
			chainageAvant)
		
