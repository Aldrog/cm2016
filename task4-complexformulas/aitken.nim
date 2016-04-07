import math, future
import complexintegration

proc m(sh1, sh2, sh3: float): float =
    ln(abs((sh1-sh2)/(sh2-sh3))) / ln(2)

proc findM*(formula: proc(f: float -> float; a, b:float): float;
            proximity: float; f: float -> float; a, b: float): float =
    var
        curCount = 1
        sum1 = complexFormula(f, formula, curCount * pow(2, 1).int, a, b)
        sum2 = complexFormula(f, formula, curCount * pow(2, 2).int, a, b)
        sum3 = complexFormula(f, formula, curCount * pow(2, 3).int, a, b)
        curM = m(complexFormula(f, formula, curCount, a, b), sum1, sum2)
        newM = m(sum1, sum2, sum3)
    while abs(curM - newM) > proximity:
        curCount *= 2
        curM = newM
        sum1 = sum2
        sum2 = sum3
        sum3 = complexFormula(f, formula, curCount * pow(2, 3).int, a, b)
        newM = m(sum1, sum2, sum3)
    return newM

