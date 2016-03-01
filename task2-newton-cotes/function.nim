import math

const
    a* = 2.3
    b* = 2.9
    preciseResult* = 163.06157005314853

proc f*(x: float): float {.procvar.} = 3*cos(2.5*x)*exp(7*x/4) + 5*sin(0.5*x)*exp(3*x/8) + 4

proc moment*(i: int): float {.procvar.} = (1 / (i+1)) * (pow(b, i.float + 1) - pow(a, i.float + 1))

