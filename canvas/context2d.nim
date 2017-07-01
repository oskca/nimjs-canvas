# Contains the Context2D bindings
from dom import ImageElement
export ImageElement
import jsffi

include types

converter toFloat*(x:int): float = float(x)

type
  Context2D* {.importc.} = ref object of js
    canvas*: Canvas
    font*: cstring
    textAlign*: TextAlignment
    textBaseline*: TextBaseline

    lineWidth*: float
    lineCap*: LineCap
    lineJoin*: LineJoin
    miterLimit*: float
    lineDashOffset*: float

    shadowBlur*: float
    shadowColor*: cstring
    shadowOffsetX*: float
    shadowOffsetY*: float

    globalAlpha*: float
    globalCompositeOperation*: CompositeOperation

  TextAlignment* = distinct cstring
  TextBaseline* = distinct cstring
  LineCap* = distinct cstring
  LineJoin* = distinct cstring
  FillRule* = distinct cstring
  CompositeOperation* = distinct cstring
  Repetition* = distinct cstring

include consts

# Since the 2D Context's `fillStyle` and `strokeStyle` can accept multiple types
# the following six procs are needed to keep cohesion with the JS API.
# fillStyle

proc `fillStyle=`*(ctx: Context2D, color:cstring)
  {.importcpp:"#.fillStyle=#".}

proc `fillStyle=`*(ctx: Context2D, obj:CanvasGradient|CanvasPattern)
  {.importcpp:"#.fillStyle=#".}

proc `strokeStyle=`*(ctx: Context2D, color:cstring)
  {.importcpp:"#.strokeStyle=#".}

proc `strokeStyle=`*(ctx: Context2D, obj:CanvasGradient|CanvasPattern)
  {.importcpp:"#.strokeStyle=#".}

# These are getters for the procs above.  Their behavior is undefined if you
# pair their calls with the incorrect type
# fillStyle
proc fillStyleColor*(ctx: Context2D): cstring {.importcpp:"#.strokeStyle".}

proc fillStyleGradient*(ctx: Context2D): CanvasGradient {.importcpp:"#.strokeStyle".}

proc fillStylePattern*(ctx: Context2D): CanvasPattern {.importcpp:"#.strokeStyle".}

# strokeStyle
proc strokeStyleColor*(ctx: Context2D): cstring {.importcpp:"#.strokeStyle".}

proc strokeStyleGradient*(ctx: Context2D): CanvasGradient {.importcpp:"#.strokeStyle".}

proc strokeStylePattern*(ctx: Context2D): CanvasPattern {.importcpp:"#.strokeStyle".}


# Rectangle functions
proc clearRect*(ctx: Context2D; x, y: float|int; width, height: float|int) {.importcpp.}

proc fillRect*(ctx: Context2D; x, y: float|int; width, height: float|int) {.importcpp.}

proc strokeRect*(ctx: Context2D; x, y: float|int; width, height: float|int) {.importcpp.}

# Text functions
proc fillText*(ctx: Context2D; text: cstring; x, y: float|int) {.importcpp.}

proc fillText*(ctx: Context2D; text: cstring; x, y: float|int; maxWidth: float|int) {.importcpp.}

proc strokeText*(ctx: Context2D; text: cstring; x, y: float|int) {.importcpp.}

proc strokeText*(ctx: Context2D; text: cstring; x, y: float|int; maxWidth: float|int) {.importcpp.}

proc measureText*(ctx: Context2D; text: cstring): TextMetrics {.importcpp.}


# Line functions
proc getLineDash*(ctx: Context2D): seq[float] {.importcpp.}

proc setLineDash*(ctx: Context2D; segments: seq[float|int]) {.importcpp.}

# Gradients and Patterns
proc createLinearGradient*(ctx: Context2D; x0, y0: float|int; x1, y1: float|int;): CanvasGradient {.importcpp.}

proc createRadialGradient*(
  ctx: Context2D;
  x0, y0: float|int; r0: float|int;
  x1, y1: float|int; r1: float|int): CanvasGradient {.importcpp.}

proc createPattern*(
  ctx: Context2D;
  image: ImageElement;
  repetition: Repetition
): CanvasPattern {.importcpp.}

proc createPattern*(
  ctx: Context2D;
  image: Canvas;
  repetition: Repetition
): CanvasPattern {.importcpp.}

proc createPattern*(
  ctx: Context2D;
  image: Context2D;
  repetition: Repetition
): CanvasPattern {.importcpp.}

proc createPattern*(
  ctx: Context2D;
  image: ImageData;
  repetition: Repetition
): CanvasPattern {.importcpp.}


# Path manipulation
proc beginPath*(ctx: Context2D) {.importcpp.}

proc closePath*(ctx: Context2D) {.importcpp.}

proc moveTo*(
  ctx: Context2D;
  x, y: float|int
) {.importcpp.}

proc lineTo*(
  ctx: Context2D;
  x, y: float|int
) {.importcpp.}

proc bezierCurveTo*(
  ctx: Context2D;
  cp1x, cp1y: float|int;
  cp2x, cp2y: float|int;
  x, y: float|int
) {.importcpp.}

proc quadraticCurveTo*(
  ctx: Context2D;
  cpx, cpy: float|int;
  x, y: float|int
) {.importcpp.}

proc arc*(
  ctx: Context2D;
  x, y: float|int;
  radius: float|int;
  startAngle, endAngle: float|int;
  anticlockwise: bool = false
) {.importcpp.}

proc arcTo*(
  ctx: Context2D;
  x1, y1: float|int;
  x2, y2: float|int;
  radius: float|int;
) {.importcpp.}

# Note: this function works in Edge but not IE
proc ellipse*(
  ctx: Context2D;
  x, y: float|int;
  radiusX, radiusY: float|int;
  rotation: float|int;
  startAngle, endAngle: float|int;
  anticlockwise: bool = false
) {.importcpp.}

proc rect*(
  ctx: Context2D;
  x, y: float|int;
  width, height: float|int;
) {.importcpp.}

# Path drawing
proc fill*(ctx: Context2D) {.importcpp.}

proc fill*(
  ctx: Context2D;
  fillRule: FillRule
) {.importcpp.}

proc stroke*(ctx: Context2D) {.importcpp.}

proc clip*(ctx: Context2D) {.importcpp.}

proc clip*(
  ctx: Context2D;
  fillRule: FillRule
) {.importcpp.}

proc isPointInPath*(
  ctx: Context2D;
  x, y: int
): bool {.importcpp.}

proc isPointInPath*(
  ctx: Context2D;
  x, y: int;
  fillRule: FillRule
): bool {.importcpp.}

proc isPointInStroke*(
  ctx: Context2D;
  x, y: int
): bool {.importcpp.}


# Transformations
proc rotate*(
  ctx: Context2D;
  angle: float|int
) {.importcpp.}

proc scale*(
  ctx: Context2D;
  x, y: float|int
) {.importcpp.}

proc translate*(
  ctx: Context2D;
  x:int|float, y: int|float
) {.importcpp.}

proc transform*(
  ctx: Context2D;
  a: int|float;   # Horizontal scaling
  b: int|float;   # Horizontal skewing
  c: int|float;   # Vertical skewing
  d: int|float;   # Vertical scaling
  e: int|float;   # Horizontal moving
  f: int|float    # Vertical moving
) {.importcpp.}

proc setTransform*(
  ctx: Context2D;
  a: int|float;   # Horizontal scaling
  b: int|float;   # Horizontal skewing
  c: int|float;   # Vertical skewing
  d: int|float;   # Vertical scaling
  e: int|float;   # Horizontal moving
  f: int|float    # Vertical moving
) {.importcpp.}

# Note: the native function doesn't work in IE, Opera, or Safari, but it can be
#       emulated by calling setTransform() with an identity matrix
proc resetTransform*(ctx: Context2D) {.inline.} =
  ctx.setTransform(1, 0, 0, 1, 0, 0)


# Image Drawing
# Using an <img> as an image source
proc drawImage*(
  ctx: Context2D;
  image: ImageElement;
  dx, dy: float|int
) {.importcpp.}

proc drawImage*(
  ctx: Context2D;
  image: ImageElement;
  dx, dy: float|int;
  dWidth, dHeight: float|int;
) {.importcpp.}

proc drawImage*(
  ctx: Context2D;
  image: ImageElement;
  sx, sy: float|int;
  sWidth, sHeight: float|int;
  dx, dy: float|int;
  dWidth, dHeight: float|int;
) {.importcpp.}

# Using a <canvas> as an image source
proc drawImage*(
  ctx: Context2D;
  image: Canvas;
  dx, dy: float|int
) {.importcpp.}

proc drawImage*(
  ctx: Context2D;
  image: Canvas;
  dx, dy: float|int;
  dWidth, dHeight: float|int;
) {.importcpp.}

proc drawImage*(
  ctx: Context2D;
  image: Canvas;
  sx, sy: float|int;
  sWidth, sHeight: float|int;
  dx, dy: float|int;
  dWidth, dHeight: float|int;
) {.importcpp.}


# Pixel manipulation
proc createImageData*(
  ctx: Context2D;
  width, height: int;
): ImageData {.importcpp.}

proc createImageData*(
  ctx: Context2D;
  imagedata: ImageData
): ImageData {.importcpp.}

proc getImageData*(
  ctx: Context2D;
  sx, sy: float|int;
  sw, sh: float|int;
): ImageData {.importcpp.}

proc putImageData*(
  ctx: Context2D;
  imagedata: ImageData;
  dx, dy: float|int;
) {.importcpp.}

proc putImageData*(
  ctx: Context2D;
  imagedata: ImageData;
  dx, dy: float|int;
  dirtyX, dirtyY: float|int;
  dirtyWidth, dirtyHeight: float|int;
) {.importcpp.}


# Canvas State
proc save*(ctx: Context2D) {.importcpp.}

proc restore*(ctx: Context2D) {.importcpp.}

