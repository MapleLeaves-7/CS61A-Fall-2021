(define (split-at lst n)
    (cond
        ((= n 0) (cons nil lst))
        ((null? lst) (cons lst nil))
        (else
            (define prev (split-at (cdr lst) (- n 1)))
            (cons (cons (car lst) (car prev)) (cdr prev))
        )
    )
)

(define (compose-all funcs)
    (define (func-to-return x)
        (define (apply-all x funcs)
            (if (null? funcs) 
                x
                (apply-all ((car funcs) x) (cdr funcs))
            )
        )
        (apply-all x funcs)
    )
    func-to-return
)
