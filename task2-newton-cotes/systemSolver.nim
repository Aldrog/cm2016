import
    future,
    math, linalg

proc solveWithGauss*[M, N: static[int]](A: Matrix64[M, N], b: Vector64[M]): Vector64[N] =
    # A bit simplified Gauss method.
    # Will not work in some cases,
    # But these cases are not interesting for us.
    var expandedMatrix = makeMatrix(M, N + 1,
        proc(i, j: int): float = (if j < N: A[i, j] else: b[i]))
        #order = rowMajor)
    echo "Solving with Gauss method"
    echo $expandedMatrix
    discard """
    var emRows: array[M, Vector64[N + 1]]
    for i in 0..(M - 1):
        emRows[i] = expandedMatrix.rowUnsafe(i)

    for i in 0..(M - 2):
        for j in (i + 1)..(M - 1):
            emRows[j] -= emRows[i] * (emRows[j][i] / emRows[i][i])
    echo expandedMatrix
    for i in countdown(M - 1, 1):
        for j in 0..(i - 1):
            emRows[j] -= emRows[i] * (emRows[j][i] / emRows[i][i])
    echo expandedMatrix
    for i in 0..(M - 1):
        emRows[i] /= emRows[i][i]
    echo expandedMatrix
"""
    return expandedMatrix.column(N)

