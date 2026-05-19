#!/bin/bash
HELLO=Hello
function hello {
	local Hello=World
	echo $HELLO
}
echo $HELLO
hello
echo $HELLO
