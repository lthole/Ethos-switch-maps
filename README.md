# Ethos widget for switch mapping
Here is my new Switch Mapping widget for the X20/S, X20R/RS, X20 Pro/AW and X18RS (radios with an 800x400 lcd). My version does not require loading a bitmap background for the switches, because large bitmaps use a large amount of valuable ram. Instead I just draw them. (I am working on the X18 versions.)

To make it easier to configure widgets for similar models, there is an upload mechanism.

### Widget options:
1. ‘Display all?’ - display all elements
2. ‘Display switch names?’ - display names as well as user text.
3. Select text and lines colour.
4. Select controls colour.

My widget draws on earlier versions by ronron, Static and Benno. I have also benefited from strgaltdel’s help and Lua Tutorial in GitHub. Bertrand very kindly reviewed it and made some valuable suggestions. 

### Installation:
Download and unzip the file. Copy the ’swmap’ folder and all its contents to the scripts folder on your radio’s SD card or eMMC.

Make sure you are in the correct model, then go into ‘Configure Screens’ and add a new screen, selecting the ‘Full screen’ option. Tap on the ‘Create widget’ button, and select the ’Switch maps’ widget. If you have not used the pre-load option, the ‘Configure widget’ form will open as a blank canvas for you to fill in.

### Upload option:
To make it easier to configure widgets for similar models, for example aerobats or gliders, the widget will upload the designations from a template file if it exists in the "/scripts/swmap/templates/“ folder when the widget is first created for a model. Use the supplied 'template master.’luv as the base, and save it as 'template.lua. Alternately I have included a few example upload files. To try one out make a copy and name it template.lua.

After creating the new widget, the contents of the template.txt file should already be pre-loaded. You can then add new entries or edit the pre-loaded ones.

### Backups:
A configuration file is saved for every model in the "/scripts/swmap/models/“ folder under the model name. These can also be used as templates by copying them as ’template.lua’ into the templates folder.

Note that cloned models will use the same widget until you change the model name in Model / Edit model.

