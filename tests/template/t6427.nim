type Foo*[A; B; C: static[int]] = object
  s: string

proc build*[A; B; C: static[int]](s: string;): Foo[A, B, C] =
    result.s = s

proc build*[A; B; C: static[int]](): Foo[A, B, C] =
    build[A, B, C]("foo")

type
    Bar = object
    Baz = object
let r = build[Bar, Baz, 1]()
doAssert r.s == "foo"