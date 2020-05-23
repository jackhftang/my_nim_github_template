import os, strutils, macros

macro runAllTests(): untyped =
  ## include all file under src with suffix _test.nim
  let testsPath = currentSourcePath()
  let rootPath = testsPath.parentDir.parentDir
  let srcPath = joinPath(rootPath, "src")

  result = newStmtList()
  for path in walkDirRec(srcPath, relative = true):
    if path.endsWith "_test.nim":
      let p = "../src/" & path
      echo "include " & p
      result.add nnkIncludeStmt.newTree(ident(p))

runAllTests()
