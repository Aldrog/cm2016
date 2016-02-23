import function, integration
import seqUtils
import interpolation, plotter

iterator myCountup(a, b: int): float =
    for i in a..b: yield i.float

const x = toSeq(myCountup(1, 20))

var res1 = newSeq[float](0)
var res2 = newSeq[float](0)
var res3 = newSeq[float](0)

echo "Rectangles\t\tTrapeziums\t\tSimpson"
for n in x:
    res1.add abs(preciseResult - rectangles(f, a, b, n.int))
    res2.add abs(preciseResult - trapeziums(f, a, b, n.int))
    res3.add abs(preciseResult - simpson(f, a, b, n.int))
    echo abs(res1[res1.high]), "\t",
         abs(res2[res2.high]), "\t",
         abs(res3[res3.high])

showGraph(interpolate(x, res1), interpolate(x, res2), interpolate(x, res3))

