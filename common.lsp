(defun REFRESH ()
  (load "../src/hw1.lsp" )
  (load "./hw1.lsp" )
  (load "./hw2.lsp" )
  (load "../src/hw2.lsp" )
  )


(defun EXPECT ( expression output )
  (if (equal expression output ) T (and
				    (print "Failure, expected:" )
				    (print output )
				    (print "Got:" )
				    (print expression )
				    )
      )
   )
