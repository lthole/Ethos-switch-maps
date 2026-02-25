# Ethos widget for switch mapping
Here is my revised Switch Mapping widget for the X20/S, X20R/RS, X20 Pro/AW and X18RS (radios with an 800x400 lcd). My version does not require loading a bitmap background for the switches, because large bitmaps use a large amount of valuable ram. Instead I just draw them.

To make it easier to configure widgets for similar models, there is an upload mechanism.

### Widget options:
1. ‘Display all?’ - display all elements
2. ‘Display switch names?’ - display names as well as user text.
3. Select text and lines colour.
4. Select controls colour.

My widget draws on earlier versions by ronron, Static and Benno. I have also benefited from strgaltdel’s help and Lua Tutorial in GitHub. Bertrand very kindly reviewed it and made some valuable suggestions. Thanks to @flyingeek for the improvements to this latest versionb.

### Installation:
Download and unzip the file. Copy the ’swmap’ folder and all its contents to the scripts folder on your radio’s SD card or eMMC.

Make sure you are in the correct model, then go into ‘Configure Screens’ and add a new screen, selecting the ‘Full screen’ or single layout option. Tap on the ‘Change widget’ button, and select the ’Switch maps’ widget.

Note: Since version 0.5 swmap now uses file i/o for storage in your eMMC or SD drive, due to insufficient storage in the widget read/write area. This also make it easier to make your own master template files. Simply copy your model.lua file in the models folder, and save it as template.lua in the templates folder. IT will then be used when you create a switch map widget.

The template folder in v0.5 is no longer used.

### Upload option:
After creating the new widget, the contents of the template.txt file should already be pre-loaded. You can then add new entries or edit the pre-loaded ones.
Any Saved Model configurations can be used as a template, they are in swmap/models/
If no previous configurations are found in swmap/models/, the configure page shows an "Add Example" button which load a glider example.
Once the example is loaded, a Reset button replaces the "Add Example" button. Pressing reset at this stage presents the "Add Example" again.
If there are at least two configurations added to the swmap/models/ (current model + another), then a choice list to load another preset is shown, and there is still the reset button.

As a reminder, when using load, you can press return or touch outside the choice list to abort. And Reset has a confirmation dialog.

### Backups:
A configuration file is saved for every model in the "/scripts/swmap/models/“ folder under the model name. These can also be used as templates by loading them when a new widget is created in another model.


