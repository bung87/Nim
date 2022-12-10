type
  Foo[N: static[int]] = object

proc `$`[N: static[int]](f: Foo[N]): string =
  "Success"

let a = Foo[10]()
echo a

type
  Bar[N: static[int8]] = object


proc `$`[N: static[int8]](f: Bar[N]): string =
  "Success"

let b = Bar[10]()
echo b
