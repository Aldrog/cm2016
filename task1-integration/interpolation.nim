proc lm(i: int, xk: seq[float], x: float): float =
    result = 1
    for j in low(xk)..high(xk):
        if(i != j):
            result = result * (x - xk[j]) / (xk[i] - xk[j])

proc interpolate*(px, py: seq[float]): (proc(x: float): float) =
    proc res(x: float): float =
        for i in low(px)..high(px):
            result = result + py[i] * lm(i, px, x)
    return res
