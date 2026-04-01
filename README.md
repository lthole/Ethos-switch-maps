# Ethos widget for switch mapping
Here is my revised Switch Mapping widget for the 
- X20/S, X20R/RS, X20 Pro/AW
- XE, XE-S, XE RS, XE RS HD
- X18R, X18RS
- Twin XLite RII
- X14/X14S/X14RS but only full screen 640x360

My version does not require loading a bitmap background for the switches, because large bitmaps use a large amount of valuable ram. Instead I just draw them.

To make it easier to configure widgets for similar models, there is an upload mechanism.

### Widget options:
1. ‘Display all?’ - display all elements
2. ‘Display switch names?’ - display names as well as user text.
3. Select text and lines colour. Note that the controls colour is the same as the ‘Highlight colour’ defined in System/General.
4. In full screen mode you can add up to two notes, and display the model name.

Custom radio definition files may be created to add unsupported radios (see radios/custom/readme.txt)

My widget draws on earlier versions by ronron, Static and Benno. I have also benefited from strgaltdel’s help and Lua Tutorial in GitHub. Bertrand very kindly reviewed it and made some valuable suggestions. Thanks to @flyingeek for the improvements to the later versions, and thanks to @Helischorsch for the XE map.

<img width="800" height="480" alt="image" src="https://github.com/user-attachments/assets/478f4c01-1680-49da-a55c-699ce9a960d1" />

<img width="800" height="480" alt="image" src="https://github.com/user-attachments/assets/6bbef19c-9089-499d-9316-6186f9ad3934" />

### Installation:
Download and unzip the file. Copy the ’swmap’ folder and all its contents to the scripts folder on your radio’s SD card or eMMC.

Make sure you are in the correct model, then go into ‘Configure Screens’ and add a new screen, selecting the ‘Full screen’ or single layout option. Tap on the ‘Change widget’ button, and select the ’Switch maps’ widget.

Note: Since version 0.5 swmap now uses file i/o for storage in your eMMC or SD drive, due to insufficient storage in the widget read/write area. The template folder in v0.5 is no longer used.

Please note that this switch maps widget cannot co-reside with Benno's version.

### Upload option:
After creating the new widget, there is an option to load an example configuration. You can then add new entries or edit the pre-loaded ones.
Any Saved Model configurations can be used as a template, they are in swmap/models/
If no previous configurations are found in swmap/models/, a glider example map will be loaded.
Once the example is loaded, a Reset button appears. Pressing reset at this stage loads the example again.
If there are at least two configurations added to the swmap/models/ (current model + another), then a choice list to load another preset is shown, and there is still the reset button.

As a reminder, when using load, you can press return or touch outside the choice list to abort. And Reset has a confirmation dialog.

### Backups:
A configuration file is saved for every model in the "/scripts/swmap/models/“ folder under the model name. These can also be used as templates by loading them when a new widget is created in another model.


