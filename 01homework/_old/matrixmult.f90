PROGRAM matrix
	implicit none
	
	!!23169
	INTEGER, PARAMETER ::msize = 24000
	INTEGER :: i, j, K
	REAL :: s, start, finish
	REAL :: A(msize, msize), x(msize),b(msize)
	OPEN(10, file='data.txt')

DO K = 1, 30
	DO i= 1, msize
		DO j = 1, msize
			
			CALL RANDOM_NUMBER(s)
			A(i,j) = s
			CALL RANDOM_NUMBER(s) 
			x(j) = s
			b(j) = 0
			
		END DO
	END DO
	CALL CALC(A,x,b,msize)
END DO



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
	WRITE(10, *) FINISH-START
	RETURN

END SUBROUTINE CALC
