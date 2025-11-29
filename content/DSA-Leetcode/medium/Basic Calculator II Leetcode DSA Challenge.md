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
