# My Nim Github Template 


## Usage

```sh
PACKAGE_NAME="new_package_name_here"
FOLDER_NAME=$PACKAGE_NAME.nim
git clone git@github.com:jackhftang/my_nim_github_template.git $FOLDER_NAME
cd $FOLDER_NAME
nimble rename $PACKAGE_NAME
rm -rf .git
git init .
git add --all
git commit -a -m "start from template"
```

## Feature 

- travis integration
- [release-it](https://github.com/release-it/release-it) integration
- recursively include files under /src with suffer `_test.nim` to test

## Tasks 

- `docgen` to generate docs
- `release_patch`, `release_minor`, `release_major` to auto versioning, run test, update nimble version, generate docs and release
- `rename` used to rename this template into new project name

## Directories

`/bin` folder for compiled binary, git-ignored.

`/docs` folder for `nimble docgen`, match the name of github page. 

`/examples` folder for public code snippets, git-ed.

`/src` folder for source files.

`/test` folder for test files.

`/var` folder for quick, usually temporary try-out files. git-ignored. 



