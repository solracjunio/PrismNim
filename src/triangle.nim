# src\triangle.nim
import triangle / [draw, floats]
import raylib

const
  screenWidth: int32 = 800
  screenHeight: int32 = 800
  screenName: string = "Cube3D"
  fps: int32 = 60

proc main = 
  initWindow(screenWidth, screenHeight, screenName)
  setTargetFPS(fps)

  while not windowShouldClose():

    beginDrawing()
    clearBackground(Black)
    endDrawing()

  closeWindow()

main()