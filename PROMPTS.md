## Stage Editor

REQUEST: Add a "stage editor" page.
DESCRIPTION:
The stage editor allows dev to add, remove and drag platforms. When done editing, dev can press "export" and the corresponding script that creates current platform (e.g. createPlatforms1() in Game.pde). 
NOTES:
Put entry as a button on main page.
Write this in dedicated files.
Keep the way this repository deal with scene-switching and user input in mind.


## Stage Selector
REQUEST: Add a "stage selector" page.
DESCRIPTION:
The stage selector is a loop selection page. 

Left is a preview window, directly rendering from platforms (you may need to use translate() etc. to render them correctly; don't forget to pushMatrix() and popMatrix()). 

Right is a row-list of selection, which we select either by UP/DOWN or click. All selection objects align to rightmost. Selected one extrudes towards left a little bit.

Confirm by pressing "C".

NOTES:
Put this after character selection.
Write this in dedicated files.
Keep the way this repository deal with scene-switching and user input in mind.