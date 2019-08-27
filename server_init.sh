#!/bin/bash

dependencies=(
)

usage()
{
    u_print "Something went wrong."
    echo
    argAray1=("${!1}")
    for v in "${argAray1[@]}"; do
        echo "${v}"
    done
    echo
    echo "USAGE: ${0} <remote ip-address> <root-password>"
    echo "EXAMPLE: ${0} 10.0.0.34 qwer"
    if  [ -z "$dependencies" ]; then
        dependencies=(
            'no dependencies'
        )
    fi
    echo
    echo "dependencies: ${dependencies[@]}"
}

repeat_char()
{
    str=${1}
    num=${2}
    v=$(printf "%-${num}s" "${str}")
    echo "${v// /${str}}"
}

u_print()
{
    msg="${1}"
    echo ''
    echo ''
    repeat_char '*' $(( ${#msg} + 8 ))
    echo "*** ${msg} ***"
    repeat_char '_' $(( ${#msg} + 8 ))
}

if [ -z ${1} ]; then
    errors+=("Specify the remote ip address")
fi

if [ -z ${2} ]; then
    errors+=("Specify the remote root password")
fi

if [ -z ${3} ]; then
    errors+=("Specify an existing remote username")
fi

if [ -z ${4} ]; then
    errors+=("Specify the remote users password")
fi

if [ "${#errors}" -gt 0 ]; then
    usage errors[@]
    exit 1
fi

ip=${1}
root_pw=${2}
user=${3}
user_pw=${4}

u_print "Given parameters"
echo ${ip}
echo ${root_pw}
echo ${user}
echo ${user_pw}
