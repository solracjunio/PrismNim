# src\triangle\triangleConfig.nim
import grid, floats

let triangleSize* = gridSize.float32 / 4.0

var triangleVertices* = @[
    Float3(x: -1,y: 1,z: -1), # 0
    Float3(x: 1,y: 1,z: -1), # 1
    Float3(x: 0,y: 1,z: 1), # 2
    Float3(x: 0,y: -1,z: 0) # 3
]

let triangleEdges*: seq[(int, int)] = @[
    (0, 1), (0, 2), (0, 3),
    (1, 2), (1, 3),
    (2, 3)
]