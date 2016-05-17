#!/bin/bash

dir="../xmon/html"
if [ ! -d $dir ] ; then
    echo "ERROR - Please link ../xmon, exiting."
    exit
fi
if [ $# -gt 0 ]; then
    if [ $1=="-t" ]; then
        # Test run
        xmon.py --header_html
        xmon.py --includes_html
        xmon.py --about_html
        xmon.py --footer_html
        xmon.py --tutorial_html
        xmon.py --body_html
        xmon.py --runranges_html
        xmon.py --triggers_html
        exit
    else
        # Set output directory
        dir="$1"
    fi
fi

echo  "xmon.py --header_html     2> /dev/null 1> $dir/header.html"
python xmon.py --header_html     2> /dev/null 1> $dir/header.html
echo  "xmon.py --includes_html   2> /dev/null 1> $dir/about.html"
python xmon.py --includes_html   2> /dev/null 1> $dir/about.html
echo  "xmon.py --about_html      2> /dev/null 1> $dir/about.html"
python xmon.py --about_html      2> /dev/null 1> $dir/about.html
echo  "xmon.py --footer_html     2> /dev/null 1> $dir/footer.html"
python xmon.py --footer_html     2> /dev/null 1> $dir/footer.html
echo  "xmon.py --tutorial_html   2> /dev/null 1> $dir/tutorial.html"
python xmon.py --tutorial_html   2> /dev/null 1> $dir/tutorial.html
echo  "xmon.py --body_html --ssi 2> /dev/null 1> $dir/body.html"
python xmon.py --body_html --ssi 2> /dev/null 1> $dir/body.html
echo  "xmon.py --runranges_html  2> /dev/null 1> $dir/runranges.html"
python xmon.py --runranges_html  2> /dev/null 1> $dir/runranges.html
echo  "xmon.py --triggers_html   2> /dev/null 1> $dir/triggers.html"
python xmon.py --triggers_html   2> /dev/null 1> $dir/triggers.html
echo  "xmon.py --ssi 2> /dev/null 1> $dir/166466.html"
python xmon.py --ssi 2> /dev/null 1> $dir/166466.html





