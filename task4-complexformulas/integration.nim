import math, future

proc rectangles*(f: float -> float; a, b: float; n: int): float =
    let dx = (b - a) / n.float
    var curX = a + dx/2
    while curX < b:
        result += f(curX) * dx
        curX += dx

proc leftRectangles*(f: float -> float; a, b: float; n: int): float =
    let dx = (b - a) / n.float
    var curX = a
    while curX < b - dx/2:
        result += f(curX) * dx
        curX += dx
        
proc trapeziums*(f: float -> float; a, b: float; n: int): float =
    let dx = (b - a) / n.float
    var curX = a
    while curX < b - dx/2:
        let nextX = curX + dx
        result += (f(curX) + f(nextX)) / 2 * dx
        curX = nextX

proc simpson*(f: float -> float; a, b: float; n: int): float =
    let dx = (b - a) / n.float
    var curX = a
    while curX < b - dx/2:
        let nextX = curX + dx
        let avgX = curX + dx/2
        result += dx/6 * (f(curX) + 4*f(avgX) + f(nextX))
        curX = nextX

