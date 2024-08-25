# src\triangle\triangleConfig.nim
import grid, floats

let triangleSize*: float = gridMiddle.float / 0.3
let p = 1.0

var triangleVertices* = @[
    Float4(x: -p,   y: p,  z: -p,  w: 1.0), # 0
    Float4(x: p,    y: p,  z: -p,  w: 1.0), # 1
    Float4(x: -p,   y: p,  z: p,   w: 1.0), # 2
    Float4(x: p,    y: p,  z: p,   w: 1.0), # 3
    Float4(x: 0.0,  y: -p, z: 0.0, w: 1.0)  # 4
]

let triangleEdges*: seq[(int, int)] = @[
    (0, 1), (0, 2), (0, 4),
    (1, 3), (1, 4),
    (2, 3), (2, 4),
    (3, 4)
]
