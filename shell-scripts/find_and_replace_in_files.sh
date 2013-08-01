# *****************************************************************************************
# find_and_replace_in_files.sh
# This script does a recursive, case sensitive directory search and replace of files
# To make a case insensitive search replace, use the -i switch in the grep call
# uses a startdirectory parameter so that you can run it outside of specified directory - else this script will modify itself!
# *****************************************************************************************


# **************** Script Variables ************
startdirectory="."
searchterm=$1

replaceterm=$2

if [[ -z "$1" ]]; then
    echo ""
    echo "No Search Term detected! "
    echo "Proper syntax is:"
    echo "find_and_replace_in_files \"SEARCHTERM\" \"REPLACETERM\""
	echo "Exiting..."
	echo ""
	exit 1 #exit shell script 

fi  

if [[ -z "$2" ]]; then
	echo ""
    echo "No Replace Term detected! "
    echo "Proper syntax is:"
    echo "find_and_replace_in_files \"SEARCHTERM\" \"REPLACETERM\""
    echo "Exiting..."
    echo ""
	exit 1 #exit shell script 
fi  

# **********************************************************

echo "******************************************"
echo "*      Search and Replace in Files       *"
echo "*            (Case Sensitive)            *"
echo "******************************************"

        for file in $(grep -l -R "$searchterm" $startdirectory)
          do
           sed -e "s/$searchterm/$replaceterm/g" $file > /tmp/tempfile.tmp
           mv /tmp/tempfile.tmp $file
           echo "Modified: " $file
        done

echo " *** All Done! *** "

