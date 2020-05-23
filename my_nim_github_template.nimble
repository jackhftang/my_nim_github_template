# Package

version       = "0.1.0"
author        = "Jack Tang"
description   = "my_nim_github_template"
license       = "MIT"
backend       = "c"
srcDir        = "src"
binDir        = "bin"
bin           = @[]

# Dependencies

requires "nim >= 1.2.0"

proc updateNimbleVersion(ver: string) =
  let fname = "my_nim_github_template.nimble"
  let txt = readFile(fname)
  var lines = txt.split("\n")
  for i, line in lines:
    if line.startsWith("version"): 
      let s = line.find('"')
      let e = line.find('"', s+1)
      lines[i] = line[0..s] & ver & line[e..<line.len]
      break
  writeFile(fname, lines.join("\n"))

task version, "update version":
  # last params as version
  let ver = paramStr( paramCount() )
  if ver == "version": 
    # print current version
    echo version
  else:
    withDir thisDir(): 
      updateNimbleVersion(ver)

proc renamePackage(fname, tname: string) =
  let nimbleFile = tname & ".nimble"
  mvFile("src/" & fname & ".nim", "src/" & tname & ".nim")
  mvFile(fname & ".nimble", nimbleFile)
  let t1 = readFile(nimbleFile)
  let t2 = t1.replace("my_nim_github_template", tname)
  writeFile(nimbleFile, t2)

task rename, "rename package":
  let pname = paramStr( paramCount() )
  if pname == "rename":
    echo "no package name provided"
    quit 1
  else:
    withDir thisDir():
      renamePackage("my_nim_github_template", pname)

task docgen, "generate docs":
  exec "nim doc --out:docs/index.html --project src/my_nim_github_template.nim"

task release_patch, "release with patch increment":
  exec "release-it --ci -i patch"

task release_minor, "releaes with minor increment":
  exec "release-it --ci -i minor"

task release_major, "release with major increment":
  exec "release-it --ci -i major"