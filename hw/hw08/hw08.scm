(define (my-filter func lst) 
  (cond
    ((null? lst) lst)
    ((func (car lst)) (cons (car lst) (my-filter func (cdr lst))))
    (else (my-filter func (cdr lst)))
  )
)

(define (interleave s1 s2) 
  (if (null? s1) 
      (if (null? s2) nil s2)
    (cons (car s1) (interleave s2 (cdr s1)))
  )
)

(define (accumulate merger start n term)
  'YOUR-CODE-HERE)

(define (no-repeats lst) 'YOUR-CODE-HERE)
