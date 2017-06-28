# This file is simply a meta-file that combines the necessary parts for this
# package to work.  Though because of Circular import issues, two procs are
# placed here.

when not defined(js) and not defined(Nimdoc):
  {.error: "This module only works for the JavaScript target.".}


include private/context2d

# The combinded functions go here:

# Context grabbing
# For 2D only
proc getContext2D*(c: Canvas): Context2D {.importcpp:"#.getContext('2d')".}
