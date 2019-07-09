function CroutLU(A::Array)

  #A = the matrix of coefficients 'A' must be squared

    m,n =size(A)

    if m != n
        error("Matrix must be squared")
    end

    # System of equations
    L=zeros(m,m)
    U=Matrix{Float64}(I,m,m)

    for i=1:m
        L[i,1]=A[i,1]
    end

    for j=2:m
       U[1,j]=A[1,j]/L[1,1]
    end

    for j=2:m-1
       for i=j:m
           L[i,j]=A[i,j]- (L[i,1:j-1]'*U[1:j-1,j])
        end

        for k=j:m
           U[j,k]=(A[j,k]-(L[j,1:j-1]'*U[1:j-1,k]))/L[j,j]
        end
    end


       L[m,m]=A[m,m]-(L[m,1:m-1]'*U[1:m-1,m])

    return L, U
end
