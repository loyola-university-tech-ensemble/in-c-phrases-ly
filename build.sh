IN_DIR='./src/'
OUT_DIR='./build/'

# Check for presence of Lilypond
if [ ! -x "$(command -v lilypond)" ]; then
  echo 'Lilypond is not installed. It can be found at http://lilypond.org/' >&2
  exit 1
fi

# Make output directory?
if [ ! -d $OUT_DIR ]; then
  mkdir -p $OUT_DIR
fi

function make_svg {
  lilypond --loglevel=BASIC_PROGRESS --output=$OUT_DIR -dpoint-and-click='#f' -dno-print-pages -dpreview -dbackend=svg $1
}

function prep_file {
  echo "<?xml-stylesheet type='text/css' href='/styles.css' ?>\n$(cat $1)" > $1
  mv $1 "`echo $1 | sed 's/preview\.//'`"
}

# Generate SVGs in output directory
# If no arguments to script, build all
if [[ $# -eq 0 ]] ; then
  for f in $IN_DIR/*/*.ly; do
    [ -f "$f" ] || break
    make_svg $f
  done

  cd $OUT_DIR
  for f in *.preview.svg; do
    [ -f "$f" ] || break
    prep_file $f
  done
else
  make_svg $1
  cd $OUT_DIR
  prep_file "$(echo $1 | grep -E -o '(\d+)').preview.svg"
fi
