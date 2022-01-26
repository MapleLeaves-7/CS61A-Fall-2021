(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cddr s)))

(define (ordered? s)
    (cond
        ((or (null? (cdr s)) (null? s)) #t)
        ((< (cadr s) (car s)) #f)
        (else (ordered? (cdr s)))
    )
)

(define (square x) (* x x))

(define (pow base exp) 
    (cond
        ((= 1 exp) base)
        ((even? exp) (square (pow base (/ exp 2))))
        (else (* base (pow base (- exp 1))))
    )
)
