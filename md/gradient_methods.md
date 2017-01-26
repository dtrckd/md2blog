@math


# Gradient method

* In which cases, is the conjugate gradient method better than LBFGS?  https://www.quora.com/In-which-cases-is-the-conjugate-gradient-method-better-than-LBFGS#


* What is the differences between these four algorithms: Gauss-Seidel, SOR, steepest descent, and conjugate gradient? https://www.quora.com/What-is-the-differences-between-these-four-algorithms-Gauss-Seidel-SOR-steepest-descent-and-conjugate-gradient

Richard Morris, Maths tutor, doctorate in mathematics/computer science.
Updated Jan 7

So we are looking at different methods for solving system of linear equations. Equivalently solving the matrix equation A x = b. When A is n⨉n and x and b are vectors.

In Gauss–Seidel method we decompose A as A=L* + U where L* is the diagonal and lower triangular part and U is the upper triangle. Rewrite the eqation as L* x = b - U x. It then uses an iterative approach to find x. Using xn+1=L−1(b−Uxn)

    .

    Successive over-relaxation is related to GS. A is decomposed as A= L + D + U. L is strictly lower triangular, D is the diagonal and U is upper triangular.  Multiply the equation by a constant ω>1
    to get ω(L+D+U)x=ωb re-arrange to get (D+ωL)x=ωb−[ωU+(ω−1)D]x

    . And use a similar iteration as before.

    In the Jacobi method we decompose A as A= D + R where D is a diagonal and R is L+U, i.e. a matrix with zeros down the diagonal. Use Dx=b−Rx
    . And the iteration xn+1=D−1(b−Rxn)

    .

    Gradient descent
    wikipedia.org
    is a technique for minimising a function F(x) by finding the gradient of the function ∇F
    and xn+1=xn−γn∇F(xn)

    . For system of linear equations define F by using the least square

    F(x)=∥Ax−b∥2.
    so ∇F(x)=2AT(Ax−b). and xn+1=xn−γn2AT(Ax−b). Effectively this point moved in the direction of the residual b−Ax

    The Conjugate gradient method requires A to be symmetric and positive definite. Its similar to gradient descent but uses the concept of conjugate vector. Two vectors are said to be conjugate in uTAv=0

    an each step is moved in a direction conjugate to the all previous step. This direction is found from the residual and the director of the previous steps.
    2.6k Views · View Upvotes · Answer requested by Min Ven


