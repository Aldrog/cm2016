import math, future
import complexintegration

proc integrate*(formula: proc(f: float -> float; a, b:float): float; m: float;
                proximity: float; f: float -> float; a, b: float): float =
    var n = 1
    var r = proximity + 1
    var curSum = complexFormula(f, formula, n, a, b)
    while abs(r) > proximity:
        n *= 2
        let newSum = complexFormula(f, formula, n, a, b)
        r = (newSum - curSum) / (pow(2, m+1) - 1)
        curSum = newSum
    return curSum

