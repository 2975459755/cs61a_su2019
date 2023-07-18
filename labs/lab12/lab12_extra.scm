(define-macro (switch expr cases)
    'YOUR-CODE-HERE
    (if (null? cases)
        nil
        (if (equal? expr (car (car cases)))
            (car (cdr (car cases)))
            (switch expr (cdr cases))
            )
        )
)

(define (flatmap f x)
  'YOUR-CODE-HERE
  (define (tail-r f x res)
    (if (null? x)
        res
        (tail-r f (cdr x) (append res (f (car x))))
        )
    )
  (tail-r f x '())
  ; (if (null? x)
  ;     nil
  ;     (append (f (car x))
  ;             (flatmap f (cdr x))
  ;             )
  ;     )
  )

(define (expand lst)
  'YOUR-CODE-HERE
  (define (expd char)
    (cond ((equal? char 'x) '(x r y f r))
          ((equal? char 'y) '(l f x l y))
          (else (list char))
          )
    )
  (flatmap expd lst)
  )

(define (interpret instr dist)
  'YOUR-CODE-HERE
  (define (helper char)
  (cond ((equal? char 'f) (forward dist))
        ((equal? char 'l) (left 90))
        ((equal? char 'r) (right 90))
        )
  )
  (map helper instr)
  )

(define (apply-many n f x)
  (if (zero? n)
      x
      (apply-many (- n 1) f (f x))))

(define (dragon n d)
  (interpret (apply-many n expand '(f x)) d))