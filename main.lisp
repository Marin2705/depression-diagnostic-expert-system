;;; import
(load "engine.lisp")
(load "questions.lisp")

; set *goal*

(defparameter *goal* '(= etatDepressif T))

; run engine (with interface) :

(defun printMenu()
    (terpri)
	(write-line "------ Menu ------")
    (terpri)
	(write-line "1. Lancer le système expert")
	(write-line "2. Sortir du système expert"))

(defun printQuestion(question)
    (terpri)
    (dolist (text (cadr question))
        (write-line text))
    (terpri)
    (write-string "Réponses possibles : ")
    (if (listp (caddr question))
        (dolist (possibleAnswer (caddr question))
            (format t "~%- ~a" possibleAnswer))
        (write-string (caddr question)))
    (terpri)
    (write-line "Entrez votre réponse :")
    (terpri)
    (let ((userInput (read)) (answerValue))
        ;; validate user input and push to BF
        (if (listp (caddr question))
            (dolist (possibleAnswer (caddr question))
                (if (eq userInput possibleAnswer)
                    (progn
                        (pushnew (list '= (car question) NIL) *BF*)
                        (return-from printQuestion))))
            (if (funcall (nth 3 question) userInput)
                (progn
                    (pushnew (list '= (car question) userInput) *BF*)
                    (return-from printQuestion))))
        (write-line "Entrée invalide. Merci d'entrer une valeur proposée dans le menu")
        (printQuestion question)))

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
	(menu))

(menu)