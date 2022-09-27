discard """
action: compile
"""
proc foo[T](t: T) = discard

proc bar[T](t: T) =
  # Fails here
  foo[void](t)

bar[void]()

proc bar1[T](x: T): string =
  "something"

proc foo1[T](x: T) =
  doAssert bar1(x) == "something"

foo1[void]()