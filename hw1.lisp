; Change these to point to your files!
(defun REFRESH ()
  (load "../src/hw1.lisp" )
  (load "./hw1.lisp" )
)

(defun EXPECT ( expression output )
  (if (equal expression output ) T (print "FAILURE" ) )
)

(defun TEST-TREE-CONTAINS ()
   (EXPECT (TREE-CONTAINS 3 '((1 2 3) 7 8)) T ) 
   (EXPECT (TREE-CONTAINS 4 '((1 2 3) 7 8)) NIL )
   (EXPECT (TREE-CONTAINS 3 '(1 4 2)) NIL )
  )

(defun TEST-TREE-MIN ()
  (EXPECT (TREE-MIN '( ( 1 2 3 ) 7 8 ) ) 1 )
)

(defun TEST-TREE-ORDER ()
  (EXPECT (TREE-ORDER 3 ) '( 3 ) )
  (EXPECT (TREE-ORDER '( ( 1 2 3 ) 7 8 ) ) '( 7 2 1 3 8 ) )
)

(defun TEST-SUB-LIST ()
  (EXPECT (SUB-LIST '( a b c d ) 0 3 ) '( a b c ) )
  (EXPECT (SUB-LIST '( a b c d ) 3 1 ) '(d) )
  (EXPECT (SUB-LIST '( a b c d ) 2 0 ) NIL )
)

(defun TEST-SPLIT-LIST ()
  (EXPECT (SPLIT-LIST '( a b c d ) ) '( ( a b ) ( c d ) ) )
  (EXPECT (SPLIT-LIST '( a b c d e ) ) '( ( a b c ) ( d e ) ) ) 
  (EXPECT (SPLIT-LIST '( a b c d e f ) ) '( ( a b c ) ( d e f ) ) )
  )

(defun TEST-BTREE-HEIGHT ()
  (EXPECT (BTREE-HEIGHT 1) 0 )
  (EXPECT (BTREE-HEIGHT '(1 2)) 1 )
  (EXPECT (BTREE-HEIGHT '(1 (2 3))) 2 )
  (EXPECT (BTREE-HEIGHT '((1 2) (3 4))) 2 )
  (EXPECT (BTREE-HEIGHT '((1 (2 3)) ((4 5) (6 7)))) 3 )
  (EXPECT (BTREE-HEIGHT '(((1 2) (3 4)) ((5 6) (7 8)))) 3 )
  )

(defun TEST-LIST2BTREE ()
  ( EXPECT (LIST2BTREE '( 1 ) ) 1 )
  ( EXPECT (LIST2BTREE '( 1 2 ) ) '( 1 2 ) )
  ( EXPECT (LIST2BTREE '( 1 2 3 ) ) '( ( 1 2 ) 3 ) )
  ( EXPECT (LIST2BTREE '( 1 2 3 4 ) ) '( ( 1 2 ) ( 3 4 ) ) )
  ( EXPECT (LIST2BTREE '( 1 2 3 4 5 6 7 ) ) '( ( ( 1 2 ) ( 3 4 ) ) ( ( 5 6 ) 7 ) ) )
  ( EXPECT (LIST2BTREE '( 1 2 3 4 5 6 7 8 ) ) '(((1 2) (3 4)) ((5 6) (7 8))) )
)

(defun TEST-BTREE2LIST ()
  (EXPECT (BTREE2LIST 1) '(1) )
  (EXPECT (BTREE2LIST '(1 2)) '(1 2) )
  (EXPECT (BTREE2LIST '((1 2) 3)) '(1 2 3) )
  (EXPECT (BTREE2LIST '((1 2) (3 4))) '(1 2 3 4) ) 
  (EXPECT (BTREE2LIST '(((1 2) (3 4)) ((5 6) 7))) '(1 2 3 4 5 6 7) )
  (EXPECT (BTREE2LIST '(((1 2) (3 4)) ((5 6) (7 8)))) '(1 2 3 4 5 6 7 8) )
  )

(defun TEST-IS-SAME ()
  (EXPECT (IS-SAME '((1 2 3) 7 8) '((1 2 3) 7 8)) T )
  (EXPECT (IS-SAME '(1 2 3 7 8) '((1 2 3) 7 8)) NIL )
  )

(defun TEST-HW1 ()
  (TEST-TREE-CONTAINS )
  (TEST-TREE-MIN)
  (TEST-TREE-ORDER )
  (TEST-SUB-LIST )
  (TEST-SPLIT-LIST )
  (TEST-BTREE-HEIGHT )
  (TEST-BTREE2LIST )
  (TEST-IS-SAME )
  (TEST-LIST2BTREE )
)
