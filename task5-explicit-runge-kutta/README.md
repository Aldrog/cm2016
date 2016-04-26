# Task 5. Explicit Runge-Kutta methods
1. Build two-step second order explicit Runge-Kutta method with c2 = 9/14
2. Solve:  
```
dy1/dx = 5/14 * y2
dy2/dx = 7/15 * y1
y1(0) = 7/15 Pi, y2(0) = 5/14 Pi, xk = Pi
```
With 10^-4 proximity. Find optimal step and display error on each step.
Solve using your method from the first part of the task and:
```
y(x + h) ≈ y(x) + 1/2 (k1(h) + k2(h))
where
k1(h) = hf(x, y(x)),
k2(k) = hf(x + h, y(x) + k1(h)).
```
