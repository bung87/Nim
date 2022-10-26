type
  Foo[X, T] = object
    bar: array[X.low..X.high, T]

proc test[X, T](f: Foo[X, T]) =
  echo f.bar[X.low]
