/*
CBRN Script client side initialization Ajdj100
Version 0.1.0

Adds functionality to a few things for the client
Call this script from initPlayerLocal.sqf (example on line 10).

initPlayerLocal.sqf Example: 

	call AJDJ_fnc_chemicalInitClient;
*/


aceMask = ["EquipMask","Put on Gas Mask","",{call AJDJ_fnc_equipMask},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "ACE_Equipment"], aceMask] call ace_interact_menu_fnc_addActionToObject;

call AJDJ_fnc_chemicalDetector;