#lang racket
#|
|#







#|
(define (zero) '())
(define (inc n) (cons 'o n))
(define (dec n) (cdr n))

(zero)
(inc(zero))
(inc(inc(zero)))

(define (add x y)
  (if (null? y)
    x
    (add
      (inc x)
      (dec y)
    )
  )
)

(add '(o o) '(o o o))
(add
  (inc(zero))
  (inc(inc(zero)))
)


(define (sub x y)
  (cond
    ((null? x) x)
    ((null? y) x)
    (else
      (sub
        (dec x)
        (dec y)
      )
    )
  )
)

(sub
  (inc(inc(zero)))
  (inc(inc(inc(zero))))
)

(sub
  (inc(inc(inc(zero))))
  (inc(inc(zero)))
)


(define (mul x y)
  (muli x y (zero))
)
(define (muli x y n)
  (if (null? y)
    n
    (muli
      x
      (dec y)
      (add n x)
    )
  )
)

(mul
  (inc(inc(zero)))
  (inc(inc(inc(zero))))
)

;(define (muli x y n)  (if (null? y)    n    (muli      x      (dec y)      (add n x)    )  ))
|#



#|
(define (g l)
  (if (null? l)
    '()
    (cons
      (+ 1 (car l))
      (g (cdr l))
    )
  )
)

(g '(1 2 3))

(map
  (lambda (x)
    (+ 1 x)
  )
  '(1 2 3)
)

(define (map0 l)
  (if (null? l)
    '()
    (cons
      (car l)
      (map1 map0 (cdr l))
    )
  )
)


(define map1
  (lambda (f l)
    (if (null? l)
      '()
      (cons
        (f (car l))
        (map1 f (cdr l))
      )
    )
  )
)

;(define map1  (lambda (f l)    (if (null? l)      '()      (cons        (f (car l))        (map1 f (cdr l))      )    )  ))

|#




#|
(define (f g n l) (fi g l n))
(define (fi g l x)
  (if (null? l)
    x
    (fi
      g
      (cdr l)
      (g x (car l))
    )
  )
)

(f + 0 '(5 2 7))
(f * 1 '(5 2 7))

(map
  (lambda (n)
    (* n n)
  )
  '(3 4 5)
)

(map
  *
  '(3 4 5)
  '(3 4 5)
)
|#




#|
(define (sum l) (sumi l 0))
(define (sumi l x)
  (if (null? l)
    x
    (sumi
      (cdr l)
      (+ x (car l))
    )
  )
)

(sum '(1 2 3))
|#


#|
(define (rev l) (revi l '()))
(define (revi l x)
  (if (null? l)
    x
    (revi (cdr l) (cons (car l) x) )
  )
)
(rev '(a b c))
|#



#|
(define (repl)
  (let ((i (read)))
    (cond
      ((eq? i 'exit) #t)
      (else
        (write (eval i))
        (repl)
      )
    )
  )
)
(repl)
|#


#|
(define (cont? x l)
  (cond
    ( (null? l) #f)
    ( (eq? x (car l)) #t)
    (else 
      (cont? x (cdr l))
    )
  )
)

(cont? 'a '(a b c))

(cont? 'd '(a b c))
|#



#|
; こうすることにより末尾評価で最適化
(define (fact2 n)
  (fact2i n 1)
)

(define (fact2i n x)
  (if (= n 0)
    x
    (fact2i
      (- n 1)
      (* x n)
    )
  )
)

(fact2 3)


(define (si n x)
  (if (= n 0)
    x
    (si
      (- n 1)
      (+ x n)
    )
  )
)
|#





#|
(define (f x)
  (lambda (n)
    (+ n x)
  )
)
|#





#|
(define (len x)
  (if (null? x)
    0
    (+ 1 (len (cdr x)))
  )
)


(len '(a b c))
|#


#|
(define x 2)

(if (= x 0)
  1
  (- x 1)
)

(define fact
  (lambda (n)
    (if (= n 0)
      1
      (* n (fact (- n 1)))
    )
  )
)

; (fact 8)

(cond 
  ((= x 0) 1)
  (else (- x 1))
)


(define s
  (lambda (n)
    (if (= n 0)
      0
      (+ n (s (- n 1)))
    )
  )
)

(s 8)

(define (i n)
  (if (= n 0)
    0
    (+ n (i (- n 1)))
  )
)

(i 8)
|#






#|
(lambda
  (x)
    (+ x 1) )

(
(lambda
  (x)
    (+ x 1)
)
9)


(lambda (x y)
  (cons x (cons y '()))

)


(
(lambda (x y)
  (cons x (cons y '()))

)
'a 'b
)

(define caar
  (lambda (lst)
    (car (car lst))
  )
)

(caar '((a b) (c d))  )

(define f (lambda (x) (car (cdr x)) ) )

(f '(a b c))
|#



#|
(define name 2)
(define x 4)
(* (+ x 3) 4)

(cons 'a (cons 'a '()))
(cons 'a (cons 'b 'c))
(cons 'a (cons 'b (cons'c '())))
'(a b c)
'(a b . c)

(define x '(a b c))
|#




#|
(car (cons 111 222))
(cdr (cons 333 444))
|#


#|
(define (length x) ( cdr(x) ))
(length( cons `4 `(6) ))
|#


#|
(define (suu ii)(+ 2 ii))

(suu 3)
|#




#|
(define sel (cons 1 (cons 2 (cons 3 false))))
(car sel)
(cdr sel)
|#



#|
; timeマクロ
(time
  (printf "aaa"))
|#



#|
(define x 1)
(if (< x 0) (- x) x)
|#



#|
(define (add x y) (+ x y))

(define (add2 a (b null))
  (if (null? b) a (+ a b)))
|#



#|
; immutable:
#hash(("t" . 1) ("f" . 0))

(define ih
  (make-immutable-hash
    '(("t" . 1) ("f" . 0))))

; mutable:
(define h (make-hash '(("t" . 1) ("f" . 0))))

(hash? h)

; also true of assoc. lists and vectors:
(dict? h)
|#



#|
; iterate
(for ((x '(1 2 3)))
  (printf "~a~n" x)
  (printf "~a~n" (- x)))

(shuffle '(1 2 3 4))

(flatten '(1 2 (3 (4))))

(assoc 3 '((1 2) (3 4)))
(assoc 1 '((1 2) (3 4)))
|#


#|
(length '(1, 3 3 4))

(equal? '(1 2 3) '(1 2 3))

(list-ref '(1 2 3 4) 2)

; concat
(append '(1 2 3) '(4 5 6))

(take '(1 2 3 4) 2)

(drop '(1 2 3 4) 2)

(last '(1 2 3))

(define a '(1 2 3))
(take a (- (length a) 1))

(reverse '(1 2 3))

(sort '(3 2 4 1) <)

(remove-duplicates '(1 1 2 3))

(member 7 '(1 2 3))

(map (lambda (x) (* x x)) '(1 2 3))

(filter
  (lambda (x) (> x 2))
  '(1 2 3))

; reduce
(foldl (lambda (x y) (- y x)) 0 '(1 2 3 4))

(foldr - 0 '(1 2 3 4))
|#



#|
(min 1 2 3)
(max 1 2 3)

(quotient 7 3)
(remainder 7 3)

'(1 2 3)
|#


#|
(define x 3)

; y is not global:
(define (double z)
  (define y 2)
  (* y z))

null '()
(null? x)

'x
(quote x)

(symbol? 'x)

(eq? 'x 'x)
|#



#|
; parallel assignment:
(let ((x 3) (y 4))
  (+ x y))

; sequential assignment:
(let* ((x 3) (y (* x x)))
  (+ x y))
|#




#|
(define hoge '(123 . 456))
(cdr hoge)
|#



#|
(cons 'buttercup '())
(cons 'daisy '(buttercup))
(cons 'violet '(daisy buttercup))
(cons 'rose '(violet daisy buttercup))
|#


#|
; consはリストを作る関数
(cons 'pine '(fir oak maple))
|#



#|
(cdr '((lion tiger cheetah)
  (gazelle antelope zebra)
  (whale dolphin seal)))
|#


#|
; cdr はリストの残りの部分
(cdr '(rose violet daisy buttercup))

; car とはそのリストの最初の要素
(car '(rose violet daisy buttercup))
|#

#|
; 1次元配列の生成 NG
(make-array 5)
|#

#|
(define (extract str)
  (substring str 4 7))

; (extract "the boy")
; (extract "the gal out of the city")
|#


#|
(cond ((= 1 1) 1)
  (else 2))
|#


#|
#lang racket
(require 2htdp/image)
(let sierpinski ([n 8])
  (if (zero? n)
    (triangle 2 'solid 'red)
    (let ([t (sierpinski (- n 1))])
      (freeze (above t (beside t t))))))
|#



#|
(define
  (extract str)(substring str 4 7))

(extract "the boy out of the country")
(extract "the country out of the boy")
|#


; (substring "the boy out of the country" 4 7)


#|
; list
(list "red" "green" "blue")
(list 1 2 3 4 5)
|#


; (+ 1 2)
#|
(+ 1 3)
(+ 1 5)
|#
; (+ 1 8)

; (+ 2 3)
