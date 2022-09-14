params["_target"];

if (_target isEqualTo objNull) exitWith {};

private _trg = (_target getVariable "trigger");

private _sources =+ (missionNamespace getVariable ["chemicalSources", []]);
_sources deleteAt (_sources find _trg);
missionNamespace setVariable ["chemicalSources", _sources];

// delete the particle emitter
deleteVehicle (_trg getVariable "pSource");

// set the trigger area to 0 (removes the area of effect)
// _trg setTriggerArea [0, 0, 0, false, 0];

deleteVehicle _trg;
deleteVehicle _target;