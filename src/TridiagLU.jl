function TridiagLU(A)

  #A = the matrix of coefficients 'A' must be squared

    m,n =size(A)

    if m != n
        error("Matrix must be squared")
    end
    e=zeros(m-1)
    f=zeros(m)
    g=zeros(m-1)
    f[1]=A[1,1]
    for i=2:m
        e[i-1]=A[i,i-1]/f[i-1]
        g[i-1]=A[i-1,i]
        f[i]=A[i,i]-e[i-1]*g[i-1]

    end

    L=Tridiagonal(e,ones(m),zeros(m-1))
    U=Tridiagonal(zeros(m-1),f,g)

    return L, U

end
