function PivotGauss(A::Array,B::Vector)
      #A = the matrix of coefficients 'A' must be squared
  #B = The Vector 'B' right hand side vector Vertical
    m,n =size(A)
    v = size(B,1)
    if m != n
        error("Matrix must be squared")
    elseif m != v
        error("Vector Length must be equal to Matrix")
    end

    # System of equations
    S=[A B]
    X=zeros(m)
    L=Matrix{Float64}(I,m,m)
     #Forward Elimination
    for j=1:m-1
        k=argmax(abs.(S[j:m,j]))   #Find the Max value in the colum k to change the order
        Ind=j+k-1                  #Indicates de index of the row to change
        S[[j,Ind],:]=S[[Ind,j],:]  #Change the order of rows

        for i=j+1:m
            f=S[i,j]/S[j,j]
            S[i,:]=S[i,:].-f.*S[j,:]
            L[i,j]=f
        end
    end
     #Back Substitution
    X[m]=S[end,end]/S[end,end-1]

    for i=m-1:-1:1
        X[i]=(S[i,end] - (S[i,i+1:m]'*X[i+1:m]))/S[i,i]
    end

    return X
end
