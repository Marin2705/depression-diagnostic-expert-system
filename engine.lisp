(load "BR.lisp")
(load "BF.lisp")

;;;     FONCTIONS OUTILS

; Premisses d'une regle.
(defun regle-premisse (regle)
    (cadr regle))

; Consequence d'une regle.
; (defun regle-consequence (regle)
;     (car (last regle)))

; Determiner les regles concluant sur un but determine.
; (defun regles-candidates (goal BR)
;     (let (result)
;         (dolist (regle BR (reverse result))
;             (if (member (cadr goal) (regle-consequence regle))
;                 (push regle result)))))

; Determiner si un fait appartient ?la base de fait.
; (defun connu? (fait BF)
;     (if (member fait BF :test 'equal) T NIL))

; Comparer un fait a son premisse de meme type.
(defun eval-fait (fait premisse)
    (if (equal (car premisse) '=)
        (equal (nth 2 fait) (nth 2 premisse))
        (eval (list (car premisse) (nth 2 fait) (nth 2 premisse)))))

; Determiner si une règle est déclenchable c'est à dire que l'attribut est 
; trouvable dans la BF et qu'il est vérifié par eval-fait.
; (defun declenchable (premisse BF)
;     (let ((OK NIL))
;         (dolist (fait BF OK)
;             (if (member (nth 1 premisse) fait :test 'equal)
;                 (setq OK (eval-fait fait premisse))))))


(defun isPremisseInBF (premisse BF)
    (let ((OK NIL))
        (dolist (fait BF OK)
            (if (member (nth 1 premisse) fait :test 'equal)
                (setq OK 
                    (if (equal (car premisse) '=)
                        (equal (nth 2 fait) (nth 2 premisse))
                        (eval (list (car premisse) (nth 2 fait) (nth 2 premisse)))))))))


; Moteur d'inférence, chaine arrière

(defun runEngine (goal)
    (let (EC (BR *BR*) (BF *BF*) premissesValides regleCourante)
        (loop
            ; (format t "~%BF: ~a~%~%" BF)
            (if (member goal BF :test 'equal)
                (return T) ; engine found goal in BF
                (dolist (regle BR)
                    (dolist (premisse (cadr regle))
                        (setq premissesValides T)
                        (when (not (isPremisseInBF premisse BF))
                            (setq premissesValides NIL)))
                    (if premissesValides
                    (progn
                        (push regle EC)
                        (setq BR (remove regle BR))))))
            ; (format t "~%EC: ~a~%" EC)
            (if EC
                (progn
                    (setq regleCourante (pop EC))
                    (pushnew (car (last regleCourante)) BF))
                    (return NIL))))) ; engine did not find goal in BF