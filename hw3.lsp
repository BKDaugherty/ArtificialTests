;; Loads utility test functions
(load "./common.lsp" )

(defun refresh3 ()
  (load "./hw3.lsp" )
  (load "../src/hw3.lsp" ) 
  (load "../src/a-star.lsp" )
  )

;; Probably useful here to define some basic states
;; assume that we have defined global variables


(defun TEST-GOAL-TEST ()
  (EXPECT (goal-test example-test-state-1) NIL )
  (EXPECT (goal-test example-test-state-2) NIL )
  (EXPECT (goal-test example-test-state-3) NIL )
  (EXPECT (goal-test example-test-state-4) NIL )
)

(defun TEST-NEXT-STATE ()
  (EXPECT (next-states example-test-state-1 ) example-next-state-1 )
  (EXPECT (next-states example-test-state-2 ) example-next-state-2 )
  (EXPECT (next-states example-test-state-3 ) example-next-state-3 )
  (EXPECT (next-states example-test-state-4 ) example-next-state-4 )
)
  
(defun TEST-H0 ()
  (EXPECT (h0 ) 0 )
  )

(defun TEST-H1 () NIL )

(defun TEST-H904631321 () NIL )


(defun TEST-HW3 ()
  (TEST-GOAL-TEST )
  (TEST-NEXT-STATE )
  (TEST-H0 )
  (TEST-H1 )
  (TEST-H904631321 )
  )



(setq example-test-state-1 '((1 1 1 1 1)
 (1 4 0 4 1)
 (1 0 2 0 1)
 (1 0 3 0 1)
 (1 0 0 0 1)
 (1 1 1 1 1)
 ))

(setq example-next-state-1 
(((1 1 1 1 1) (1 4 2 4 1) (1 0 3 0 1) (1 0 0 0 1) (1 0 0 0 1) (1 1 1 1 1))
((1 1 1 1 1) (1 4 0 4 1) (1 0 2 0 1) (1 0 0 3 1) (1 0 0 0 1) (1 1 1 1 1))
((1 1 1 1 1) (1 4 0 4 1) (1 0 2 0 1) (1 0 0 0 1) (1 0 3 0 1) (1 1 1 1 1))
((1 1 1 1 1) (1 4 0 4 1) (1 0 2 0 1) (1 3 0 0 1) (1 0 0 0 1) (1 1 1 1 1))) )

(setq example-test-state-2 '((1 1 1 1 1)
 (1 0 0 4 1)
 (1 0 2 3 1)
 (1 0 0 0 1)
 (1 4 0 0 1)
 (1 1 1 1 1)
 ))

(setq example-next-state-2
      (((1 1 1 1 1) (1 0 0 6 1) (1 0 2 0 1) (1 0 0 0 1) (1 4 0 0 1) (1 1 1 1 1))
((1 1 1 1 1) (1 0 0 4 1) (1 0 2 0 1) (1 0 0 3 1) (1 4 0 0 1) (1 1 1 1 1))
((1 1 1 1 1) (1 0 0 4 1) (1 2 3 0 1) (1 0 0 0 1) (1 4 0 0 1) (1 1 1 1 1))) )

(setq example-test-state-3 '((1 1 1 1 1)
 (1 0 0 6 1)
 (1 0 2 0 1)
 (1 0 0 0 1)
 (1 0 0 4 1)
 (1 1 1 1 1)
 ))

(setq example-next-state-3 (((1 1 1 1 1) (1 0 0 4 1) (1 0 2 3 1) (1 0 0 0 1) (1 0 0 4 1) (1 1 1 1 1))
			    ((1 1 1 1 1) (1 0 3 4 1) (1 0 2 0 1) (1 0 0 0 1) (1 0 0 4 1) (1 1 1 1 1))) )

(setq example-test-state-4 '((1 1 1 1 1)
 (1 4 2 4 1)
 (1 0 0 0 1)
 (1 0 0 0 1)
 (1 0 5 3 1)
 (1 1 1 1 1)
 ))

(setq example-next-state-4 (((1 1 1 1 1) (1 4 2 4 1) (1 0 0 0 1) (1 0 0 3 1) (1 0 5 0 1) (1 1 1 1 1))
			    ((1 1 1 1 1) (1 4 2 4 1) (1 0 0 0 1) (1 0 0 0 1) (1 2 6 0 1) (1 1 1 1 1))) )


