# mouse.R
## Intro.
This repository contains just one `R` script, with just one function: `mouse.R`

What does this do? This is just a simple script with a function that takes minutes as an input, and it will move your mouse and press numlock two times every 30 seconds.

It uses the packages: `tcltk`, `KeyboardSimulator` and `beepr`. It will only work on Windows due to the `KeyboardSimulator` package so, if you have a way to press keys and move the mouse in Linux/Mac from `R` feel free to contact me or just modify it accordingly.

Also, it presses numlock (a somewhat harmless key, not used very often), because some programs see only mouse movement as "away" so...

## Recommendation.

You can put it in your 'Documents' folder in Windows (or whatever working directory your `R` console starts on), open the standard R console (not RStudio, takes too long), and use `source("mouse.R")` since the standard directory for `R` is just your documents, you can just load the script quickly.
