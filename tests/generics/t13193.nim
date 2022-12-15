import typetraits

type
  CpuStorage[T] {.shallow.} = ref object
    when supportsCopyMem(T):
      raw_buffer*: ptr UncheckedArray[T] # 8 bytes
      memalloc*: pointer                 # 8 bytes
      isMemOwner*: bool                  # 1 byte
    else: # Tensors of strings, other ref types or non-trivial destructors
      raw_buffer*: seq[T]                # 8 bytes (16 for seq v2 backed by destructors?)

  Tensor*[T] = object
    storage*: CpuStorage[T]

proc foo(t: Tensor[auto]): bool =
  # This breaks
  return false

proc bar[T](t: Tensor[T]): bool =
  return false

let a = Tensor[int]()
discard foo(a)
discard bar(a)
