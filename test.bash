#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Syun Naitou
# SPDX-License-Identifier: BSD-3-Clause

ng () {
        echo ${1}行目が違うよ
	res=1
}

res=0
COMMAND="./loan_money"

### NOMAL INPUT ###
out=$(echo "2000 30 2.0" | ./loan_monry)
["${out}" = "月々の返済額：73,924円" ] || ng"$LINENO"

## STRANGE INOUT ###
out=$(echo "a" | ./loan_monry)
[ "$?" = 1 ] || ng"$LINENO" 
["${out}" = "" ] || ng"$LINENO"

out=$(echo "a b" | ./loan_monry)
[ "$?" = 1 ] || ng"$LINENO"
["${out}" = "" ] || ng"$LINENO"

out=$(echo "a b c" | ./loan_monry)
[ "$?" = 1 ] || ng"$LINENO"
["${out}" = "" ] || ng"$LINENO"

out=$(echo "10 2" | ./loan_monry)
[ "$?" = 1 ] || ng"$LINENO"
["${out}" = "" ] || ng"$LINENO"

out=$(echo "10 2 3.0 4" | ./loan_monry)
[ "$?" = 1 ] || ng"$LINENO"
["${out}" = "" ] || ng"$LINENO"
