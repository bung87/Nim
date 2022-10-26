discard """
  action: "compile"
"""

proc foo(x: string | openarray[int]) = discard
[1, 2, 3].foo()
