function GaussSeidelSolve(A::Any,B::Vector; Guess=false,ϵ=0.05, MaxItr=30, λ=1)
      #A = the matrix of coefficients 'A' must be squared
  #B = The Vector 'B' right hand side vector Vertical
    m,n =size(A)
    v = size(B,1)
    if m != n
        error("Matrix must be squared")
    elseif m != v
        error("Vector Length must be equal to Matrix")
    end

    w=1:m          #Count m range

    c=zeros(m,m-1)
    er=[1.]
    cond=false
    for i=1:m
        W=w[w.!=i]
       c[i,:]= A[i,W]
    end

    Guess==false ? X=zeros(1,m) : X=Guess'
    itr=2

    while cond==false

        X=vcat(X,X[[itr-1],:])
        #Relaxation
        X[itr,:]=λ.*X[itr,:].+(1-λ).*X[itr-1,:]

        for i=1:m
            W=w[w.!=i]
            X[itr,i]=(B[i]-(c[i,:]'*X[itr,W]))/A[i,i]
        end

        e=maximum((X[itr,:].-X[itr-1,:])./X[itr,:])
        push!(er,e)
        cond=er[itr] .<=ϵ || itr .>= MaxItr
        println("Iteration $(itr-1) Error $(er[itr]*100) %")

        itr += 1
    end #End while loop


    return X[end,:], itr
end
