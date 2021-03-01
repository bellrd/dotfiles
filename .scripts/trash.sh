#! /bin/sh

DEST_DIR=/home/Trash/
[[ -w $DEST_DIR && -d $DEST_DIR ]] || echo $DEST_DIR not writable.
SAVE_IFS=$IFS
IFS=$(echo -en "\n\b")

for i in "$@"
do
    mv $i $DEST_DIR
done
IFS=$SAVE_IFS


