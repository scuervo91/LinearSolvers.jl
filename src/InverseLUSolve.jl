function InverseLUSolve(A::Array,B::Vector)
      #A = the matrix of coefficients 'A' must be squared
  #B = The Vector 'B' right hand side vector Vertical
    m,n =size(A)
    v = size(B,1)
    if m != n
        error("Matrix must be squared")
    elseif m != v
        error("Vector Length must be equal to Matrix")
    end

    N,P=InverseLU(A)

    X=N*(P*B)

    return X
end
