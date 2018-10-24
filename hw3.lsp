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
  (EXPECT (goal-test '( (1 1 1 1 ) (1 1 1 1 ) ) ) T )
)

(defun TEST-NEXT-STATE ()
  (EXPECT (next-states example-test-state-1 ) example-next-state-1 )
  (EXPECT (next-states example-test-state-2 ) example-next-state-2 )
  (EXPECT (next-states example-test-state-3 ) example-next-state-3 )
  (EXPECT (next-states example-test-state-4 ) example-next-state-4 )
  )

(defun TEST-GET-SQUARE ()
  (EXPECT (get-square example-test-state-1 1 1 ) star )
  (EXPECT (get-square example-test-state-1 0 0 ) wall )
  (EXPECT (get-square example-test-state-1 0 1 ) wall )
  (EXPECT (get-square example-test-state-1 10 10 ) wall )
  )

(defun TEST-SET-SQUARE-BY-ROW ()
  (EXPECT (set-square-by-row '(1 1 1 1 ) 2 5 ) '(1 1 5 1 ) )
  )

;; Check that input state is not modified
(defun TEST-SET-SQUARE ()
    (let* ( ( test-state '( ( 1 1 1 ) ( 1 1 1 ) ) ) )
    (and (EXPECT (set-square test-state 1 2 7 )
		 '( ( 1 1 1 ) ( 1 1 7 ) ) )
	 (EXPECT (set-square test-state 0 0 9 )
		 '( ( 9 1 1 ) ( 1 1 1 ) ) )
	 )
    )
)
  
(defun TEST-H0 ()
  (EXPECT (h0 NIL) 0 )
  )

(defun TEST-COUNT-ELEMENT ()
  (let* ( ( state '( ( 1 1 2 ) (3 4 5 ) (6 6 6 ) ) ) )
    (EXPECT (count-element state 1 ) 2 )
    (EXPECT (count-element state 2 ) 1 )
    (EXPECT (count-element state 6 ) 3 )
    (EXPECT (count-element state 7 ) 0 )
    (EXPECT (count-element NIL 0 ) 0 )
    )
  )

(defun TEST-H1 ()
  (EXPECT (h1 p1) 1 )
  (EXPECT (h1 p2) 1 )
  (EXPECT (h1 p3) 1 )
  (EXPECT (h1 p4) 1 )
  (EXPECT (h1 p5) 2 )
  (EXPECT (h1 p6) 2 )
  (EXPECT (h1 p7) 1 )
  (EXPECT (h1 p8) 3 )
  (EXPECT (h1 p9) 2 )
  (EXPECT (h1 p10) 3 )
  (EXPECT (h1 p11) 3 )
  (EXPECT (h1 p12) 1 )
  )

(defun TEST-H904631321 () NIL )

(defun TEST-ADD-POS ()
  (EXPECT (add-pos '( 1 0 ) '(2 0 ) ) '( 3 0 ) )
  (EXPECT (add-pos '( 0 -1 ) '(2 0 ) ) '( 2 -1 ) )
  (EXPECT (add-pos '( 0 1 ) '(2 0 ) ) '( 2 1 ) )
  (EXPECT (add-pos '(-1 0 ) '(2 0 ) ) '( 1 0 ) )
  )

(defun TEST-IS-INVALID-MOVE ()
  (EXPECT (IS-INVALID-MOVE '((1 3 0 )) '(1 0 ) '(-1 0 ) ) T )
  (EXPECT (IS-INVALID-MOVE '((1 3 0 )) '(1 0 ) '(1 0 ) ) NIL )
  (EXPECT (IS-INVALID-MOVE '((4 5 6 )) '(2 0 ) '(-1 0 ) ) NIL )
  
  )

(defun TEST-IS-VALID-MOVE ()
  (let* ( ( s '( ( 0 1 0 1 )
		( 0 3 5 4 )
		( 0 4 1 1 )
		( 0 0 1 1 ) ) )
	  ( left '( -1 0 ) )
	  ( right '( 1 0 ) )
	  ( down '( 0 1 ) )
	  ( up '( 0 -1 ) )
	  ( keeperPos '( 1 1 ) ) )
    (EXPECT (is-valid-move s keeperPos left ) T )
    (EXPECT (is-valid-move s keeperPos right ) T )
    (EXPECT (is-valid-move s keeperPos down ) T )
    (EXPECT (is-valid-move s keeperPos up ) NIL ) ) 
  )

;; Tests my auxiliary functions for hw3
(defun TEST-HW3-AUX ()
  (TEST-GET-SQUARE )
  (TEST-SET-SQUARE-BY-ROW )
  (TEST-SET-SQUARE )
  (TEST-ADD-POS )
  )

;; Tests the required functions for hw3
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
'(((1 1 1 1 1) (1 4 2 4 1) (1 0 3 0 1) (1 0 0 0 1) (1 0 0 0 1) (1 1 1 1 1))
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
      '(((1 1 1 1 1) (1 0 0 6 1) (1 0 2 0 1) (1 0 0 0 1) (1 4 0 0 1) (1 1 1 1 1))
((1 1 1 1 1) (1 0 0 4 1) (1 0 2 0 1) (1 0 0 3 1) (1 4 0 0 1) (1 1 1 1 1))
((1 1 1 1 1) (1 0 0 4 1) (1 2 3 0 1) (1 0 0 0 1) (1 4 0 0 1) (1 1 1 1 1)) ) )

(setq example-test-state-3 '((1 1 1 1 1)
 (1 0 0 6 1)
 (1 0 2 0 1)
 (1 0 0 0 1)
 (1 0 0 4 1)
 (1 1 1 1 1)
 ))

(setq example-next-state-3 '(((1 1 1 1 1) (1 0 0 4 1) (1 0 2 3 1) (1 0 0 0 1) (1 0 0 4 1) (1 1 1 1 1))
			    ((1 1 1 1 1) (1 0 3 4 1) (1 0 2 0 1) (1 0 0 0 1) (1 0 0 4 1) (1 1 1 1 1))) )

(setq example-test-state-4 '((1 1 1 1 1)
 (1 4 2 4 1)
 (1 0 0 0 1)
 (1 0 0 0 1)
 (1 0 5 3 1)
 (1 1 1 1 1)
 ))

(setq example-next-state-4 '(((1 1 1 1 1) (1 4 2 4 1) (1 0 0 0 1) (1 0 0 3 1) (1 0 5 0 1) (1 1 1 1 1))
			    ((1 1 1 1 1) (1 4 2 4 1) (1 0 0 0 1) (1 0 0 0 1) (1 2 6 0 1) (1 1 1 1 1))) )


(defun test-next-state-interactive ()
  (let* ( ( state-1 '( (1 0 1) (0 3 0) (1 0 1 ) ) )
	  ( next-state-1 (next-states state-1 ) )
	  ( state-2 '( (1 0 1 ) (0 2 3 ) (1 1 0 ) ) )
	  ( next-state-2 (next-states state-2 ) )
	  ( state-3 '( (1 4 1) ( 1 5 1 ) (1 6 1) ) )
	  ( next-state-3 (next-states state-3 ) )
	  ( state-4 '( (1 4 1) ( 1 6 1 ) ) )
	  ( next-state-4 (next-states state-4 ) )
	  ( state-5 '( (1 0 1 ) (1 2 1 ) (1 3 1 ) ) )
	  ( next-state-5 (next-states state-5 ) )

	  )
    (EXPECT next-state-1 '( ( (1 3 1) (0 0 0) (1 0 1) ) ((1 0 1) (0 0 0) (1 3 1)) ((1 0 1) (3 0 0) (1 0 1)) ((1 0 1) (0 0 3) (1 0 1)) ) )
    (EXPECT next-state-2 '(((1 0 1) (0 2 0) (1 1 3)) ((1 0 1) (2 3 0) (1 1 0))))
    (EXPECT next-state-3 '( ((1 5 1) (1 6 1 ) (1 4 1 ) ) ) )
    (EXPECT next-state-4 '( ((1 6 1 ) (1 4 1) ) ) )
    (EXPECT next-state-5 '( ((1 2 1) (1 3 1 ) (1 0 1 ) ) ) )
    )
  )
	    
(defun TEST-HW3-ALL ()
  (TEST-HW3)
  (TEST-HW3-AUX )
  )
	  
