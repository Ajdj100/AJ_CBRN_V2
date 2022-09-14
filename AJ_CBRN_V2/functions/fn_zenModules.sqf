["CBRN", "Create Chemical Area",
	{
		params ["_position", "_attachedObj"];

		["Chemical Area Option", 
		[[ "SLIDER:RADIUS", "Radius", [0, 500, 50, 0, _position, [1,0,0,1]]]],
			{
				params ["_dialog", "_args"];
				_args params ["_position"];
				_dialog params ["_radius"];

				[_position, _radius] remoteExec ["AJDJ_fnc_createArea", 0, true];
			},
			{},
			[_position, _attachedObj]
		] call zen_dialog_fnc_create;
	}
] call zen_custom_modules_fnc_register;


["CBRN", "Delete Chemical Area",
	{
		params ["_position", "_attachedObj"];

		[_attachedObj] remoteExec ["AJDJ_fnc_deleteArea", 0, true];
	}
] call zen_custom_modules_fnc_register;