function DolittleLU(A::Array; pivot=true)

  #A = the matrix of coefficients 'A' must be squared
  #B = The Vector 'B' right hand side vector Vertical
    m,n =size(A)

    if m != n
        error("Matrix must be squared")
    end

    # System of equations
    U=A
    P=Matrix{Float64}(I,m,m)
    p=zeros(m)
    L=zeros(m,m)
    #Forward Elimination
    for j=1:m-1
        if pivot==true
        k=argmax(abs.(U[j:m,j]))   #Find the Max value in the colum k to change the order
        Ind=j+k-1                  #Indicates de index of the row to change
        U[[j,Ind],:]=U[[Ind,j],:]  #Change the order of rows
        P[[j,Ind],:]=P[[Ind,j],:]
        L[[j,Ind],:]=L[[Ind,j],:]
        end
       for i=j+1:m

            f=U[i,j]/U[j,j]
            L[i,j]=f
            U[i,:]=U[i,:].-f.*U[j,:]
        end
    end
    for i=1:m
        L[i,i]=1
        p[i]=argmax(P[i,:])
    end
    U=UpperTriangular(U)
    L=LowerTriangular(L)




    return L,U, P, p
end
