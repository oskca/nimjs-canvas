import dom

type
  Canvas* {.importc.} = ref object of dom.Element
    width*: int
    height*: int

type
  TextMetrics* = ref TextMetricsObj
  TextMetricsObj {.importc.} = object
    width*: float   # This is read-only


proc toDataURL*(c: Canvas; imageFormat:cstring="image/png"; encoderOptions:float=0.92):cstring {.inline.} =
  {.emit: [result, "=", c, ".toDataURL(", imageFormat, ",", encoderOptions, ");"].}

type
  CanvasGradient* = ref CanvasGradientObj
  CanvasGradientObj {.importc.} = object

proc addColorStop*(cg: CanvasGradient; offset: float; color: cstring) {.importcpp.}

type
  CanvasPattern* = ref CanvasPatternObj
  CanvasPatternObj {.importc.} = object

type
  ImageData* = ref ImageDataObj
  ImageDataObj {.importc.} = object
    width*: int         # read-only
    height*: int        # read-only
    data*: seq[uint8]   # read-only

from colors import Color, extractRGB

## Get an RGB color
proc rgb*(r, g, b: int): cstring {.inline.} =
  return "rgb(" & $r & "," & $g & "," & $b & ")"

## Convert a Nim Color over to a JS friendly color
proc rgb*(clr: Color): cstring {.inline.} =
  let comp = extractRGB(clr)
  return rgb(comp.r, comp.g, comp.b)

