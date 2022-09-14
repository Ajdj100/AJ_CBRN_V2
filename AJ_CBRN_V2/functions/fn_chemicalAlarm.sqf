//chemical detector audible warning of lethal levels of contamianation
//gets triggered when activating chemical trigger
//turns off when exiting the chemical trigger

while { true } do {

	if ("ChemicalDetector_01_watch_F" in (assignedItems player)) then {
	// play the sound
	playSound "chemical_alarm";
	};
	sleep 5;
};