import math, future
import linalg, systemSolver

proc newton_cotes*(f: float -> float; moment: int -> float; a, b: float, n: static[int]): float =
    echo $zeros(3)
    echo $solveWithGauss(zeros(3,3), zeros(3))
    echo $solveWithGauss(makeMatrix(n, n, proc(i, j:int):float =
                                          pow(a + i.float*(b - a) / n.float, j.float)),
                         makeVector(n, proc(i:int):float = moment(i)))

