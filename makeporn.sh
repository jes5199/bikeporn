#!/bin/bash

# turns my realframes.txt file into something that mencoder can read
ruby framemultreal.rb realframes.txt > framelist.expanded

# this is production
time mencoder -ss `cat startsecond.txt` -audiofile audiodump.mp2 -quiet 'mf://@framelist.expanded' -mf w=720:h=480:fps=30 -ovc lavc -oac copy -o output.mpg -vf scale=720:480,harddup -srate 48000  -af lavcresample=48000 -lavcopts vcodec=mpeg2video:keyint=15:vrc_buf_size=327:vrc_minrate=1152:vbitrate=1152:vrc_maxrate=1152:acodec=mp2:abitrate=224 -of mpeg 

#Alternative invocations of mencoder are commented out:

# this is a test mode with no audio
# time mencoder -ss `cat startsecond.txt` -quiet 'mf://@framelist.expanded' -mf w=720:h=480:fps=30 -ovc lavc -o output.mpg -vf scale=720:480 -srate 48000 -lavcopts vcodec=mpeg2video -of mpeg 

# these were various other incantations that I used for different sorts of testing,
# I've forgotten what the differences were:
#time mencoder -quiet 'mf://@framelist.expanded' -mf w=352:h=240:fps=30 -ovc lavc -oac copy -o output.mpg -vf scale=352:240,eq2=1.0:1.0:-0.2:1.0,harddup -srate 44100  -af lavcresample=44100 -lavcopts vcodec=mpeg1video:keyint=15:vrc_buf_size=327:vrc_minrate=1152:vbitrate=1152:vrc_maxrate=1152:acodec=mp2:abitrate=224 -of mpeg 

#time mencoder -quiet 'mf://@framelist.shorter' -mf w=352:h=240:fps=$FPS -ovc raw -oac copy -o output.avi -vf scale=352:240 
#,eq2=1.0:1.0:-0.2:1.0 -srate 44100  

#time mencoder -quiet 'mf://@framelist.shorter' -mf w=88:h=60:fps=$FPS -ovc lavc -oac copy -o output.draft.mpg -vf scale=88:60,eq2=1.0:1.0:-0.2:1.0,harddup -srate 44100  -af lavcresample=44100 -lavcopts vcodec=mpeg1video:keyint=15:vrc_buf_size=327:vrc_minrate=1152:vbitrate=1152:vrc_maxrate=1152:acodec=mp2:abitrate=224 -of mpeg 



# just reports how long the video turned out to be
mpgtx -i output.mpg | grep Duration

# plays the video
mplayer -vo x11 -speed 1 -quiet output.mpg > /dev/null 2> /dev/null &
