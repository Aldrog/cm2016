import future

proc complexFormula*(f: float -> float; formula: proc(f: float -> float; a,b: float): float;
                     count: int; a,b: float): float =
    let dx = (b-a) / count.float
    var x = a
    for i in 0..<count:
        result += formula(f, x, x + dx)
        x += dx

