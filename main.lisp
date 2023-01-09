;;; import
(load "engine.lisp")

; set *goal*

(defparameter *goal* '(= etatDepressif T))

; set *questions*

(defun testHF(x)
    (or (equalp x 'H) (equalp x 'F)))

(defun testTF(x)
    (or (equalp x 'true) (equalp x 'false)))

(defparameter *questions* (list
    '(nombreTroublesPrincipaux "nombre de troubles principaux" numberp)
    '(nombreTroublesSecondaires "nombre de troubles secondaires" numberp)
    '(moisDepuisAccouchement "nombre de mois depuis l'accouchement" numberp)
    '(symptomesPostnatale "nombre de symptomes de la dépression post-natale" numberp)
    '(genre "votre genre ? (H/F)" testHF)
    '(age "votre age ?" numberp)
    '(troublePhysiqueOuCognitif "avez-vous un trouble physique ou cognitif ? (true/false)" testTF)
))

; run engine (with interface) :

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
                            (let ((indexQuestion 0) (questionsLength (list-length *questions*)) (resultEngine NIL))
                                (dolist (question *questions*)
                                    (incf indexQuestion)
                                    (printQuestion question)
                                    (setq resultEngine (runEngine *goal*))
                                    (if resultEngine 
                                        (progn 
                                            (write-line "Vous présentez les symptomes d'une dépression.")
                                            (return-from menu)))) ; TODO : break from dolist/loop, not from the function
                                (write-line "Vous ne présentez pas les symptomes d'une dépression mais vous pouvez consulter un médecin pour confirmer l'analyse de vos symptômes."))))
                        ((= action 2)
                        (quit))
                        ((write-string "Wrong input. Please try again with a number included in the menu."))
                        )
            (write-string "Wrong input. Please try again with a number included in the menu.")))
	(menu)
)

(menu)