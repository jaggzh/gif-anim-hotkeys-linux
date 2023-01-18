# gif-anim-hotkeys-linux

Make gif animations, snapping frames with hotkeys

## Scripts:

* gif-anim-settings: Sourced by the other scripts for common settings
* gif-anim-select-area: Initial script to run (map to a hotkey).
	* Ensures creation of folders,
	* wipes prior session frames,
	* Uses `slop` to get mouse-drawn area of screen,
	* Stores slop's coordinates in coords.txt file in cache dir (see -settings)
* gif-anim-cap-frame: Script to capture a frame and add it to the frames/ folder
* gif-anim-make-gif: Final script which uses ffmpeg to output the frames

## Installation:
1. Clone this repository
	1. cd ~/bin/ && git submodule add https://github.com/jaggzh/gif-anim-hotkeys-linux
1. Symlink all scripts to a folder in your path (this is required currently, at minimum, because we source the settings script, like `. gif-anim-settings`.  You can modify the scripts to point directly to it if you want though.
	1. srcdir=~/bin/gif-anim-hotkeys-linux
	1. cd "$srcdir" && for i in gif-\*; do (cd ~/bin && ln -s "$srcdir/$i" "$i"; done
1. Assign hotkeys
	1. Bind rectangle-selection command: gif-anim-select-area
	1. Bind add-a-frame command: gif-anim-cap-frame
	1. (Optional but convenient) Bind gif-anim-make-gif
1. (Optional, probably) Modify gif-anim-settings to change the hotkey comments (`ga_hotkey_comments=...`). These comments are displayed by the `gif-anim-select-area` script, and will be seen if you run that script on commandline, but aren't otherwise used.
1. (Optional) Modify gif-anim-settings to change the framerate (default is 2 fps)

## Testing

You can test the scripts, without hotkeys, by just running them:
```
$ gif-anim-select-area  # Spits out informative output
$ gif-anim-cap-frame
$ gif-anim-cap-frame
$ gif-anim-make-gif
$ your-favorite-image-viewer ~/.cache/gif-anim-capture-area/gifanim-output.gif
```

## Dependencies

* slop - to get the rectangle screen area with the user's mouse selection
* scrot - to grab the frames (of the chosen area)
* ffmpeg - to make the final gif

## Limitations and Known Issues

* I didn't test the installation steps above. :}
* FPS is hard-coded in the settings file (currently 2 fps at the time of this writing)
* The delay is the same between the end and loop to start
* The area cannot be changed during a session (you must start a new session with gif-anim-select-area)
