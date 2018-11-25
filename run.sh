#!/bin/bash
declare -r TOP="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "${TOP}/libs/loadLibraries.sh"

#############################################################################
#
#  run devops_container_environment
#
#############################################################################

workspace.main "$TOP" "$@"