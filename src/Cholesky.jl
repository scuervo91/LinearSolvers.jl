function CholeskyL(A::Array)

  #A = the matrix of coefficients 'A' must be squared

    m,n =size(A)

    if m != n
        error("Matrix must be squared")
    end

    # System of equations
    L=zeros(m,m)

    L[1,1]=A[1,1]^0.5

    for k=2:m

    for i=1:k-1
       L[k,i]=(A[k,i]-(L[i,1:i-1]'*L[k,1:i-1]))/(L[i,i])

    end
          L[k,k]=(A[k,k]-(L[k,1:k-1]'*L[k,1:k-1]))^0.5
    end



    return L

end
