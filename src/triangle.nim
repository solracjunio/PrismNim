# This is just an example to get you started. A typical hybrid package
# uses this file as the main entry point of the application.
#import triangle/submodule

#when isMainModule:
#  echo(getWelcomeMessage())

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