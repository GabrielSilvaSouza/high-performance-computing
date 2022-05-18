PROGRAM matrix
	implicit none
	
	!!23169
	INTEGER, PARAMETER ::msize = 10000
	INTEGER :: i, j
	REAL :: s, start, finish
	
	REAL :: A(msize, msize)
	REAL :: x(msize),b(msize)
	!!REAL :: A(msize,msize)
	!!REAL :: x(msize)
	!!REAL :: b(msize)
	OPEN(10, file='data.txt')


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

CALL CPU_TIME(start)
DO i = 1, msize
	DO j = 1, msize
	b(i) = b(i) + A(i,j)*x(i)
	

	END DO
END DO
CALL CPU_TIME(finish)
print *,finish-start

!!WRITE(10,*)  b


!!print*, (b(i), i=1,msize)

END PROGRAM
