### How to add to mission:

Drag the AJ_CBRN_V2 folder into your mission folder and add the following line into class CfgFunctions in description.ext:

	#include "AJ_CBRN_V2\CfgFunctions.hpp"

Add the following line into CfgSounds in description.ext:

	#include "AJ_CBRN_V2\CfgSounds.hpp"

lastly, add the following line to initPlayerLocal.sqf:

	call AJDJ_fnc_chemicalInitClient;


### How to use:

to create and delete a chemical area in zeus, use the modules under the CBRN tab.

to create a chemical area in editor or through script, use the following line:

	[location, radius] call AJDJ_fnc_createArea;

location can be either an object, or an array of coordinates. Examples below:

	[myObject, 40] call AJDJ_fnc_createArea;
	
	[[6113.79,8642.26,0], 10] call AJDJ_fnc_createArea;

to delete an area through script, use the following line:

	[object] call ["AJDJ_fnc_deleteArea", 0, true];


[IMPORTANT] note that these must be executed globally to function correctly. When using the init field of an object, it will automatically run globally
If you are working in an sqf, you will have to use remoteExec


currently all the CBRN equiptment from the contact DLC is supported. It is possible to add your own gear to this, but it involves editing a number of 
arrays across a number of sqf's. In future I will make it easier to customize what gear provides protection.


Please reach out to me if you have any issues or suggestions at @ajdj100 on discord.
