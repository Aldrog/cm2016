import math, future
import linalg, systemSolver

proc finda(n: static[int], moment: int -> float): Vector64[n] =
    const N = n
    let rightPart = makeVector(N, proc(s: int): float = moment(n+s));
    let leftPart = makeMatrix(N, N, proc(s, i: int): float = moment(i+s));
    return solveWithGauss(leftPart, rightPart)

proc gaussIntegrate*(f: float -> float; moment: int -> float;
                     a, b: float, n: static[int]): float =
    let a = finda(n, moment)

