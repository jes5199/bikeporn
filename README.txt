This is the quick-and-dirty way to make stop motion movies.
It's probably more "dirty" than quick, as the encoding process can be very slow
and there's no GUI or anything.
I don't know if this is really the most appropriate toolchain, but it works.
I wrote this in the course of a weekend in 2007, and the resulting film was
shown at Pornography of the Bicycle 1 in Portland and elsewhere.
The film is not currently distributed anywhere.
Ask revphil if you want to see it.

Instructions:
Edit realframes.txt to describe your movie.
Put your audio in audiodump.mp2
Run "makeporn.sh" in this directory.

Requires:
mencoder, from the MPlayer project. 
ruby, probably anything in the 1.8.x series.

Optionally:
mpgtx, to print out how long your resulting movie is (in seconds)
mplayer, to play the movie when the script finishes.
