load data

shells="${SHELLS:-ash bash bosh bsh csh dash fish ksh mksh posh scsh sh tcsh xonsh yash zsh}"

_checkbashisms() {
  checkbashisms -fpx "$@" 2>&1 | sed 's/possible bashism in //g'
  # shellcheck disable=SC2086
  return ${PIPESTATUS[0]}
}

_shell_compatibility() {
  local output script shell status=${success}
  for script in "$@"; do
    for shell in ${shells}; do
      if shenv shell "${shell}"; then
        if ! output=$(shenv exec ${shell//-*} -n "${script}" 2>&1); then
          status=${failure}
          echo "${script}:${shell} ------------------------------"
          echo "${output}"
          echo
        fi
        shenv shell --unset
      fi
    done
  done
  return ${status}
}

@test "compatibility scripts (checkbashisms)" {
  # Remove or comment this line when you are ready to run this test.
  skip "Compatibility is not yet enforced"
  if [ ! -n "${scripts}" ]; then
    skip "No scripts found"
  fi
  _checkbashisms ${scripts}
}

@test "compatibility libraries (checkbashisms)" {
  # Remove or comment this line when you are ready to run this test.
  skip "Compatibility is not yet enforced"
  if [ ! -n "${libs}" ]; then
    skip "No libraries found"
  fi
  _checkbashisms ${libs}
}

@test "compatibility scripts (shells dry run)" {
  # Remove or comment this line when you are ready to run this test.
  # skip "Compatibility is not yet enforced"
  if [ ! -n "${scripts}" ]; then
    skip "No scripts found"
  fi
  _shell_compatibility ${scripts}
}

@test "compatibility libraries (shells dry run)" {
  # Remove or comment this line when you are ready to run this test.
  # skip "Compatibility is not yet enforced"
  if [ ! -n "${libs}" ]; then
    skip "No libraries found"
  fi
  _shell_compatibility ${libs}
}
