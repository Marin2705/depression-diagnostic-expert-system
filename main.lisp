;;; import
(load "engine.lisp")

;;; BUT

(defparameter *but* '(= etatDepressif T))

;;; run engine :

(defun printMenu()
    (terpri)
    (terpri)
	(write-string "------ Choose action: ------")
    (terpri)
	(write-string "1.Start expert system")
    (terpri)
	(write-string "2.Exit program")
    (terpri)
)

;;; questions

(defparameter *questions* (list
    '(nombreTroublesPrincipaux "nombre de troubles principaux" numberp)
    '(nombreTroublesSecondaires "nombre de troubles secondaires" numberp)
    '(moisDepuisAccouchement "nombre de mois depuis l'accouchement" numberp)
    '(symptomesPostnatale "nombre de symptomes de la dépression post-natale" numberp)
    ; (list 'genre "votre genre ? (H/F)" (list 'lambda '(x) (list 'or (list 'equalp 'x "H") (list 'equalp 'x "F")))) ;  (list 'lambda '(x) (list '+ 'x n)))
    '(age "votre age ?" numberp)
    ; '(troublePhysiqueOuCognitif "avez-vous un trouble physique ou cognitif ? (true/false)" (lambda (x) (or (equalp x "true") (equalp x "false"))))
))


(defun printQuestion(question)
    (terpri)
    (write-string (cadr question))
    (terpri)
    (write-string "Type your answer.")
    (terpri)
    (let ((userInput (read)))
        (if (funcall (caddr question) userInput) ;; validate user 
            (progn
                (pushnew (list '= (car question) userInput) *BF*))
            (progn
                (write-string "Wrong input. Please try again.")
                (printQuestion question)
            )
        )
    )
)

(defun menu()
	(printMenu)
    (terpri)
    (let ((action (read)))
        (if (numberp action) 
            (cond   ((= action 1)
                        (progn 
                            (setf *BF* ())
                            (dolist (question *questions*)
                                (printQuestion question)
                            )
                            (write-string (verifier *but*))))
                        ((= action 2)
                        (quit))
                        ((write-string "Wrong input. Please try again with a number included in the menu."))
                        )
            (write-string "Wrong input. Please try again with a number included in the menu.")))
	(menu)
)

(menu)