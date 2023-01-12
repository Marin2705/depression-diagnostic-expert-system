;;; import
(load "engine.lisp")

(defun printMenu()
    (terpri)
	(write-line "------ Menu ------")
    (terpri)
	(write-line "1. Lancer le système expert")
	(write-line "2. Sortir du système expert"))
	
(defun printMenuExpertType()
    (terpri)
	(write-line "------ Menu ------")
    (terpri)
	(write-line "1. Lancer une recherche de chaînage arrière")
	(write-line "2. Lancer une recherche de chaînage avant"))

(defun menu()
	(printMenu)
    (terpri)
    (let ((action (read)))
        (if (numberp action) 
            (cond 
				((= action 1)
					(chainageAvant))
				((= action 2)
					(quit)))
				(write-line "Entrée invalide. Merci d'entrer une valeur proposée dans le menu.")))
	(load "BF.lisp")
	(load "BR.lisp")
	(load "depression.lisp")
	(load "questions.lisp")
	(menu))

;; Lancement :
(format t "~%Bienvenue au cabinet...")
(menu)
