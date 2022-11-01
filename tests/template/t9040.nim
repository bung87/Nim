import std/macros

block:
  # Error: type expected
  macro fun1*[N: static int](): untyped =
    # 1 # original bug report
    newLit 1 # EDIT

  const a = fun1[2]()

block:
  # compiles: ok
  proc fun1*[N: static int](): auto =
    1
  const a = fun1[2]()

block:
  # compiles, but this exposes an ambiguity in `N:int` syntax as it accepts both 2 and int
  proc fun1*[N: int](): auto =
    1
  const a = fun1[2]()
  const a2 = fun1[int]()

block:
  # Error: type expected
  template fun1*[N: static int](): untyped =
    1
  const a = fun1[2]()

block:
  # Error: type expected
  template fun1*[N: int](): untyped =
    1
  const a = fun1[2]()
