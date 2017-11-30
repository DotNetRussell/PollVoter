if [ $# != "3" ]
then
	echo "Poll Voter v1"
	echo "Author: @DotNetRussell"
	echo
	echo "Poll voter works great against polls that validate based on cookie or ip."
	echo "The only requirement is curl being installed."
	echo
	echo "NOTES:"
	echo "This produces a SHIT load of traffic. Don't use it for illegal purposes or face the music on your own."
	echo
	echo "Example:"
	echo "./Pollvoter.sh <proxy list path/file> <POST data string> <Target Url>"
	echo
	echo

else

	PROXYLIST=$1
	DATA=$2
	TARGET=$3

	for proxy in $(cat $PROXYLIST | sort -R | sed -e 's/^[[:space:]]*//');
	do
		curl -j --verbose --connect-timeout 5 --max-time 8 -x $proxy -d $DATA $TARGET&
	done
fi
