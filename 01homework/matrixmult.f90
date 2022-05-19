PROGRAM matrix
	implicit none
	
	!!23169
	INTEGER, PARAMETER ::msize = 10000
	INTEGER :: i, j
	REAL :: s, start, finish
	
	REAL :: A(msize, msize), x(msize),b(msize)
	!!REAL :: A(msize,msize)
	!!REAL :: x(msize)
	!!REAL :: b(msize)
	!!OPEN(10, file='data.txt')


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

CALL CALC(A,x,b,msize)

!!WRITE(10,*)  b


!!print*, (b(i), i=1,msize)

END PROGRAM matrix


SUBROUTINE CALC(P,Q,R,TAM)
INTEGER,  INTENT(IN):: TAM
REAL, INTENT(INOUT):: P(TAM,TAM),Q(TAM),R(TAM)
INTEGER :: I, J
REAL :: S, START, FINISH


CALL CPU_TIME(START)
DO I = 1, TAM
	DO J = 1, TAM
	R(I) = R(I) + P(I,J)*Q(I)
	END DO
END DO
CALL CPU_TIME(FINISH)
print *,FINISH-START
RETURN

END SUBROUTINE CALC
