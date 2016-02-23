import math

proc f*(x: float): float {.procvar.} = 3*cos(2.5*x)*exp(7*x/4) + 5*sin(0.5*x)*exp(3*x/8) + 4

const
    a* = 2.3
    b* = 2.9
    preciseResult* = 163.06157005314853
