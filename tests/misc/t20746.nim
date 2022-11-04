import std/strutils
const source = staticRead("t20746.txt")

static:
  echo "multiReplace - takes a long time in VM since: ae050b05e9ce6f4e356c46de8722724a2f706e18"
  let res = source.multiReplace(
              ("{.inject.}", ""),
              ("{.inject, ", "{."),
              ("<", "["),
              (">", "]"), #Changes Gen. Some types has two levels of inherantce in cpp, that we dont really need to support
              ("::Type", ""), #Enum namespaces EEnumName::Type
              ("::Mode", ""), #Enum namespaces EEnumName::TypeB
              ("::", "."), #Enum namespace
              ("__DelegateSignature", ""))
  writeFile("t20746_result.txt", res)
  echo "finished"
