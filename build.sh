#!/bin/bash
IN_DIR='./src/'
OUT_DIR='./svgs/'

if [ ! -x "$(command -v lilypond)" ]; then
  echo 'Lilypond is not installed. It can be found at http://lilypond.org/' >&2
  exit 1
fi

if [ ! -d $OUT_DIR ]; then
  mkdir -p $OUT_DIR
fi

npm install

make_svg() {
  lilypond --loglevel=BASIC_PROGRESS --output="$OUT_DIR" -dpoint-and-click='#f' -dno-print-pages -dpreview -dbackend=svg "$1"
}

prep_file() {
  echo -e "<?xml-stylesheet type='text/css' href='/styles.css' ?>\n$(cat "$1")" > "$1"
  npx svgo "$1"
  mv "$1" "${1//preview\./}"
}

# Generate SVGs in output directory
# If no arguments to script, build all
if [[ $# -eq 0 ]] ; then
  for f in "$IN_DIR"/*/*.ly; do
    make_svg "$f"
  done

  cd $OUT_DIR || exit 1
  for f in *.preview.svg; do
    prep_file "$f"
  done
else
  make_svg "$1"
  cd $OUT_DIR || exit 1
  prep_file "$(echo "$1" | grep -E -o '(\d+)').preview.svg"
fi
