# (H)axe

(H)axe is an Axe interpreter written in Haxe. Confusing yet ?

## Usage

It doesn't work yet. Sorry.

### Axe

Axe is historically an unofficial language for the TI-83+ and TI-84+ series of programmable calculators by Texas Instruments. It was originally made by a member of the TI programming community named Qigibo on the now (mostly) inactive website Omnimaga, and was later maintained by another community member named Runer112. It is much, much faster than TI-Basic, the base language of the calculators, thanks to it being compiled to z80 assembly (right on your calculator !) and dealing mostly with integers, as opposed to TI-Basic being interpreted and dealing only with 8-bytes floating-point numbers - this is a great deal on a fragile 6 MHz z80 CPU !

For me, Axe is great for several reasons.
- It is a very weird language that was created for programming calculators, not for computers. One visible part of this lays in the sheer number of different characters that make up the command list. Some aren't even accessible on a computer !
- Because it was created for programming calculators, it comes in a bundled environment. As such, it is a very pleasant way to quickly wrap up a small game ; you don't have to worry about opening windows and handling system events, as there are primitive functions to interact with the screen, the keyboard, the TI-OS etc.
- Its logic is very close to machine code, which for me when combined with the natural notation of imperative languages always rhymes with weird obscure code that does a super complicated task super fast. And I love that sh*t ! For example, if you have a number in a variable called `a` and you want to calculate `a` to the power of 4, you could simply do `a*a*a*a`, but how about `a*()*()` ? See what I mean ?
- It kept me busy during the whole of highschool.

If you still think that's stupid and why would anyone bother with a calculator language, check out these games that have been written in Axe, while keeping in mind that they are running on a calculator with a 6 MHz CPU !

- A Worms prototype by me : http://img.ourl.ca/gameplayForDemo1.gif
- Portal Prelude, a 2D Portal game by Builderboy2005 : https://www.youtube.com/watch?v=SQvWa_q8OrI
- A Fruit Ninja clone where you swipe on the calculator keys, by DeepThought : https://www.youtube.com/watch?v=WhDquSJ2Rr8
- An Ikaruga clone, also by me (shameless plug much) : https://www.youtube.com/watch?v=YfYKPXtOrvE
- A Super Crate Box ... port ? clone ? again by me (I did say I spent all of highschool on Axe) : https://www.youtube.com/watch?v=gn7nKFtXD5c&t=73s

### Why (H)axe ?

The main goal of this project is to bring to the PC one of my favorite programming languages of all time, because of its weirdness, because of how proficient I was with it, and because of how easy it is to pick it up and wrap up an entire, playable game in a couple hours thanks to its completeness (at least on a calculator).

### (H)axe is for computers, not calculators

(H)axe does not aim to limit itself at what Axe could already do on calculators though. I plan to make it a viable computer programming language, at least as viable as other languages that aim at providing a complete environment for fun programming (think CHIP-8 and the like).
