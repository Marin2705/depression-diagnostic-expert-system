(load "BR.lisp")
(load "BF.lisp")

;;;     FONCTIONS OUTILS

; Premisses d'une regle.
(defun regle-premisse (regle)
    (cadr regle))

; Consequence d'une regle.
(defun regle-consequence (regle)
    (car (last regle)))

; Determiner les regles concluant sur un but determine.
(defun regles-candidates (but BR)
    (let (result)
        (dolist (regle BR (reverse result))
            (if (member (cadr but) (regle-consequence regle))
                (push regle result)))))

; Determiner si un fait appartient ?la base de fait.
(defun connu? (fait BF)
    (if (member fait BF :test 'equal) T NIL))

; Comparer un fait a son premisse de meme type.
(defun eval-fait (fait premisse)
    (if (equal (car premisse) '=)
        (equal (nth 2 fait) (nth 2 premisse))
        (eval (list (car premisse) (nth 2 fait) (nth 2 premisse)))))

; Determiner si une règle est déclenchable c'est à dire que l'attribut est 
; trouvable dans la BF et qu'il est vérifié par eval-fait.
(defun declenchable (premisse BF)
    (let ((OK NIL))
        (dolist (fait BF OK)
            (if (member (nth 1 premisse) fait :test 'equal)
                (setq OK (eval-fait fait premisse))))))


;;;     MOTEUR D'INFERENCE EN CHAINAGE ARRIERE

(defun verifier (but)
    (let (EC (BR *BR*) (BF *BF*) premissesValides regleCourante)
        (loop
            (format t "~%BF: ~a~%~%" BF)
            (if (connu? but BF)
                (return "Vous présentez les symptomes d'une dépression.")
                (dolist (regle BR)
                    (dolist (premisse (regle-premisse regle))
                        (setq premissesValides T)
                        (when (not (declenchable premisse BF))
                            (setq premissesValides NIL)))
                    (if premissesValides
                    (progn
                        (push regle EC)
                        (setq BR (remove regle BR))))))
            (format t "~%EC: ~a~%" EC)
            (if EC
                (progn
                    (setq regleCourante (pop EC))
                    (pushnew (regle-consequence regleCourante) BF))
                (return "Vous ne présentez pas les symptomes d'une dépression mais vous pouvez consulter un médecin pour confirmer l'analyse de vos symptômes.")))))