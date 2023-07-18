;; Scheme ;;


(define lst
  '((1) 2 (3 4) 5)
)

(define (composed f g)
  'YOUR-CODE-HERE
  (lambda (x)
          (f (g x))
          )
)

(define (remove item lst)
  'YOUR-CODE-HERE
  (if (null? lst)
      lst
      (if (eq? (car lst) item)
          (remove item (cdr lst))
          (cons (car lst) (remove item (cdr lst)))))
)


;;; Tests
(remove 3 nil)
; expect ()
(remove 3 '(1 3 5))
; expect (1 5)
(remove 5 '(5 3 5 5 1 4 5 4))
; expect (3 1 4 4)

(define (no-repeats s)
  'YOUR-CODE-HERE
  (if (null? s)
      s
      (cons (car s) (remove (car s) (no-repeats (cdr s)))))
)

'the following two are interesting

(define (substitute s old new)
  'YOUR-CODE-HERE
  (cond ((null? s) nil)
        ((pair? (car s)) (cons (substitute (car s) old new) 
                                (substitute (cdr s) old new)))
        ((equal? (car s) old) (cons new (substitute (cdr s) old new)))
        (else (cons (car s) (substitute (cdr s) old new)))
        )
)


(define (sub-all s olds news)
  'YOUR-CODE-HERE
  (if (null? olds) 
      s
      (substitute (sub-all s (cdr olds) (cdr news)) (car olds) (car news))
      )
)
;if you switch substitute and sub-all in the last expression
;and change the variables correspondingly,it still works