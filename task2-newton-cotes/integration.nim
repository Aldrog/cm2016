import math, future
import linalg, systemSolver

proc newton_cotes*(f: float -> float; moment: int -> float; a, b: float, n: static[int]): float =
    const N = n
    let mu = makeVector(N, proc(i: int): float = moment(i));
    let X = makeMatrix(N, N, proc(i, j: int): float =
                                 pow(a + j.float*(b - a) / (n-1).float, (i).float))
    let coef = solveWithGauss(X, mu)
    for i in 0..<N:
        result += coef[i] * f(a + i.float * (b - a)/(n-1).float)

