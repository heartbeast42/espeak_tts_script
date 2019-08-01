#!/bin/bash
SPEED=350 # Default speed is 175
VOLUME=100 # Default Volume is 100

if pgrep espeak >/dev/null 2>&1; then # is espeak running? # does this cover edge cases?
    killall -s KILL espeak # stops espeak
else
    #xsel | espeak --stdin -a $VOLUME -s $SPEED # this is the old line, for some reason the last letter is omitted this way
    espeak -a $VOLUME -s $SPEED "... $(xsel) ..." # this method prevents the last letter from being omitted from espeak, that's what the ... is for
fi

# if pidof espeak > 0; then killall -s KILL espeak; else espeak -a 100 -s 350 "... $(xsel) ...";fi