import os, strutils, macros

macro runAllTests(): untyped =
  ## include all file under src with suffix _test.nim
  let testsPath = currentSourcePath()
  let rootPath = testsPath.parentDir.parentDir
  let srcPaths = [
    joinPath(rootPath, "src"),
    joinPath(rootPath, "tests")
  ]
  result = newStmtList()
  for srcPath in srcPaths:
    for path in walkDirRec(srcPath, relative = true):
      if path.endsWith "_test.nim":
        let p = srcPath / path
        echo "include " & p
        result.add nnkIncludeStmt.newTree(ident(p))

runAllTests()
