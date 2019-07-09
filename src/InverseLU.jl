function InverseLU(A::Array)

  #A = the matrix of coefficients 'A' must be squared

    m,n =size(A)

    if m != n
        error("Matrix must be squared")
    end

    In=zeros(m,m)
    B=Matrix{Float64}(I,m,m)
    D=zeros(m)

    L,U,P, p=DolittleLU(A)



    for j=1:m

        #Fordward Substitution
        D=zeros(m)
        D[1]=B[1,j]
        for i=2:m
           D[i]=(B[i,j] - (L[i,1:i-1]'*D[1:i-1]))
        end

        #Back substitution

          In[m,j]=D[end]/U[end,end]

    for i=m-1:-1:1
       In[i,j]=(D[i] - (U[i,i+1:m]'*In[i+1:m,j]))/U[i,i]
    end

    end
    return In, P
end
    
