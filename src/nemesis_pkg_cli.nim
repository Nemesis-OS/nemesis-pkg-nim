import std/[strformat, strutils, os], utils, syncrepos, history, colors

proc showHelp =
  echo "usage: nemesis-pkg [options] [arguments]"
  echo "install <pkg>\tinstall a package"
  echo "uninstall <pkg>\tremove a package"
  echo "sync\t\tsynchronize package databases"
  echo "update\t\tupdate all packages from current database"
  echo "upgrade\t\tsync databases and perform an update"

proc getAction: string =
  if paramCount() > 0:
    paramStr(1)
  else:
    showHelp()
    quit 1

proc getPackageArg: string =
  if paramCount() > 1:
    paramStr(2)
  else:
    showHelp()
    quit 1

proc nemesisInstall* =
  let pkgName = getPackageArg()
  writeHistory(fmt"install {pkgName}")
  echo fmt"{RED}error{RESET}: this feature is not yet implemented. :("
  quit 0

proc nemesisUninstall* =
  let pkgName = getPackageArg()
  writeHistory(fmt"install {pkgName}")
  echo fmt"{RED}error{RESET}: this feature is not yet implemented. :("
  quit 0

proc main =
  let action = getAction()

  if action.actionRequiresRoot() and not isAdmin():
    echo fmt"{RED}error{RESET}: this action requires superuser privileges (under the root user on most systems)."
    quit 1

  if action.toLowerAscii() == "install":
    nemesisInstall()
  elif action.toLowerAscii() == "uninstall":
    nemesisUninstall()
  elif action.toLowerAscii() == "sync":
    nemesisSync()
    
when isMainModule: main()