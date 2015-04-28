set -e
docker build -t rdhyee/asciidoc-epub-via-htmlbook .
DOCUMENT_DIR=${1:-`pwd`}
TITLE=${2:-2814}
docker run -it  -v $DOCUMENT_DIR:/documents/  rdhyee/asciidoc-epub-via-htmlbook a2epub.sh $TITLE
