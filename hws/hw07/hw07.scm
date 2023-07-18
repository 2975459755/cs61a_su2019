(define (map-stream f s)
    (if (null? s)
    	nil
    	(cons-stream (f (car s)) (map-stream f (cdr-stream s)))))

(define multiples-of-three
  ; 'YOUR-CODE-HERE
  (cons-stream 3 (map-stream (lambda (x) (+ x 3)) multiples-of-three))
)

(define (rle s)
  ; 'YOUR-CODE-HERE
  (define (num s)
    ; (1 1 2 3)->2
    (if (null? s) 
        0
        (if (and (not (null? (cdr-stream s)))
                  (= (car s) (car (cdr-stream s))))
            (+ 1 (num (cdr-stream s)))
            1
            )
        )
    )
  (define (next s x)
    ; (1 1 2 3)->(2 3)
    (if (null? s)
        nil
        (if (= (car s) x)
            (next (cdr-stream s) x)
            s
            )
          )
    )
  (if (null? s)
      nil
      (cons-stream (cons (car s) (cons (num s) nil)) (rle (next s (car s))))
      )
)