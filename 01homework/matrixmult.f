PROGRAM matrix
	implicit none
	
	INTEGER, PARAMETER ::msize = 23169
	INTEGER :: i, j
	REAL :: s
	
	REAL :: A(msize, msize)
	REAL :: x(msize),b(msize)
	!!REAL :: A(msize,msize)
	!!REAL :: x(msize)
	!!REAL :: b(msize)


DO i= 1, msize
	DO j = 1, msize
		!!print*, i, j
		CALL RANDOM_NUMBER(s)
		A(i,j) = s
		CALL RANDOM_NUMBER(s) 
		x(j) = s
		b(j) = 0
		
	END DO
END DO

DO i = 1, msize
	DO j = 1, msize
	b(i) = b(i) + A(i,j)*x(i)
	END DO
END DO



!!print*, (b(i), i=1,msize)

END PROGRAM
