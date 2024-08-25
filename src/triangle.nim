# src\triangle.nim
import triangle / [floats, draw]
import raylib

const
  screenWidth: int32 = 1000
  screenHeight: int32 = 1000
  screenName: string = "Cube3D"
  fps: int32 = 60

proc main = 
  initWindow(screenWidth, screenHeight, screenName)
  setTargetFPS(fps)

  var rotationAngle: Float4 = Float4(x: 0.0, y: 0.0, z: 0.0, w: 0.0)
  let rotationSpeed: float = 0.005

  while not windowShouldClose():

    rotationAngle.x += rotationSpeed
    rotationAngle.y += rotationSpeed
    rotationAngle.z += rotationSpeed

    beginDrawing()
    clearBackground(Black)

    drawTriangle(rotationAngle)

    endDrawing()

  closeWindow()

main()