type
  ExampleArray[Size, T] = array[Size, T]

var integerArray : ExampleArray[32, int]  # Compiler crash!
echo(integerArray.len)