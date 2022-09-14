/*
Gasmask equipping script by Ajdj100
Version 0.1.0

Script to allow players to equip gasmasks via ACE self interact if they are holding one in their inventory. 

PASTE THE FOLLOWING INTO initPlayerLocal.sqf TO INITIALIZE:

aceMask = ["EquipMask","Put on Gas Mask","",{execVM "scripts\aceGasmask.sqf"},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "ACE_Equipment"], aceMask] call ace_interact_menu_fnc_addActionToObject;
*/


//if not a player, exit
if (!hasInterface) exitwith {};

// init lists of masks
private _allowedGoggles = [
	"G_AirPurifyingRespirator_01_F",
	"G_AirPurifyingRespirator_02_black_F",
	"G_AirPurifyingRespirator_02_olive_F",
	"G_AirPurifyingRespirator_02_sand_F"
];

private _items = items player;

private _availableGoggles = (_items arrayIntersect _allowedGoggles);

//if the player has a gasmask in their inventory
if !(_availableGoggles isEqualTo []) then {

	//temporarily stores faceware
	private _tempGoggles = goggles player;	

	//Swaps mask with current facewear
	player addGoggles (_availableGoggles select 0);
	player removeItem (_availableGoggles select 0);
	player addItem _tempGoggles;

	hint "Added mask";		//debug message
} else {
	hint "No mask in inventory"
};