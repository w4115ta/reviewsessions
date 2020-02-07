#! /bin/bash

x=":)"

foo () {
	echo $x 
}

bar () {
	local x=":(" ; foo; 
}

echo $x

foo

bar
