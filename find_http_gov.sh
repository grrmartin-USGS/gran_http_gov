#!/bin/bash/

#run inside an unzipped GRAN src/contrib 
#David Watkins Nov 2016

#get lines containing http: and .gov, turn into github URLs to line numbers with check box for issues

for f in */;
do
	grep -nR 'http:' $f* | grep '.gov' | awk '{print $1}' | awk '{sub("/", "/blob/master/"); print $0}';
	printf "\n\n";
done | awk 'BEGIN{FS=":"}; {if(NF>0){ printf "- [ ] https://github.com/USGS-R/"$1"#L"$2"\n"} else{printf "\n"}}' |
	awk '{gsub("WQReview", "WQ-Review"); print $0}'
      #need to add hyphen to WQ-Review repo name 
	#add additional pipe to grep -v "blah" in command line to exclude anything (ie the gsIntro csv's) 
