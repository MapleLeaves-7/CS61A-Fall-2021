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
  (if (= n 0)
    start
    (merger (term n) (accumulate merger start (- n 1) term))
  )  
)

(define (no-repeats lst)
  (if (or (null? lst) (null? (cdr lst)))
    lst
    (cons (car lst) (no-repeats (my-filter (lambda (x) (not (= (car lst) x))) (cdr lst))))
  )
)
