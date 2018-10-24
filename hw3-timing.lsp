(load "../src/hw3.lsp" )
(load "../src/a-star.lsp" )

(defun run-time-test (test)
  (let* ( ( name (first test ) )
	  ( problem (second test ) ) )
    (print (concatenate 'string "Test H1: " name ) )
    (time (sokoban problem #'h1 ) )
    (print (format t "~%") )
    (print (concatenate 'string "Test HUID: " name ) )

    ;; PUT YOUR UID HERE!
    (time (sokoban problem #'h904631321 ) )
    (print (format t "~%") )
    )
  T
  )
  

(defun run-time-tests (test-list )
  (if (null test-list ) NIL
    (and (run-time-test (first test-list ) ) (run-time-tests (rest test-list ) ) )
    )
  )

(defun test-timing ()
  (run-time-tests  (list (list "p1" p1 )
			 (list "p2" p2 )
			 (list "p3" p3 )
			 (list "p4" p4 )
			 (list "p5" p5 )
			 (list "p6" p6 )
			 (list "p7" p7 )
			 (list "p8" p8 )
			 (list "p9" p9 )
		    )
		  )
  )

(test-timing )
