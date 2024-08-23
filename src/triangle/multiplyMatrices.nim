proc multiplyMatrices*(A, B: seq[seq[float]]): seq[seq[float]] =
    let rowsA = A.len
    let colsA = A[0].len
    let rowsB = B.len
    let colsB = B[0].len

    if colsA != rowsB:
        raise newException(ValueError, "Number of columns in A must match number of rows in B")

    var C: seq[seq[float]] = @[]
    for i in 0..<rowsA:
        var row: seq[float] = @[]
        for j in 0..<colsB:
            var sum = 0.0
            for k in 0..<colsA:
                sum += A[i][k] * B[k][j]
            row.add(sum)
        C.add(row)

    return C
