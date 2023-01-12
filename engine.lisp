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
    (if (funcall (cadr premisse) (symbol-value (car premisse)) (caddr premisse)) 1 0))

(defun desactivateRule (rule)
	(setf *BR* (delete-if #'(lambda (item) (eq item rule)) *BR*)))
	
(defun executeRule (rule)
    (let ((conclusion (getConclusionRule rule)))
		(pushnew conclusion *BF*)))
  
(defun checkRule (rule)
    (let ((desactivate 0)(isTrue 1))
        (dolist (premisse (getPremisseRule rule))
            (if (isFactDefined  (car premisse)) 
                (progn 
                  (setq isTrue (* (checkPremisse premisse) isTrue))
                  (if (= (checkPremisse premisse) 0) (setq desactivate 1)))
                (setq isTrue 0)))
        (if (= isTrue 1) (progn (executeRule rule)(desactivateRule rule))) 
        (if (= desactivate 1)(desactivateRule rule)) 
        isTrue))
		
(defun checkRules ()
    (let ((isTrue NIL))
    (dolist (rule *BR* T)
      (if (= (checkRule rule) 1) (setq isTrue T)))
      isTrue))
	 
	 
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
    (setf *questions* (delete-if #'(lambda (item) (eq item question)) *questions*)))
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;; Définition des fonctions d'accès aux différentes dépressions 
(defun getConditionsDepression (depression)
    (car depression))
	
(defun getNameDepression (depression)
    (cadr depression))
	
(defun getDescriptionDepression (depression)
    (caddr depression))
  
(defun desactiveDepression (depression)
    (setf *depression* (delete-if #'(lambda (item) (eq item depression)) *depression*)))

(defun isFactPossible (fact)
    (let ((possible NIL))
      (dolist (rule *BR*) 
        (if (equal (getConclusionRule rule) fact) (setq possible T)))
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
      (if (checkDepression depression) (setq dep depression)))
    (if (= (length *depression*) 1) (setq dep (car *depression*)))
    dep))

(defun askAllQuestions ()
  (dolist (q *questions*) 
    (askQuestion q)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;; FONCTION PRINCIPALE
;; CHAINAGE AVANT 
(defun chainageAvant ()
  (let ((end NIL)(depression NIL))
  (askAllQuestions)
  (progn 
    (loop (when (not (checkRules)) (return T)))
    (setq depression (checkDepressions)))
  (if depression
    (progn (format t "~%~%Nous avons trouvé la maladie dont vous êtes atteint")
          (format t "~%Il s'agit de la dépression ~S" (getNameDepression depression))
          (format t "~%~S" (getDescriptionDepression depression)))
    (format t "~%Vous n'avez pas de dépression~%"))))
