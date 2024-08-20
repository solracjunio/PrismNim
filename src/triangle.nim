# This is just an example to get you started. A typical hybrid package
# uses this file as the main entry point of the application.
#import triangle/submodule

#when isMainModule:
#  echo(getWelcomeMessage())

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
    lineDraw(Float2(x: 0, y: 0), Float2(x: 10, y: 10))
    endDrawing()

  closeWindow()

main()