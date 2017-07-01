# Package
version       = "1.0"
author        = "oskca"
description   = "HTML5 Canvas for the JavaScript backend."
license       = "MIT"

# Dependencies
requires "nim >= 0.16.0"

skipFiles = @["kevin-bacon.jpg", "pattern.png", "test.html", "test.nim"]

task docs, "generate documents for canvas":
    exec("nim doc2 -o:docs/canvas.html canvas.nim")