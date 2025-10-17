PROGRAM test_open_mp

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Necessary moudles:

USE OMP_LIB

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
IMPLICIT NONE
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Initializing variables:

INTEGER :: i,j,k,m, sum
REAL :: msum
INTEGER, DIMENSION(20, 30) :: A
INTEGER, DIMENSION(30, 20) :: B
INTEGER, DIMENSION(20, 20) :: C

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Executable Code:

!$OMP PARALLEL
    DO i=1,100000
        sum = sum+i
    END DO
    
    ! C = A*B ( Es gibt theoretisch schnellere Multiplikationsalgortihmen,
    ! aber dieser ist nach wie vor in Benutzung)
    DO j=1,20        
        DO k=1,20
            msum=0.
            DO m=1,30
                msum = msum +A(j,m)*B(m,j)
            END DO
            C(j,k)=msum 
        END DO        
    END DO
!$OMP END PARALLEL

WRITE(*,*) "sum is:", sum
WRITE(*,*) "Matrix A: ", A
WRITE(*,*) "Matrix B: ", B
WRITE(*,*) "Matrix C is: ", C

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

STOP
END PROGRAM
