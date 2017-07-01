const
  # TextAlignment
  TextAlignLeft* = "left".TextAlignment
  TextAlignRight* = "right".TextAlignment
  TextAlignCenter* = "center".TextAlignment
  TextAlignStart* = "start".TextAlignment
  TextAlignEnd* = "end".TextAlignment

  # TextBaseline
  TextBaselineTop* = "top".TextBaseline
  TextBaselineHanging* = "hanging".TextBaseline
  TextBaselineMiddle* = "middle".TextBaseline
  TextBaselineAlphabetic* = "alphabetic".TextBaseline
  TextBaselineIdeographic* = "ideographic".TextBaseline
  TextBaselineBottom* = "bottom".TextBaseline

  # TODO figure out a way to drop the "Cap," and "Join," portions of these.
  #      The problem is that plain old "Round," would conflict
  # LineCap
  LineCapButt* = "butt".LineCap
  LineCapRound* = "round".LineCap
  LineCapSquare* = "square".LineCap

  # LineJoin
  LineJoinRound* = "round".LineJoin
  LineJoinBevel* = "bevel".LineJoin
  LineJoinMiter* = "miter".LineJoin

  # FillRule
  FillRuleNonZero* = "nonzero".FillRule
  FillRuleEvenOdd* = "evenodd".FillRule

  # CompositeOperation
  CompositeOptSourceOver* = "source-over".CompositeOperation
  CompositeOptSourceIn* = "source-in".CompositeOperation
  CompositeOptSourceOut* = "source-out".CompositeOperation
  CompositeOptSourceAtop* = "source-atop".CompositeOperation
  CompositeOptDestinationOver* = "destination-over".CompositeOperation
  CompositeOptDestinationIn* = "destination-in".CompositeOperation
  CompositeOptDestinationOut* = "destination-out".CompositeOperation
  CompositeOptDestinationAtop* = "destination-atop".CompositeOperation
  CompositeOptLighter* = "lighter".CompositeOperation
  CompositeOptCopy* = "copy".CompositeOperation
  CompositeOptXOR* = "xor".CompositeOperation
  CompositeOptMultiply* = "multiply".CompositeOperation
  CompositeOptScreen* = "screen".CompositeOperation
  CompositeOptOverlay* = "overlay".CompositeOperation
  CompositeOptDarken* = "darker".CompositeOperation
  CompositeOptLighten* = "lighten".CompositeOperation
  CompositeOptColorDodge* = "color-dodge".CompositeOperation
  CompositeOptColorBurn* = "color-burn".CompositeOperation
  CompositeOptHardLight* = "hard-light".CompositeOperation
  CompositeOptSoftLight* = "soft-light".CompositeOperation
  CompositeOptDifference* = "difference".CompositeOperation
  CompositeOptExclusion* = "exculsion".CompositeOperation
  CompositeOptHue* = "hue".CompositeOperation
  CompositeOptSaturation* = "saturation".CompositeOperation
  CompositeOptColor* = "color".CompositeOperation
  CompositeOptLuminosity* = "luminosity".CompositeOperation

  # Repetition
  Repeat* = "repeat".Repetition
  RepeatX* = "repeat-x".Repetition
  RepeatY* = "repeat-y".Repetition
  RepeatNo* = "no-repeat".Repetition