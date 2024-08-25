# src\triangle\draw.nim
import floats, grid, triangleConfig, matrices
import raylib

proc characterDraw*(position: Float2) =
    let 
        x: int32 = position.x.int32 * cellSize.int32
        y: int32 = position.y.int32 * cellSize.int32
    drawText("@", x, y, cellSize.int32, Color(r: 0, g: 255, b: 255, a: 255))

proc lineDraw*(p1, p2: Float2) =
    let
        x1 = p1.x.int32
        y1 = p1.y.int32
        x2 = p2.x.int32
        y2 = p2.y.int32

    var 
        dx = abs(x2 - x1)
        dy = abs(y2 - y1)
        sx: int32 = if x1 < x2: 1 else: -1
        sy: int32 = if y1 < y2: 1 else: -1
        err = dx - dy

    var x = x1
    var y = y1

    while true:
        characterDraw(Float2(x: x.float, y: y.float))
        if x == x2 and y == y2:
            break
        let e2 = err * 2
        if e2 > -dy:
            err -= dy
            x += sx
        if e2 < dx:
            err += dx
            y += sy

proc drawTriangle*(rotationAngle: Float4) =
    var rotatedVertices: seq[Float4] = newSeq[Float4](triangleVertices.len)

    for i in 0..<triangleVertices.len:
        rotatedVertices[i] = rotateVertex(triangleVertices[i], rotationAngle)

    for edge in triangleEdges:
        let v1: Float4 = rotatedVertices[edge[0]]
        let v2: Float4 = rotatedVertices[edge[1]]
        
        let p1 = Float2(x: v1.x * triangleSize + gridMiddle.float, y: v1.y * triangleSize + gridMiddle.float)
        let p2 = Float2(x: v2.x * triangleSize + gridMiddle.float, y: v2.y * triangleSize + gridMiddle.float)
        
        drawLine(Vector2(x: p1.x,y: p1.y), Vector2(x: p2.x, y: p2.y), Color(r: 255, g: 128, b: 0, a: 255))
        lineDraw(p1, p2)