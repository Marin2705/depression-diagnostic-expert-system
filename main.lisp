;;; import
(load "engine.lisp")

;;;     BUT

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

(defun menu()
	(printMenu)
    (terpri)
    (let ((action (read)))
        (if (numberp action) 
            (cond   ((= action 1)
                        (write-string (verifier *but*)))
                        ((= action 2)
                        (quit))
                        ((write-string "Wrong input. Please try again with a number included in the menu."))
                        )
            (write-string "Wrong input. Please try again with a number included in the menu.")))
	(menu)
)

(menu)