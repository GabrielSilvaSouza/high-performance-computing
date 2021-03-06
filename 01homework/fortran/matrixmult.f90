PROGRAM matrix
	implicit none
	
	!!23169
	INTEGER, PARAMETER ::msize = 50000
	INTEGER :: i, j, K
	REAL :: s , START, FINISH
	REAL, ALLOCATABLE, DIMENSION (:, :):: A
	REAL, ALLOCATABLE, DIMENSION (:) :: x,b
	OPEN(10, file='data.csv')

	ALLOCATE(A(msize, msize))
	ALLOCATE(x(msize))
	ALLOCATE(b(msize))
	

	DO j= 1, msize, 500
		DO i = 1, msize, 500
			CALL RANDOM_NUMBER(s)
			A(i,j) = s
			CALL RANDOM_NUMBER(s) 
			x(j) = s
			b(j) = 0
		END DO
		CALL CALC(A,x,b,msize)
	END DO
	
	DEALLOCATE(A)
	DEALLOCATE(x)
	DEALLOCATE(b)


END PROGRAM matrix


SUBROUTINE CALC(P,Q,R,TAM)
	INTEGER,  INTENT(IN):: TAM
	REAL, INTENT(INOUT):: P(TAM,TAM),Q(TAM),R(TAM)
	INTEGER :: I, J
	REAL :: S, START, FINISH


	CALL CPU_TIME(START)
		DO I = 1, TAM, 9
			DO J = 1, TAM, 9
			R(I) = R(I) + P(I,J)*Q(I)
			END DO
		END DO
	CALL CPU_TIME(FINISH)
	WRITE(10, *) FINISH-START
	RETURN

END SUBROUTINE CALC




