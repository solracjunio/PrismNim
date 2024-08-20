import floats
import raylib
import grid


proc characterDraw*(position: Float2) =
    let 
        x: int32 = position.x.int32 * cellSize
        y: int32 = position.y.int32 * cellSize
    drawText("@", x, y, grid.cellSize, RayWhite)

proc lineDraw*(p1, p2: Float2) =
    let
        deltaX: float32 = abs(p2.x - p1.x)
        deltaY: float32 = abs(p2.y - p1.y)
        setepX: float32 = if p2.x - p1.x > 0: 1 elif p2.x - p1.x < 0: -1 else: 0
        setepY: float32 = if p2.y - p1.y > 0: 1 elif p2.y - p1.y < 0: -1 else: 0
        
    var error: float32 = deltaX - deltaY

    while (p1.x != p2.x) or (p1.y != p2.y):
        characterDraw(p1)

        let erro2 = 2 * error
        if erro2 > -deltaY:
            error -= deltaY
            p1.x += setepX
        if erro2 < deltaX:
            error += deltaX
            p1.y += setepY
