---
tags:
  - dsa
  - leetcode
  - dificulty-medium
description: Notes, tips, explanation and examples on the basic calculator II Leetcode DSA challenge.
---
## Intro

https://leetcode.com/problems/basic-calculator-ii/

## Tokenizer

One approach is to do one pass over the input string and return a collection of numbers and operators.

For example, the input:


```text
"1 - 234 / 9 * 1"
```

Would result in:

```text
[1, "-", 234, "/", 9, "*", 1]
```

And from there we apply the logic to actually compute the final result.

With this approach, we have one loop to transform the string into tokens, and another loop to actually compute the final value.

It is not too bad as it does not involve nested loops, so, conceptually the time complexity is still $O(n)$ and *not* $O(n²)$.


## MIT Scheme solution

Courtesy of my friend didi, from the lisp-br IRC channel on Libera.

```scheme
(define precedence
  (let ((ops '(+ - * /)))
    (map cons ops (iota (length ops)))))

(define (precedence<? op1 op2)
  (< (cdr (assv op1 precedence))
     (cdr (assv op2 precedence))))

(define procs
  `((+ . ,+)
    (- . ,-)
    (* . ,*)
    (/ . ,/)))

(define (proc op)
  (cdr (assq op procs)))

(define (op? op)
  (pair? (assv op precedence)))

(define (parse input)
  (let loop ((output '())
             (ops '()))
    (let ((c (read-char input)))
      (cond ((eof-object? c)
             (append (reverse output) ops))
            ((char-whitespace? c)
             (loop output ops))
            ((char-numeric? c)
             (loop (cons (string->number (string c)) output)
                   ops))
            (else
             (let ((op (string->symbol (string c))))
               (let loop2 ((output output)
                           (ops ops))
                 (if (or (null? ops)
                         (not (precedence<? op (car ops))))
                     (loop output (cons op ops))
                     (loop2 (cons (car ops) output)
                            (cdr ops))))))))))

(define (calc expression)
  (car
   (fold (lambda (e stack)
           (if (op? e)
               (cons (truncate ((proc e) (cadr stack) (car stack)))
                     (cddr stack))
               (cons e stack)))
         '()
         expression)))

;; (calc (parse (open-input-string "3+2*2"))) => 7
;; (calc (parse (open-input-string " 3/2 "))) => 1
;; (calc (parse (open-input-string " 3+5 / 2 "))) => 5
```

Second solution by didi:

```scheme
(define ops (string->list "+-*/"))

(define (proc op)
  (define procs (map cons ops (list + - * /)))
  (cdr (assv op procs)))

(define (precedence<? op1 op2)
  (define precedence (map cons ops (iota (length ops))))
  (< (cdr (assv op1 precedence))
     (cdr (assv op2 precedence))))

(define (parse input)
  (let loop ((output '())
             (ops '()))
    (let ((c (read-char input)))
      (cond ((eof-object? c)
             (append (reverse output) ops))
            ((char-whitespace? c)
             (loop output ops))
            ((char-numeric? c)
             (loop (cons (char->digit c) output) ops))
            (else
             (do ((output output (cons (car ops) output))
                  (ops ops (cdr ops)))
                 ((or (null? ops)
                      (not (precedence<? c (car ops))))
                  (loop output (cons c ops)))))))))

(define (calc expression)
  (car
   (fold (lambda (e stack)
           (if (number? e)
               (cons e stack)
               (cons (truncate ((proc e) (cadr stack) (car stack)))
                     (cddr stack))))
         '()
         expression)))

;; (calc (parse (open-input-string "3+2*2"))) => 7
;; (calc (parse (open-input-string " 3/2 "))) => 1
;; (calc (parse (open-input-string " 3+5 / 2 "))) => 5
```

## CHICKEN 5 solution

Courtesy of Mario Goulart.

```scheme
(import srfi-13 srfi-14)

(define ops/procs
  ;; Sorted in order of precedence
  `((#\* . ,*)
    (#\/ . ,/)
    (#\+ . ,+)
    (#\- . ,-)))

(define tokenize
  ;; Example: str="1 + 2 * 3 + 4" => '(1 + 2 * 3 + 4)
  (let ((tokenizer (char-set-union char-set:digit
                                   (apply char-set
                                          (map car ops/procs)))))
    (lambda (str)
      (let loop ((tokens (string-tokenize str tokenizer)))
        (if (null? tokens)
            '()
            (let ((token (car tokens)))
              (cons
               (cond ((string->number token) => identity)
                     ((string->symbol token) => identity))
               (loop (cdr tokens)))))))))

(define (resolve-op op exp)
  ;; Examples:
  ;;   op=*, exp='(1 + 3 * 2 + 4) => '(1 + 6 + 4)
  ;;   op=+, exp='(1 + 6 + 4) => '(11)
  (let ((proc (alist-ref op ops/procs char=?))
        (op-sym (string->symbol (string op))))
    (reverse
     (let loop ((exp exp) (resolved '()))
       (if (null? exp)
           resolved
           (let ((token (car exp)))
             (if (eq? op-sym token)
                 (let ((result (proc (car resolved) (cadr exp))))
                   (loop (cddr exp) (cons result (cdr resolved))))
                 (loop (cdr exp) (cons token resolved)))))))))

(define (resolve str-exp)
  ;; str-exp="4 + 2 * 4 + 5 - 8 / 2" => 13
  (let loop ((ops (map car ops/procs))
             (exp (tokenize str-exp)))
    (if (null? ops)
        (car exp)
        (loop (cdr ops)
              (resolve-op (car ops) exp)))))

;; (resolve "4 + 2 * 4 + 5 - 8 / 2") => 13
```

## CHICKEN Scheme by ttybitnik

```scheme
(import matchable)

(define (precedence operator)
  (case operator
    ((+ -) 0)
    ((* /) 1)
    (else (error "Invalid operator" operator))))

(define (apply-operator operator x y)
  (case operator
    ((+) (+ x y))
    ((-) (- x y))
    ((*) (* x y))
    ((/) (/ x y))))

(define (eval-expr expr)
  (match expr
    ((A) A)

    ((A O1 B)
     (apply-operator O1 A B))

    ((A O1 B O2 C)
     (let ((E1 (apply-operator O1 A B))
           (E2 (apply-operator O2 B C)))
       (if (> (precedence O2) (precedence O1))
           (apply-operator O1 A E2)
           (apply-operator O2 E1 C))))

    (else (error "IDK, my friend" expr))))


(eval-expr '(3 + 2 * 2)) => 7

(eval-expr '(3 + 2 - 1)) => 4

(eval-expr '(3 + 10 / 2)) => 8

(eval-expr '(10 / 5 / 1)) => 2
```
