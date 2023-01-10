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
	(write-line "------ Menu ------")
    (terpri)
	(write-line "1. Lancer le système expert")
	(write-line "2. Sortir du système expert")
)

(defun printQuestion(question)
    (terpri)
    (write-string (cadr question))
    (terpri)
    (write-line "Entrez votre réponse :")
    (terpri)
    (let ((userInput (read)))
        (if (funcall (caddr question) userInput) ;; validate user 
            (progn
                (pushnew (list '= (car question) userInput) *BF*))
            (progn
                (write-line "Entrée invalide. Merci d'entrer une valeur proposée dans le menu")
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
                            (let ((indexQuestion 0) (questionsLength (list-length *questions*)))
                                (loop for question in *questions*
                                    do (progn (incf indexQuestion)
                                        (printQuestion question)
                                        (when (runEngine *goal*)
                                            (progn
                                                (terpri)
                                                (write-line "Vous présentez les symptomes d'une dépression.")
                                                (return)))))
                                (if (eq indexQuestion questionsLength) 
                                    (progn 
                                        (terpri)
                                        (write-line "Vous ne présentez pas les symptomes d'une dépression mais vous pouvez consulter un médecin pour confirmer l'analyse de vos symptômes."))))))
                        ((= action 2)
                        (quit))
                        ((write-line "Entrée invalide. Merci d'entrer une valeur proposée dans le menu.")))
            (write-line "Entrée invalide. Merci d'entrer une valeur proposée dans le menu.")))
	(menu)
)

(menu)