when true:
#   import segfaults
  var a: ptr int
  try:
    echo a[]
  except NilAccessDefect:
    echo "SegFault!"
