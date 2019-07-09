function LUSolve(A::Array,B::Vector)

      #A = the matrix of coefficients 'A' must be squared
  #B = The Vector 'B' right hand side vector Vertical
    m,n =size(A)
    v = size(B,1)
    if m != n
        error("Matrix must be squared")
    elseif m != v
        error("Vector Length must be equal to Matrix")
    end

L,U,P,p=DolittleLU(A)
    A=P*A
    B=P*B
    X=D=zeros(m)

    #Fordward Substitution
    D[1]=B[1]
    for i=2:m
       D[i]=(B[i] - (L[i,1:i-1]'*D[1:i-1]))

    end

         #Back Substitution
    X[m]=D[end]/U[end,end]

    for i=m-1:-1:1
       X[i]=(D[i] - (U[i,i+1:m]'*X[i+1:m]))/U[i,i]
    end

    return X
end
