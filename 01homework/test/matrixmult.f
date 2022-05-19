PROGRAM matrix
	implicit none
	
	!!23169
	INTEGER, PARAMETER ::msize = 10
	INTEGER :: i, j
	REAL :: s, time
	
	DOUBLE PRECISION :: A(msize, msize)
	DOUBLE PRECISION :: x(msize),b(msize)
	!!OPEN(10, file='data.txt')



DO i= 1, msize
	DO j = 1, msize
		CALL RANDOM_NUMBER(s)
		A(i,j) = s
		CALL RANDOM_NUMBER(s) 
		x(j) = s
		b(j) = 0
		
	END DO
END DO

call dgemm(A,x,b,msize,time)
print *, time

!!WRITE(10,*)  b

END PROGRAM

!-------------------------------------------------------
SUBROUTINE dgemm (P,q,r,mlen,time)
	IMPLICIT NONE
	INTEGER :: mlen
	DOUBLE PRECISION :: P(mlen, mlen), q(mlen),r(mlen)
	INTEGER :: i, j
	REAL :: s, start, finish,time

	
	DO i = 1, mlen
		DO j = 1, mlen
		r(i) = r(i) + P(i,j)*q(i)
		

		END DO
	END DO
	
	
	time = 0
	

END SUBROUTINE dgemm

