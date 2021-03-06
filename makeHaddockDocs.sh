# Use as ./makeHaddockDocs.sh reflex

PACKAGE=$1
URL="http://dfordivam.github.io/reflex-haddock/docs"

export DOC_PATH=$( echo $PACKAGE | xargs -d' ' -n1 --replace ghc-pkg field {} haddock-html | sed 's#.*: \(.*\)#\1#')

mkdir $1
cp -r $DOC_PATH $1/
TXT_FILE="$1/html/$1.txt"

chmod 644 $TXT_FILE
chmod 755 $1/html

# Add the url info to txt file
sed -i  "s|\@package |\@url $URL/$1/html/\n\@package |" $TXT_FILE
