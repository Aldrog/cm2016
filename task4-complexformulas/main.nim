import integration, function, aitken, runge
import math, future

proc sq(f: float -> float; a, b: float): float =
    f((a+b) / 2) * (b-a)

let m = findM(sq, 0.1, f, a, b)
echo m
echo integrate(sq, m, epsilon, f, a, b)

