;; Chargement des fichiers BR.lisp et BF.lisp
(load "BR.lisp")
(load "BF.lisp")

;; Définition de fonctions pour récupérer les différentes parties d'une règle
(defun cclRule (rule)
  (caddr rule))

(defun premisseRule (rule)
  (cadr rule))

(defun numRules (rule)
  (car rule))

;; Fonction qui vérifie si l'objectif "goal" appartient à la base de faits "BF"
(defun belongs (goal BF)
  (let ((value (cadr (assoc (cadr goal) BF))))
    (if value
        (funcall (car goal) value (caddr goal)))))

;; Fonction qui retourne la liste des règles de la base de règles "BR"
;; dont la conclusion vérifie l'objectif "goal"
(defun candidates_rule (goal BR)
  (if BR
      (let* ((conclusion (cclRule (car BR)))
             (attribut (cadr conclusion))
             (value (caddr conclusion)))
        (if (and (eq attribut (cadr goal))
                 (funcall (car goal) value (caddr goal)))
            (cons (car BR) (candidates_rule goal (cdr BR)))
          (candidates_rule goal (cdr BR))))))

;; Fonction principale de l'algorithme de chaînage avant
(defun runEngine (goal &optional (i 0))
  (let ((BR *BR*) (BF *BF*))
    (if (member goal BF)
        (progn
          (format t "~V@t   But : ~A proof ~%" i goal)
          t)
      (progn
        (let ((rules (candidates_rule goal BR)) (sol nil))
          (while (and rules (not sol))
            (format t "~%~V@t VERIFIE_OU ~A Regles ~s :  ~A ~%" i goal (numRules (car rules)) (car rules))
            (let ((premisses (premisseRule (car rules))))
              (setq sol t)
              (while (and premisses sol)
                (format t "~V@t  ~t VERIFIE_ET premisse ~A~%" (+ 1 i) (car premisses))
                (setq sol (runEngine (pop premisses) (+ 9 i))))
              (if sol
                  (push (numRules (car rules)) sol)
                )))
            (pop rules))
          sol))))
