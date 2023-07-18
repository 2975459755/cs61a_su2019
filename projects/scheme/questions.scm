(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))



;; Problem 17
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 17
  (define (helper s n)
    (if (null? s)
        '()
        (append (cons (cons n (cons (car s) nil)) nil)
                (helper (cdr s) (+ 1 n))
                )
        )
    )
  (helper s 0)
  )
  ; END PROBLEM 17

;; Problem 18

(define (zip pairs)
  ; BEGIN PROBLEM 18
  (cons (map car pairs)
        (cons
             (map (lambda (x) (car (cdr x))) pairs)
             nil
             )
        )

  ; (if (null? pairs)
  ;     '(() ())
  ;     (cons (cons (car (car pairs))
  ;                 (car (zip (cdr pairs)))
  ;                 )
  ;           (cons
  ;                 (cons (car (cdr (car pairs)))
  ;                       (car (cdr (zip (cdr pairs))))
  ;                       )
  ;                 nil
  ;                 )
  ;           )
  ;     )

  ; (cons PairA (cons PairB nil))
  )
  ; END PROBLEM 18


;; Problem 19
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM 19
         expr
         ; END PROBLEM 19
         )
        ((quoted? expr)
         ; BEGIN PROBLEM 19
          (cons 'quote (cdr expr))
         ; END PROBLEM 19
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
           (append `(,form ,(map let-to-lambda params))
                  (map let-to-lambda body))
           ; END PROBLEM 19
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
           (cons
              (append
                      `(lambda ,(map let-to-lambda (car (zip values))))
                      (map let-to-lambda body))
              (map let-to-lambda (cadr (zip values))))
           ; END PROBLEM 19
           ))
        (else
         ; BEGIN PROBLEM 19
         (map let-to-lambda expr)
         ; END PROBLEM 19
         )))
