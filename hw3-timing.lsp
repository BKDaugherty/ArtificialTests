(load "../src/hw3.lsp" )
(load "../src/a-star.lsp" )

(defun run-heuristic (h heuristic-name test )
  (let* ( (test-name (concatenate 'string "TEST: " heuristic-name " for " (first test ) ) )
	  (problem (second test ) ) )
    (print test-name )
    (time (sokoban problem h ) )
    (print (format t "~%") )
    )
)
		   

(defun run-time-test (test)
  (let* ( ( name (first test ) )
	  ( problem (second test ) ) )
    ;; (run-heuristic #'h1 "h1" test )
    ;; (run-heuristic #'h2 "h2" test )
    ;; (run-heuristic #'h3 "h3" test )
    (run-heuristic #'h904631321 "hUID" test )
    (run-heuristic #'h6 "h6" test )
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
			 (list "p10" p10 )
			 (list "p11" p11 )
			 (list "p12" p12 )
;;			 (list "p13" p13 )
;;			 (list "p14" p14 )
;;			 (list "p15" p15 )

		    )
		  )
  )

(test-timing )
