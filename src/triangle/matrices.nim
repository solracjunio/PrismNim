# src\triangle\matrices.nim
import math
import floats, triangleConfig

let distance = 1000.0

proc perspectiveProjection*(v: Float4): Float4 =
    result = Float4(
        x: v.x / (v.z + distance),
        y: v.y / (v.z + distance),
        z: v.z,
        w: 1.0
    )


proc matrixMultiply*(m: seq[Float4], v: Float4): Float4 =
    var 
        x = m[0].x * v.x + m[0].y * v.y + m[0].z * v.z + m[0].w * v.w
        y = m[1].x * v.x + m[1].y * v.y + m[1].z * v.z + m[1].w * v.w
        z = m[2].x * v.x + m[2].y * v.y + m[2].z * v.z + m[2].w * v.w
        w = m[3].x * v.x + m[3].y * v.y + m[3].z * v.z + m[3].w * v.w

    Float4(x: x, y: y, z: z, w: w)

proc rotateVertex*(v , angles: Float4): Float4 =

    let
        cosA = cos(angles.x)
        sinA = sin(angles.x)
        cosB = cos(angles.y)
        sinB = sin(angles.y)
        cosC = cos(angles.z)
        sinC = sin(angles.z)

        matrixX: seq[Float4] = @[
            Float4(x: 1.0, y: 0.0,  z: 0.0,   w: 0.0),
            Float4(x: 0.0, y: cosA, z: -sinA, w: 0.0),
            Float4(x: 0.0, y: sinA, z: cosA,  w: 0.0),
            Float4(x: 0.0, y: 0.0,  z: 0.0,   w: 0.0)
        ]
        matrixY: seq[Float4] = @[
            Float4(x: cosB,  y: 0.0, z: sinB, w: 0.0),
            Float4(x: 0.0,   y: 1.0, z: 0.0,  w: 0.0),
            Float4(x: -sinB, y: 0.0, z: cosB, w: 0.0),
            Float4(x: 0.0,   y: 0.0, z: 0.0,  w: 0.0)
        ]
        matrixZ: seq[Float4] = @[
            Float4(x: cosC, y: -sinC, z: 0.0, w: 0.0),
            Float4(x: sinC, y: cosC,  z: 0.0, w: 0.0),
            Float4(x: 0.0,  y: 0.0,   z: 1.0, w: 0.0),
            Float4(x: 0.0,  y: 0.0,   z: 0.0, w: 0.0)
        ]

        matrixScale: seq[Float4] = @[
            Float4(x: triangleSize, y: 0.0,          z: 0.0,          w: 0.0),
            Float4(x: 0.0,          y: triangleSize, z: 0.0,          w: 0.0),
            Float4(x: 0.0,          y: 0.0,          z: triangleSize, w: 0.0),
            Float4(x: 0.0,          y: 0.0,          z: 0.0,          w: 0.0)
        ]
    
    result = perspectiveProjection(matrixMultiply(matrixScale, matrixMultiply(matrixX, matrixMultiply(matrixY, matrixMultiply(matrixZ, v)))))
    #result = perspectiveProjection(matrixMultiply(matrixScale, v))