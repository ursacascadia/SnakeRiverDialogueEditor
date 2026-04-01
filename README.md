# Snake River Dialogue Editor
Snake River Dialogue Editor is a nodegraph tool for creating branching dialogue for games.

![Screenshot of editor UI](/screenshots/ui.png)

## Features

Nodes are composed of sets of fields. These fields can be any data type which is implemented (currently including strings, ints, floats, arrays.)

Node's field composition can be saved as a 'template' to be reused.

![Screenshot of editor UI](/screenshots/templates1.png)
![Screenshot of editor UI](/screenshots/templates_about.png)

Dialogue files are saved as readable JSON. They can, naturally, be used in any engine. For an example written in Godot, see [this repository.](https://github.com/genderfreak/snake-river-dialogue-parser-example)

Integrating Lua scripting is possible by having a 'Lua' field in your node. (For my game, I've implemented character speech tags, Lua scripting, dice rolls, oneshot choices/text, and gotos.) Since you write the parser, your imagination and implementation is the limit.

![Screenshot of editor UI](/screenshots/ui_zoomout.png)

## Disclaimer

This app should be used with caution and careful version control. Many quality of life features such as autosaving, save precautions, and certain features are still buggy or missing. You should save often. Report bugs to the issue tracker so I can improve the tool. This app is in alpha, and should be treated as such.
