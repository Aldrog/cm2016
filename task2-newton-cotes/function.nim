import math

const
    a* = 2.3
    b* = 2.9
    preciseResult* = 348.8181344253912
    beta = 2/5

proc f*(x: float): float {.procvar.} = 3*cos(2.5*x)*exp(7*x/4) + 5*sin(0.5*x)*exp(3*x/8) + 4

proc moment*(k: int): float {.procvar.} =
    # Integral [(b-x)^k / x^(2/5), {x, 0, b-a}]
    for i in 0..k:
        let power = i.float - beta
        var sumPart = (if i mod 2 == 0: 1.0 else: -1.0)
        sumPart /= power + 1
        sumPart *= binom(k, i).float
        sumPart *= pow(b, (k-i).float)
        sumPart *= pow(b - a, power + 1)
        result += sumPart

