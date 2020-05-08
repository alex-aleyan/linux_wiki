#!/bin/bash

# Use dos2unix script.sh if the file originated from a windows side.

# Create ~/.vimrc file containing: set tabstop=4; set syntax=bash; set nu, set autoindent

# How to write a script:
#	1) Write a script and make sure the first line contains #!/bin/bash where #! called SHEBANG
#	2) Make it executable chmod 775 your_script.sh
#	3) Put it where shell can find it (good location: ~/bit, /usr/local/bin, /usr/local) and export it:
#		export $PATH=~/bin:$PATH
#		source ~/.bashrc
#	4) Long Option names are preferred over the short ones when writing a script:
#		Ex: rsync --dry-run preferred over rsync -n
#	5) To continue with the script on the next line, use \
#		Ex:	rsync --dry-run \
#			--update and_so_on

# Variable Names:
#	1) Can begin with a letter or an underscore
#	2) Can consist of letters, numbers or underscores
#	3) Space and punctuation symbols are not allowed
#	4) No space allowed between equal sign and a variable name. Ex: var1="some string"
#	5) Results of a command can be captured by variable: 
var1=$(echo "hello")
echo "var1: $var1"
#	6) Results of an arithmetic expansions can be captured by a variable: 
product=$((5 * 7))
echo "product: $product"
#	7) To concatenate variable's return value and a string:
var2="${var1}there"
echo "var2: ${var2}"
#	8) To concatenate two variables: 
var3="${var1}${var2}"
echo "var3: $var3"
#	9) To declare a constant, use declare -r CONST="it's content"
declare -r con1="Hello there"
echo "con1: $con1"
#	10) To restrict the variable to integer values, use declare -i option:
declare -i int_var1=5
echo "int_var1: $int_var1"


# Here Script:
#	1) an additional form of IO redirection where a body of text is provided to a command instead of a file.
#	2) For example, instead of doing cat file1.txt, we can do:
cat << _EOF_ #NO TRAILING SPACES AFTER _EOF_ ARE ALLOWED!
Hello HERE SCRIPT!
_EOF_
#	3) No trailing spaces are allowd after _EOF_ token
#	4) Single and Double Quotes withing Here Script don't have special meaning and printed as is.
#	5) Using <<- instead of << makes shell ignore leading tab characters so the text can be indented.
cat << _EOF_
"Hello HERE SCRIPT!"
_EOF_


# Shell Functions:
#	1) Preferred method of creating small commands for personal use
#	2) Excellent replacement for aliases
#	3) Just place your function in .bashrc and you got an alias!
show_disk_space () {
	echo "Disk Space Utilization for $HOSTNAME"
	df -h
return
}
show_disk_space

# Remember to chmod 555 your_script.sh
# Quotes:
#  Single Quotes:
#       1) All characters between the single quotes make up a single parameter.
#       2) no variable substitution takes place.
#       3) To put single quote inside a single quoted string, use:
echo 'this isn'\''t fun'
#  Double Quotes:
#       1) All characters between the double quotes make up a single parameter.
#       2) GLOBs don't get substituted but shell variables do: ech "This prints path: $PATH"
#       3) You can put single quotes inside double quotes: "This is no problem at all: it's, isn't, aren't"

# Special Variables:
#  echo "A variable: $VAR"
#  echo "First Argument: $1"
#  echo "Second Argument: $2"
#  echo "Number of Argument: $#"
#  echo "All Argument: $@"
#  echo "Script Name: $0"
#  echo "Process UD: $$"
#  echo "EXIT code of the last command: $?"

# Conditionals [true/false?](remember,they test the EXIT value using test command!)
# in other words, "if [ x -eq 0]; then" is the same as "if test x -eq 0; then"
#  Note: [ is an alias to the test command:
#       -b file exists and is a block special file
#       -c file exists and a character special file
#       -d file exists and is a directory
#       -e file exists
#       -f file exists and is a regular file
#       -g file exists and is a set-froup-id
#       -G file exists and is owned by the effective group ID
#       -k file exists and has its sticky bit set
#       -L file exists and is a symbolic link
#       -O file exists and is owned by effective user ID
#       -p file exists and is named pipe
#       -r file exists and is readable
#       -s file exists and has length greater than zero
#       -S file exists and is a Network Socket
#       -t fd directory file
#       -u file exists and is setuid
#       -w file exists and is writable
#       -x file exists and is executable
#		-ef used as "test file1 -ef file2" and the test command returns zero if the 2 files have the same inode
#		-nt used as "test file1 -nt file2" and the test command returns zero if file1 is newere than file2
#		-ot used as "test file1 -ot file2" and the test command returns zero if file1 is older than file2

#  String Test:
#       -z returns true if the string is 0 characters long: test -z "some_string"
test -z ""
echo "-z: $?"
test -z "hey"
echo "-z: $?"
#       -n returns true if the string has length longer than 0 characters: test -n "some_string"
#       "string1" == "string2" returns 0 if string1 and string2 two are equal
test "hello" == "hello"
echo "str == str: $?"
test "hell0" == "hello"
echo "str == str: $?"
#       "string1" != "string2" returns 0 if string1 and string2 are different
test "hello" != "hello"
echo "str == str: $?"
test "hell0" != "hello"
echo "str == str: $?"
#       "string1" > "string2" NOT SURE HOW TO USE THIS
#       "string1" < "string" NOT SURE HOW TO USE THIS

#  Arithmetic Tests and arithmetic compund command (( )) used to perform Arithmetic Truth Test:
#       -eq equal to
test $((5 % 2)) -eq 0
echo "-eq: $?"
if (( ((4 % 2)) == 0 )); then
	echo "It's an even number: $?"
fi	
#       -ne not equalto
#       -lt less than
#       -gt greater than
#       -le less than or equal to
#       -ge greater than or equal to

#  String Compound Command [[ ]]
#        =~ Checks if a string on the left side matched regular expressions on the right side:
#			Example if [[ "$INT" =~ ^-?[0-9]+$ ]]; then
[[ "hello.txt" =~ ^.+txt$ ]];
echo "hello.txt =~ ^.+txt$: $?"
[[ "hello.tx" =~ ^.+txt$ ]];
echo "hello.tx =~ ^.+txt$: $?"
#       -eq
#       -ne
#       -lt
#       -gt
#       -le
#       -ge

# ========== Combining Expressions: =============:
#	Operation	test	[[]] and (())
#	AND			-a			&&
#	OR			-o			||
#	NOT			!			!
#	1) When used inside [[]], (()), test; the || and && operators work as logical operators
var1=5
var2=5
if (( (( $var1 == $var2 )) && (( 6 == 6)) )); then
	echo "5 is 5 and 6 is 6"
	var3=$((var1 + var2))
	echo var3 is $var3
fi
#	2) When used with commands; the || and && operators work as branching control operators
ls ./karamba && echo "karamba exist" || echo 'karamba d.n. exist'
ls ./sys* && echo 'sys* exists'

# Regular Expressions metacharacters (all other characters are literal): ^ $ . [ ] { } - ? * + ( ) | \

# BRE (basic regular expressions):
#	* match any number of any characters
#	. dot designates any character match
#	^ caret anchor and designates beggining of the string
#	$ dollar sing designates end of string
#	[] bracket expression specifies a set of characters to be matched per a single character
#		[^ ] caret within a square bracket expression means negation (characters must not be matched).
#		[A-Za-z0-9] match a single Capital Letter, or a non-capital letter, or a digit
#		[-AZ] match a dash, or an A or a Z

# ERE (extended regular expressions; (), {}, ? + | not treated as literals and have to be escaped to be treated such):
#	| alteration mean use either one: 
#		grep -E 'AAA|BBB|CCC' will try to match AAA or BBB or CCC
#		grep -E '^(bg|gs|zip)' file*.txt  
#	? match zero or one time quatifier
#	* match an element zero or more times
#	+ match an element one or more times
#	{n,m} match an element more than n times but less than m times


# POSIX Character Classes:
#	[:alnum:] same as [A-Za-z0-9
#	[:word:]
#	[:alpha:]
#	[:blank:]
#	[:cntrl:]
#	[:digit:]
#	[:graph:]
#	[:lower:]
#	[:punct:]
#	[:print:]
#	[:space:]
#	[:upper:]
#	[:xdigit:]


# Single parethesis [ ] aka test command: 
#	1) All expressions and operators are treated as command arguments by shell.
#	2) All characters that have special meaning to bash such as <,>,(,) must be quoted or escaped
#	3) 

# Interger Compound Command: if ((true/false?)):
#		if ((1)) which is always true!
#		if ((0)) which is always false!
#       if ((INT == 0)) where INT=-5
#       if ((INT < 0))
#       if (( ((INT%2)) == 0 ))
# Combining Expressions:
#       Operation   test,[]    [[]], (())
#       AND         -a          &&
#       OR          -o          ||
#       NOT         !           !
#       if [[ INT -ge MIN_VAL && INT -le MAX_VAL]]; then
#       if [ $INT -ge $MIN_VAL -a $INT -le $MAX_VAL]; then
#       if [[ ! (INT -ge MIN_VAL -a INT -le MAX_VAL) ]]; then # the round parenthises used for grouping only
#       if [ ! \($INT -ge $MIN_VAL -a $INT -le $MAX_VAL\) ]];

# Flow Control:
#	1) if tests the return value of a command enclosed between "if" and ";"
#		When the return value is 0, it proceeds
#		When the reuturn value is non-zero, it skips
#		then can be used as:
#			if $?; then
#			if test -test_option; then 
#				which is also equivalent to: if [ -test_option ]; then
#		

# if [ $1 = hi ]; then
#       echo 'say something'
# else
#       echo 'say something else'
# fi

# Use [ "$1" = hi ] to get around an empty parameter list

# if some_command; then
#       echo 'say something'
# elif other_command; then
#       echo 'say some other thing'
# else
#       echo 'say something else'
# fi


# 3) The exit status can range from 0 to 255 (thus is an 8 bit value).

# ========== Reading Keyboard Input ========== :
# 1) The builti-in READ command is used to read a single line of stdin. 
# 2) Syntax: read [-options] [var_to_store_input...]
# 3) If no variable name is supplied, the shell variable REPLY contains the data.
# 4.1) If READ receives fewer than expected number of characters, the extra variables are empty
# 4.2) If READ reaceives extra characters than expected, the extra ones will be contained in the last variable
# 4.3) If no variables are listed, the REPLY variable contain all the text!
# 6) You can NOT PIPE to READ command!!!
# 5) Read options:
#		NO OPTION puts the input into a variable:
	echo -n "Please provide some input: "
	read in_var
	echo "Here is your input: $in_var"
#		-a your_array	Assign the input to array, starting with index zero.
	echo -n "Using -a option> "
	read -a input_a
	echo "Using read -a :${input_a[@]}"
#		-d your_delim	The first character in the string delimiter is used to indicate end of input,
#						rather than a newline character
#		-e				Use readline to handle input
#		-n your_num		Read num characters of input rather than an entire line.
#		-p your_prompt	Display a prompt for input using the string prompt
	read -p "Using -p option>"
	echo "Using -p option: $REPLY"
#		-r				Raw mode. Do not interpret backlash characters as escape
#		-s 				Silent mode. Good for passwords. Does not print out your input as you type it!
	echo -s "Using -s option> "
	read -s var_in
	echo "Using read -s :$var_in"
#		-t your_ses		Terminate input after seconds
	echo -t "Using -t option> "
	read -t 2 || echo "too late"
	echo "Using read -t :$REPLY"
# 6) IFS (Internal Field Separator) can be modified to use other delimiter than space:
	file_info=$(grep "^root:" /etc/passwd)
	#IFS=":" read user pw uid gid name home shell <<< "$file_info"
	old_IFS=$IFS
	IFS=":" 
	read user pw uid gid name home shell <<< "$file_info" #since we can't pipe read, we have to use a HERE STRING
	IFS=$old_IFS
	echo $user
	echo $uid
	echo $gid
	echo $name
	echo $home
	echo $shell
# 7) Validating input
	read -p "Validating input: Enter a single item> "
	inval_input () {
		echo "Invalid Input '$REPLY' " >&2
	exit 1
	}
	#is input empty?
	[[ -z $REPLY ]] && inval_input
	#is input multiple items?
	(( $(echo $REPLY | wc -w) > 1 )) && inval_input
	#is input a valid filename?
	if [[ $REPLY =~ ^[-[:alnum:]\._]+$ ]]; then
		echo "'$REPLY' is valid filename"
		if [[ $REPLY =~ ^-?[[:digit:]]*\.[[:digit:]]+$ ]]; then
			echo "'$REPLY' is a floating point number"
		fi
		if [[ $REPLY =~ ^-?[[:digit:]]+$ ]]; then
			echo "'$REPLY' is an integer"
		fi
	else	
		echo "'$REPLY' is not an integer"
	
	fi
# 8) Menu-Driven program:
clear
echo "
Please Select:
1. Display Disk Space
0. Quite
"
read -p "Enter selection [0-2] > "
if [[ $REPLY =~ ^[0-3]$ ]]; then
	if [[ $REPLY == 0 ]]; then
		echo "Program terminated."
	fi	
	if [[ $REPLY == 1 ]]; then
		df -h
	else
		echo invalid entry
	fi
fi

# ========== Looping with WHILE/UNTIL: ========== :
# 1) The WHILE command uses next syntax: while commands; do commands; done
	count=0
	while [ $count -le 5 ]; do
		echo $count
		((count++))
	done	
# 2) Just like in C, you can use 'continue' or 'break' to jump to next itteration or to terminate the loop, respectively:
	count=0
	while [ $count -le 5 ]; do
		if ((count == 3)); then
			echo "count is 3; using continue to skip to the next itteration"
			((count++))
			continue
		fi
		if ((count == 4)); then
			echo "count is 4; breaking out of the loop"
			break
		fi
		echo Using while: $count
		((count++))
	done	
# 3) The UNTIL command exits the loop when a non-zero exit status is encountered (until condition is met):
	count=0
	until [ $count -gt 5 ]; do
		echo "using until: $count"
		((count++))
	done	
# 4) Reading Files with Loops:
	while read dist ver rels; do
		printf "Distro: %s\tVersion: %s\tReleased: %s\n" $dist $ver $rels
	done < distros.txt	
	cat distros.txt | while read dist ver rels; do
		printf "Distro: %s\tVersion: %s\tReleased: %s\n" $dist $ver $rels
	done

stdout_of_a_command=$(ls *)
arith_expension=$((5*7))
escape_seq=\t\tastring\n


function report_uptime () {
	cat <<- _EOF_
	<H2>System Uptime</H2>
	<PRE>$(uptime)</PRE>
	_EOF_
	return
}


function report_disk_space () {
	cat <<- _EOF_
	<H2>Disk Space Utilization</H2>
	<PRE>$(df -h)</PRE>
	_EOF_
	return
}


function report_home_space () {
	cat <<- _EOF_
	<H2>Home Space Utilization</H2>
	<PRE>$(df -TH /home/*)</PRE>
	_EOF_
	return
}


CURRENT_TIME=$(date +"%x %r %z")
TIME_STAMP="Generated $CURRENT_TIME, by $USER"

#declaring a constant (special case of variable):
declare -r TITLE="Sys Report"

#declaring a variable
BODY="System Information Report for $HOSTNAME"

cat <<-_EOF_ #Using 'here document'
<HTML>
	<HEAD>
		<TITLE>$TITLE</TITLE>
	</HEAD>
	<BODY>
		<H1>$BODY</H1>
		<P>$TIME_STAMP</P>
	</BODY>
</HTML>
_EOF_
report_uptime
report_disk_space
report_home_space

# ========== Exit Status: =============:
# 1) The exit status of "0" indicates success.
# 2) Any other value than "0" indicates a failure.
exit 0
