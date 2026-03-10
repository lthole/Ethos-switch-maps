Do not delete this directory

You can place in this folder custom radio definitions.
The naming must follow those rules:

[board]-[width]x[height].lua

Exemples:

X20RS-800x480.lua
X20PROAW-784x316.lua

You can find your board name in System/Info/Firmware. The width and the height
are the width and the height of the widget. We provide definitions for Full Screen
and sometimes for single widget layout.

Once you have your board name, duplicate one of the radio definition file provided,
rename it, place it in this directory. Now you can edit it.

Please once again, pay attention to the naming. Provided definition files do not use
the board name but an internal RadioId. Do use your board name.

For the time being, it is mandatory to have a custom radio definition in full screen,
but you can provide other resolutions as well.
