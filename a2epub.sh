#!/usr/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Need title'
    exit 0
fi

TITLE=${1}

cd /documents
rm $TITLE.epub

asciidoctor -a toc -b xhtml5 -d book -T /htmlbook/asciidoctor-htmlbook/htmlbook-autogen/ \
   --trace \
   $TITLE.asciidoc

xsltproc -stringparam external.assets.list " " \
         /htmlbook/HTMLBook/htmlbook-xsl/epub.xsl $TITLE.html 

# copy desired epub.css
# assumes that /documents/epub.css exists
cp epub.css OEBPS

# copy desired cover -- hardwired right now to png
# assumes that /documents/cover.png exists
cp cover.png OEBPS

# remove extraneous index.html (maybe not needed )
#rm OEBPS/index.html 

zip -rX $TITLE.epub mimetype OEBPS/ META-INF/

