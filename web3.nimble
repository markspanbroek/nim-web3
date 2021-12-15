mode = ScriptMode.Verbose

version       = "0.0.1"
author        = "Status Research & Development GmbH"
description   = "This is the humble begginings of library similar to web3.[js|py]"
license       = "MIT or Apache License 2.0"

### Dependencies
requires "nim >= 0.18.0"
requires "chronicles"
requires "chronos"
requires "eth"
requires "faststreams"
requires "json_rpc"
requires "json_serialization"
requires "nimcrypto"
requires "stew"
requires "stint"
requires "contractabi >= 0.3.0 & < 0.4.0"

### Helper functions
proc getLang(): string =
  var lang = "c"
  if existsEnv"TEST_LANG":
    lang = getEnv"TEST_LANG"
  lang

proc test(name: string, defaultLang = getLang()) =
  # TODO, don't forget to change defaultLang to `cpp` if the project requires C++
  if not dirExists "build":
    mkDir "build"
  --run
  switch("out", ("./build/" & name))
  setCommand defaultLang, "tests/" & name & ".nim"

### tasks
task test, "Run all tests":
  test "all_tests"
