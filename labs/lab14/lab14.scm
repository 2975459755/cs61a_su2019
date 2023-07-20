; Lab 14: Final Review

(define (compose-all funcs)
  'YOUR-CODE-HERE
  ;reversed(incomplete):
  ; (if (null? funcs)
  ;     (lambda (x) x)
  ;     ((car funcs) (compose-all (cdr funcs)))
  ;     )
  (define (helper funcs res)
    (if (null? funcs)
        res
        (helper (cdr funcs) ((car funcs) res))
        )
    )
  (lambda (x) (helper funcs x))
)

(define (has-cycle? s)
  (define (pair-tracker seen-so-far curr)
    (cond ((null? curr) #f)
          ((contains? seen-so-far (car curr)) #t)
          (else (pair-tracker (cons (car curr) seen-so-far) (cdr-stream curr)))
          )
    )
  (pair-tracker nil s)
)

(define (contains? lst s)
  'YOUR-CODE-HERE
  (cond ((null? lst) #f)
        ((eq? (car lst) s) #t)
        (else (contains? (cdr lst) s))
        )
)