import math, future
import linalg, systemSolver

proc finda(n: static[int], moment: int -> float): Vector64[n] =
    const N = n
    let rightPart = makeVector(N, proc(s: int): float = -moment(n+s));
    let leftPart = makeMatrix(N, N, proc(s, i: int): float = moment(i+s));
    return solveWithGauss(leftPart, rightPart)

proc solve3powEq(a, b, c, d: float): Vector64[3] =
    let q = (2*pow(b, 3) / (27*pow(a, 3)) - (b*c) / (3*pow(a, 2)) + d / a) / 2
    let p = (3*a*c - pow(b, 2)) / (9*pow(a, 2))
    let r = sqrt(abs(p)) * (q / abs(q))
    let phi = arccos(q / pow(r, 3))
    return vector([-2*r*cos(phi/3) - b / (3*a),
                     2*r*cos(Pi/3 - phi/3) - b / (3*a),
                     2*r*cos(Pi/3 + phi/3) - b / (3*a)])

proc gaussIntegrate*(f: float -> float; moment: int -> float;
                     a, b: float, n: static[int]): float =
    assert n == 3
    const N = n
    let aa = finda(N, moment)
    let x = solve3powEq(1, aa[2], aa[1], aa[0])
    echo "\nx:"
    echo $x
    echo ""
    let mu = makeVector(N, proc(i: int): float = moment(i));
    let X = makeMatrix(N, N, proc(i, j: int): float =
                                 pow(x[j], (i).float))
    let coef = solveWithGauss(X, mu)
    echo ""
    for i in 0..<N:
        result += coef[i] * f(x[i])

