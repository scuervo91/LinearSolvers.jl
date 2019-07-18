function ThomasLUSolve(A::Any,B::Vector)
      #A = the matrix of coefficients 'A' must be squared
  #B = The Vector 'B' right hand side vector Vertical
    m,n =size(A)
    v = size(B,1)
    if m != n
        error("Matrix must be squared")
    elseif m != v
        error("Vector Length must be equal to Matrix")
    end
    e=zeros(m-1)
    f=zeros(m)
    g=zeros(m-1)
    r=zeros(m)
    x=zeros(m)
    f[1]=A[1,1]
        #Decomposition
    for i=2:m
        e[i-1]=A[i,i-1]/f[i-1]
        g[i-1]=A[i-1,i]
        f[i]=A[i,i]-e[i-1]*g[i-1]

    end

    #Fordward Substitution
    r[1]=B[1]
    for i=2:m
        r[i]=B[i]-e[i-1]*r[i-1]
    end

    #Back Substitution
    x[m]=r[m]/f[m]

    for i=m-1:-1:1
       x[i]=(r[i]-g[i]*x[i+1])/f[i]
    end


    return x
end
