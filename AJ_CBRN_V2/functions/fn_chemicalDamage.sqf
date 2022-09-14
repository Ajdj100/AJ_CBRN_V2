if (!hasInterface) exitWith {};
waitUntil {
	!isNull player
};

params ["_trg"];

// start the alarm audio script (includes checking for device)
private _alarmHandle = ([] spawn AJDJ_fnc_chemicalAlarm);

// main loop for doing hurty things when in chemical area
while { player inArea _trg } do {
	// check for player protection level
	private _protectionLevel = call AJDJ_fnc_getProtectionLevel;

	//if the player does not have full protection
	if !(_protectionLevel == 2) then {
		//if the player does not have mask protection
		if (_protectionLevel == 1) then {

			sleep 5.0;

			_limbSelection = selectRandom ["body", "head", "hand_r", "hand_l", "leg_r", "leg_l"];
			[player, 0.2, _limbSelection, "vehiclecrash"] call ace_medical_fnc_addDamageToUnit;
		} else {

			// deal the damage
			_limbSelection = selectRandom ["body", "head", "hand_r", "hand_l", "leg_r", "leg_l"];
			[player, 0.2, _limbSelection, "vehiclecrash"] call ace_medical_fnc_addDamageToUnit;

			// deal it again for extra speedy killing
			_limbSelection = selectRandom ["body", "head", "hand_r", "hand_l", "leg_r", "leg_l"];
			[player, 0.2, _limbSelection, "vehiclecrash"] call ace_medical_fnc_addDamageToUnit;
		};
	};
	sleep 5;
};

terminate _alarmHandle;