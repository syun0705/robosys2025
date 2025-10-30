#!/bin/bash -xv
#SPDX-FileCopyrightText: 2025 Syun Naitou
#SPDX-License-Identifier: BSD-3-Clause

ng () {
	echo ${1}行目が違う
	res=1
}

res=0

#nomal command#
a=$(seq 5 | ./plus)

[ "$a" = 15.0 ] || ng "$LINENO"

#stlenge command#

a=$(echo あ | ./plus)

[ "$?" = 1 ] || ng "$LINENO"
[ "${a}" = "" ] || ng "$LINENO"

a=$(echo | ./plus)

[ "$?" = 1 ] || ng "$LINENO"
[ "${a}" = "" ] || ng "$LINENO"

["$res" = 0 ] && echo OK

exit $res
