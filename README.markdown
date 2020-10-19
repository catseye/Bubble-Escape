Bubble Escape
=============

_Try it online_ [@ catseye.tc](https://catseye.tc/installation/Bubble%20Escape%202K)
| _See also:_ [Dungeons of Ekileugor](https://github.com/catseye/Dungeons-of-Ekileugor#readme)
∘ [SixtyPical](https://github.com/catseye/SixtyPical#readme)
∘ [yucca](https://github.com/catseye/yucca#readme)

- - - -

(c)2009-2016 Cat's Eye Technologies.  All rights reserved.  
Covered under a BSD-style license; see the file LICENSE for the full text.

![Screenshot of Bubble Escape 2K](images/bubble%20escape%202k.png?raw=true)

What is it?
-----------

Bubble Escape is a video game for the Commodore 64 computer.

Premise
-------

You, a sentient soap bubble, have been arrested for your political beliefs
by the ruling class of your society, an ancient race of dragons.  You find
yourself imprisoned in a maze-like dungeon from which you must escape.
There is but a single exit, and it will require five different keys to open.
You will find these keys randomly deposited throughout the dungeon, but each
room presents its own hazards: moving walls, fireballs, hovering sentry
robots, and dragon officials.  Being a soap bubble, you must be very careful
to avoid touching any of these hazards, and the dungeon walls as well,
otherwise you will pop.  Fortunately, bubbles, like cats, have nine lives.

Controls
--------

To start the game, mount the "bubble escape 2k.d64" disk image and type

    load"*",8
    run

Plug your joystick into port 2.  Pushing in any direction will accelerate
the bubble in that direction.  The fire button is not used except to start
a new game after you've lost all 9 lives.

If you are playing this game in the VICE emulator, make sure you have sound
playback enabled, as the random number generator relies on it.

This is all you need to know to begin playing the game, but some extra
hints/spoilers are given at the bottom of this readme.

History
-------

If you're not interested in how this game came to be, you can skip these
two sections.

The Original - 198?
-------------------

I wrote the original version of this game in the 1980's, when I was a
teenager.  It was written in BASIC, and was thus very slow.  I tried to
make it seem faster by calling the movement subroutine twice in quick
succession inside the main game loop, but that only made it choppier.

This was one of my earliest games, and one of the few that actually got
finished -- although it fell a bit short of the original vision, which
included having the dragon elders shoot fireballs at you, and something
more exciting happening in the rooms with three fireballs in them.

The idea was doubtless influenced by StarQuake -- a large, multi-screen,
non-scrolling maze (with a couple of teleporters) in which you must locate
and collect a number of crucial items and deposit them in a certain place.

The sprites were designed by hand on graph paper, manually translated into
decimal numbers and transcribed into DATA statements.  There were some
errors in this process, and the bubble and the dragon didn't look quite
right.

The BASIC source code of the original is included for historical and
comparative purposes, or if you prefer, for larfs.

The Remake - 2009
-----------------

The remake was written entirely in 6502 assembly language, using the P65
portable 6502 assembler.  (The P65 assembler has since been superceded by
the Ophis assembler, which is now used in the build process -- in fact,
Ophis version 2.0 is assumed.)  The memories of my disappointment at the
poor performance of the original game had hung heavily on my mind (well,
maybe not *that* heavily,) hence I endeavoured to make the remake as fast
and as smooth as I could.

This was largely accomplished by the use of a raster interrupt which is
triggered at the very bottom of the screen.  This interrupt runs a routine
which updates the positions of all the sprites.  It then calculates what the
next positions should be, based on velocity and acceleration of the sprites,
the direction the joystick is being pressed, the "AI" of the bad guys, etc.

The remake is more or less faithful to the original.  The maze is the same
and the hazards are essentially the same.  The degree to which the game is
still unfinished is the same; the dragon elders still do not shoot
fireballs, and the three-fireball rooms are still just three fireballs.

But some changes are significant:

* Full screen.  The original used only the leftmost 256 pixel positions to
  avoid messy multi-byte POKEs.  The remake uses the entire screen.  For this
  reason, the display is slightly different as well: lives are shown in the
  upper left corner, keys are shown in the upper right.  The walls are also
  thinner.
* Sentry robots move with acceleration.  In the remake, I initially tried to
  duplicate the constant-velocity motion in the original, but I found it more
  straightforward to apply the same physics to the sentries as to the bubble,
  and once I got this to work, I liked it and kept it.
* The sprites were fixed up a bit.  They look less wrong now.
* The title screen, game over screen, and game won screens are not nearly
  as nice to look at.

The assembly code for this version was pretty painful because it was largely
a direct translation of the BASIC to assembly language.  I can think of many
ways for it to be much cleaner (more jump tables come to mind.)

The Mini Game Compo Entry
-------------------------

Since my remake was a mere ~3K in size, and since I had not too long after-
wards discovered the Mini Game Compo (via The New Dimension's website), I
thought it would be fun to enter Bubble Escape into it.

Then I had to decide -- should I enter it as a 4K game (I'd probably have
to add more features,) or should I try to squeeze it down into 2K?  Well,
given the nature of the contest and my history of space optimization (see
Shelta!), the choice was easy.

I optimized away a lot of the bulky logic and debugging-assistance code, and
got it down to around ~2300 bytes.  After that I started chipping away at
the game itself, getting rid of the title/game over screens, sound effects,
and one sprite image, bringing it down to ~2175 bytes.

I then looked for a cruncher that would take me the rest of the way.  After
a few false starts, I eventually found "Cruncher AB+" which exceeded my
expectations.  In fact, I was able to restore the sound effects and sprite,
and add one more feature to make the game harder (the more keys you have,
the shorter the delay before a sentry starts moving after you enter its
room.)

The end result was 2043 bytes, so I christened it "Bubble Escape 2K" and
here you have it.

The Mini Game Compo Winner
--------------------------

Much to my surprise, submitting Bubble Escape 2K to the 2009 Mini Game
Competition was a good move -- it won first place in the 2K category!

Unfortunately, the website hosting the rules and entries went down soon
afterwards, and I did not think fast enough about saving a copy of the
results page for posterity, so I have no hard evidence of this.  I'm sure
if you could find and ask the judges, they'd back up my story, though :)

The 8K Cartridge Version -- 2011 & 2012
---------------------------------------

After writing the remake, I had a great, and I think perfectly reasonable,
desire to play it on a real, physical Commodore 64.  Through a series of
moves, I lost my original C64 in 2009; acquiring another one was not too
difficult, but the burning question was, what was the best way to get that
2K of code onto the new machine?

There are several ways, ranging in ease and expense, to transfer files from
modern PC's to C64's and back.  I decided that the most interesting, though,
was to get an EPROM burner, a bit of Flash memory in a DIP, and an old
Commodore 64 cartridge that no one really wanted; and to modify the game to
run from a cartridge ROM, burn that ROM image onto the Flash chip, take apart
the cartridge, remove the existing ROM, wire the Flash chip up to the right
address and data lines on the cartridge's PCB, stick it into the cartridge
port and turn on the C64.

Well, some of those things transpired, and some didn't -- I did sacrifice a
"Frog Master" cartridge for the project, but I never did get to the point of
removing the ROM from its PCB.  (There's an outside chance I will someday,
but I wouldn't bank on it.  Ha!  Ha!  "Bank", get it?)

I did, however, modify the game to build as an 8K ROM image in 2011, and,
after fixing some bugs in 2012, it does boot as a fully playable ROM image
in VICE.

Being an 8K ROM image based on a ~2K game, there is a lot of room there
that is currently just zero bytes, but which could be used for all kinds of
enhancements: maybe a title screen with music, maybe better game over and
game won sequences, maybe random maze generation, maybe nastier nasties.
Maybe someday.

License
-------

All three versions of Bubble Escape are now covered under a BSD-style
license, which means you can deal quite freely with the source code and
compiled binaries as long as you keep the license text intact.  See the
file LICENSE for complete information.

The full title of the game is "Cat's Eye Technologies' Bubble Escape", to
distinguish it from the handful of other games of the same name (many of
which are online Flash-based dealies) which have appeared since the
original was written.

Hints
-----

* The maze is 20 rooms wide by 10 rooms tall, 200 rooms in total.
* The maze is static and hardcoded, not randomly generated.
* You start in the top left corner.
* The exit is in the bottom right corner.
* There are teleporters in the bottom left and top right corners; each one
  will teleport you to the other corner.

Have fun!

Chris Pressey  
July 7, 2009  
Bellevue, WA
