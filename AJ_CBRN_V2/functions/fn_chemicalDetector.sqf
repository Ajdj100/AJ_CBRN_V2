/*
	Chemical Detector script by Ajdj100
	Version 1.0.0
	
	Adds functionality to the chemical detector
	
	call this script from initPlayerLocal.sqf (example on line 16).
	
	
	Parameters:
	0: Array of objects - the sources of contamination. (Required)
	1: Number - the radius of contamination around the source object(s) in meters. (optional, defaults to 50m)
	
	
	initPlayerLocal.sqf Example: 
	chemDetector = [[Chemical1], 250] execVM "chemicalDetector.sqf"; (Creates a contamination zone 250m around the location of the Chemical1 object)
*/

// if not a real gamer, exit
if (!hasInterface) exitWith {};
waitUntil {
	!isNull player;
};

while { true } do {
	// get all chemical areas
	private _sources =+ (missionNamespace getVariable ["chemicalSources", []]);

	// if there are chemical sources present, and the player has a chemical detector
	if (!(_sources isEqualTo []) && ("ChemicalDetector_01_watch_F" in (assignedItems player))) then {
		// sort based on distance to chemical source, including radius of chemical
		private _sortedSources =+ [_sources, [], {
			(_x distance player) - (_x getVariable "radius")
		}] call BIS_fnc_sortBy;

		// selects nearest source of chemical
		private _source = (_sortedSources select 0);

		// global threat variable (for use in audio functions)
		private _threat = (10 - ((player distance _source) - (_source getVariable "radius")))/3 min 9.99 max 0 toFixed 2;

		// do some stuff for the display
		"ChemicalDetector" cutRsc ["RscWeaponChemicalDetector", "PLAIN", 1, false];

		private _ui = uiNamespace getVariable "RscWeaponChemicalDetector";
		if !(isNull _ui) then {
			private _obj = _ui displayCtrl 101;
			_obj ctrlAnimateModel ["Threat_Level_Source", parseNumber _threat, true];
		};

		// if the player is in a chemical zone
		if ((parseNumber _threat) > 3) then {
			// if the player is knocked out
			if ((player getVariable "ACE_isUnconscious")) then {
				//wait 20 seconds to detect uncon
				sleep 20;
				// loop until the player wakes up
				// if !(player getVariable "ACE_isUnconscious") exitWith {
				// 	systemChat "DEBUG unit woke up before alarm";
				// };
				waitUntil {
					sleep 1;
					[player] remoteExecCall ["AJDJ_fnc_unconAlarm", 0];					//THIS HAS A BUG, IT WONT TURN OFF AFTER ESCAPING THE GAS.
					!(player getVariable "ACE_isUnconscious");							//THIS NEEDS TO BE SPAWNED AS A SEPERATE
				};
			};
		};
	} else {	//default for if there are no chemical sources present

		"ChemicalDetector" cutRsc ["RscWeaponChemicalDetector", "PLAIN", 1, false];

		private _ui = uiNamespace getVariable "RscWeaponChemicalDetector";
		if !(isNull _ui) then {
			private _obj = _ui displayCtrl 101;
			_obj ctrlAnimateModel ["Threat_Level_Source", 0.00, true];
		};
	};

	sleep 0.5;
};