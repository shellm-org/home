## \brief Shellm project framework.

## TODO: add docs
project-load() {
  if [ $# -gt 1 ]; then
    echo "project-load: too many arguments" >&2
    return 1
  elif [ $# -eq 1 ]; then
    if [ -f "$1" ]; then
      SHELLM_PROJECT_PROFILE="$(readlink -f "$1")"
    else
      echo "project-load: no such file: $1 (from argument 1)"
    fi
  elif [ -n "${SHELLM_PROJECT_PROFILE}" ]; then
    if [ -f "${SHELLM_PROJECT_PROFILE}" ]; then
      SHELLM_PROJECT_PROFILE="$(readlink -f "${SHELLM_PROJECT_PROFILE}")"
    else
      echo "project-load: no such file: ${SHELLM_PROJECT_PROFILE} (from SHELLM_PROJECT_PROFILE variable)"
    fi
  elif [ -f "${HOME}/.project-profile" ]; then
    SHELLM_PROJECT_PROFILE="$(readlink -f "${HOME}/.project-profile")"
  else
    echo "project-load: no project profile loaded, try 'shellm help project-load' to see how project profiles are loaded" >&2
    return 1
  fi

  SHELLM_PROJECT="$(dirname "${SHELLM_PROJECT_PROFILE}")"
  SHELLM_DATA="${SHELLM_PROJECT}/data"

  export SHELLM_PROJECT_PROFILE SHELLM_PROJECT SHELLM_DATA

  if ! echo "${PATH}" | grep -q "${SHELLM_PROJECT}/bin"; then
    export PATH="${SHELLM_PROJECT}/bin:${PATH}"
  fi

  export MANPATH="${SHELLM_PROJECT}/man:${MANPATH}"
  export LIBPATH="${SHELLM_PROJECT}/lib:${LIBPATH}"

  # shellcheck disable=SC1090
  . "${SHELLM_PROJECT_PROFILE}"
}

## TODO: add docs
project-cd() {
  # shellcheck disable=SC2164
  cd "${SHELLM_PROJECT}/$1"
}
