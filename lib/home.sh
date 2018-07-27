## \brief A home for your scripts.

## \env SHELLM_HOME
## Path to the directory where new files are created.

home() {
  local cmd="$1"

  if command -v "home-${cmd}" &>/dev/null; then
    shift
    # shellcheck disable=SC2086
    home-${cmd} "$@"
  elif command -v "${cmd}" &>/dev/null; then
    if pushd "${SHELLM_HOME}" >/dev/null; then
      "$@"
      popd >/dev/null
    fi
  else
    echo "home: unknown command '${cmd}'" >&2
    return 1
  fi
}
export -f home

home-set() {
  if [ $# -gt 1 ]; then
    echo "home-use: too many arguments" >&2
    return 1
  elif [ $# -eq 1 ]; then
    if [ -d "$1" ]; then
      SHELLM_HOME="$1"
    else
      echo "home-use: no such directory: $1 (from argument 1)" >&2
      return 1
    fi
  elif [ -n "${SHELLM_HOME}" ]; then
    if ! [ -d "${SHELLM_HOME}" ]; then
      echo "home-use: no such directory: ${SHELLM_HOME} (from SHELLM_HOME variable)" >&2
      return 1
    fi
  elif [ -e "${HOME}/.shellm-home" ]; then
    SHELLM_HOME="$(readlink -f "${HOME}/.shellm-home")"
  else
    echo "home-use: no home loaded, try 'home-set --help' to see how home directories are set" >&2
    return 1
  fi

  export SHELLM_HOME

  if ! echo "${PATH}" | grep -q "${SHELLM_HOME}/bin"; then
    export PATH="${SHELLM_HOME}/bin:${PATH}"
  fi

  if ! echo "${MANPATH}" | grep -q "${SHELLM_HOME}/man"; then
    export MANPATH="${SHELLM_HOME}/man:${MANPATH}"
  fi

  if ! echo "${LIBPATH}" | grep -q "${SHELLM_HOME}/lib"; then
    export LIBPATH="${SHELLM_HOME}/lib:${LIBPATH}"
  fi
}
export -f home-set

home-source() {
  # shellcheck disable=SC1090
  . "${SHELLM_HOME}/$1"
}
export -f home-source
