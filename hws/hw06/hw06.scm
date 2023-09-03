;Q4 is hard, Q8 is interesting

;;;;;;;;;;;;;;;
;; Questions ;;
;;;;;;;;;;;;;;;

; Scheme

(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  'YOUR-CODE-HERE
  (car (cdr s))
)

(define (caddr s)
  'YOUR-CODE-HERE
  (car (cddr s))
)

(define (unique s)
  'YOUR-CODE-HERE
  (define (filter s x)
          (cond ((null? s) nil)
                ((eq? (car s) x) (filter (cdr s) x))
                (else (cons (car s) (filter (cdr s) x)))
                )
      )
  (if (null? s)
      nil
      (cons (car s) (unique (filter (cdr s) (car s))))
      )
)

(define (cons-all first rests)
  (define (map f lst)
    (if (null? lst)
        nil
        (cons (f (car lst)) (map f (cdr lst)))
        )
    )
  (define (appl x)
    (lambda (s)
      (cons x s))
    )
  (map (appl first) rests)
  )

;; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
  'YOUR-CODE-HERE
  (define (append first last)
    (cond ((null? first) last)
          (else (cons (car first) (append (cdr first) last)))
          )
    )
  ;concatenate two lists
  ; (append '(1) '(2))
  ; > (1 2)
  ; (append '(1) nil)
  ; > (1)
  ; (append '(1) 2)
  ; Error
  (If (null? denoms)
      nil
      (cond ((= total 0) '(()) )
            ((< total (car denoms)) (list-change total (cdr denoms)))
            (else (append (cons-all (car denoms) 
                                    (list-change (- total (car denoms)) denoms)
                                    )
                          (list-change total (cdr denoms))
                          )
                  )
            )
      )

  )
; This problem is HARD !!!

; My original thoughts:
; (define (list-change total denoms)
;   (define (make-change total denoms)
;     (define (change total denoms lst)
;       (cond ((= total 0) lst)
;             ((< total (car denoms)) nil)
;             (else (change (- total (car denoms))
;                           denoms
;                           (append lst (cons (car denoms) nil))))
;             )
;       )
; ;///Here I sit, broken-hearted :( \\\
;     )
;   (if (null? denoms) 
;       nil
;       (append (make-change total denoms) (list-change total (cdr denoms)))
;       )
;   )

; Tail recursion

(define (replicate x n)
  'YOUR-CODE-HERE
  (define (tail x n lst)
    (if (= n 0)
        lst
        (tail x (- n 1) (cons x lst)))
    )
  (tail x n nil)
  )

(define (accumulate combiner start n term)
  'YOUR-CODE-HERE
  (define (helper num)
    (if (= num n)
        (term n)
        (combiner (term num) (helper (+ 1 num)))
        )
    )
  (combiner start (helper 1))
)

(define (accumulate-tail combiner start n term)
  'YOUR-CODE-HERE
  (define (helper num res)
    (if (> num n)
        res
        (helper (+ num 1) (combiner res (term num)))
        )
    )
  (combiner (helper 1 start))
)


; Macros

(define-macro (list-of map-expr for var in lst if filter-expr)
  'YOUR-CODE-HERE
  ; why? SchemeError: argument 0 of car has wrong type (nil)
  ; ?possible answer: lst is not evaled when lst is type of '(1 2)
  ; (if (null? lst)
  ;     nil
  ;     (if ((lambda (var) filter-expr) (car lst))
  ;         `(cons ((lambda (,var) ,map-expr) (car ,lst)) 
  ;                (list-of ,map-expr for ,var in (cdr ,lst) if ,filter-expr)
  ;               )
  ;         `(list-of ,map-expr for ,var in (cdr ,lst) if ,filter-expr)
  ;         )
  ;     )
  `(map (lambda (,var) ,map-expr) (filter (lambda (,var) ,filter-expr) ,lst))
)