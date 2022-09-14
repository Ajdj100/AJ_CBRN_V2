/*
creates a new contamination area

Params:
0: Position array OR Object - The source of the contamination
1: Radius - the radius of contamination around the object

Location can be either a position array [x,y,z] or an object
[location, radius] call AJDJ_fnc_createArea;
*/

params ["_location", "_radius"];

//init temp for emitter object
private _emitterObject = _location;

if ("OBJECT" isEqualTo typeName _location) then {
	_location = getPos _location;
} else {
	_emitterObject = ("Land_GarbageBarrel_02_F" createVehicle _location);
};

//create trigger to control area
private _trg = createTrigger ["EmptyDetector", _location, false];
_trg setTriggerArea [_radius, _radius, 0, false, (_radius/2)];
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trg setTriggerStatements ["this", "[thisTrigger] spawn AJDJ_fnc_chemicalDamage", ""];

//start loop for particle effects
private _pSource = [_location, _radius, _emitterObject] call AJDJ_fnc_chemicalParticleLoop;


//bind variables
_trg setVariable ["pSource", _pSource];	//particle source
_trg setVariable ["radius", _radius]; //area of effect (for chemical detector use);

systemChat str _emitterObject;
//store trigger in barrel for deletion
_emitterObject setVariable ["trigger", _trg];


private _sources =+ (missionNamespace getVariable ["chemicalSources", []]);
_sources pushBack _trg;
missionNamespace setVariable ["chemicalSources", _sources];