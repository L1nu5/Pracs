(defun add(A B)
(+ A B)
)

(defun sub(A B)
(- A B)
)

(defun mul(A B)
(setf ans 0)
(setf i -1)
(sb-thread:make-thread(lambda()
(loop
(setf i (+ i 1))
;;check if last bit of A is 1 or 0, if 1 then add B to ans else do not do anything

(setf C (logand A 1))

(if (= C 1) 
(setf ans (+ ans (ash B i))))

(setf A (ash A -1))
(when (= A 0)
(format t "Decimal product is :~A " ans)
(format t "Binary product is :~b" ans)
(return ans))
)) 	 
)
)

(defun div(A B)
(/ A B)
)

;;accepting input and calling functions
(write-line "Enter Values: ")
(defvar A)
(defvar B)
(defvar C)
(defvar ans)
(defvar i)
(defvar x)
(defvar y)
(setf A(read))
(setf B(read))

(write-line "")
(sb-thread:make-thread(lambda()
(princ "Addition is : ")
(write(add A B))
(write-line "")
(write-line "")))

(sb-thread:make-thread(lambda()
(princ "Subtraction is : ")
(write(sub A B))
(write-line "")
(write-line "")))

(setf x A) 
(setf y B)

(sb-thread:make-thread(lambda()
(princ "Multiplication is : ")
(write(mul x y))
(write-line "")
(write-line "")))

(sb-thread:make-thread(lambda()
(princ "Division is : ")
(write(div a b))
(write-line "")
(write-line "")))
(write-line "End ")
