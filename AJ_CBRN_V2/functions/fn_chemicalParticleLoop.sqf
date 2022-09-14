/*
spawns the visible component of the chemical area

returns the particle source for use in deletion
*/

if (!hasInterface) exitWith {};

params ["_location", "_radius"];

_location set [2, 0];

private _pSource = ("#particlesource" createVehicleLocal _location);
_pSource setParticleParams
[
	["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12, 0, 8],
	"", "Billboard", 1, 10, // animationName, type, timerPeriod, lifeTime
	[0,0,-1000], // position relative to referenceObject
	[0, 0, 0], // velocity
	0, 0.005, 0.003925, 0.1, [5, 5], // rotation, weight, volume, rubbing, size
	[[0.6, 0.6, 0.2, 0], [0.6, 0.6, 0.2, 0.7], [0.6, 0.6, 0.2, 0]], // colors
	[1], // animationPhase
	0, 0, // randomDirectionPeriod, randomDirectionIntensity
	"", "", // onTimer, beforeDestroy
	_pSource, // referenceObject
	0, false, // angle, bounces
	-1, [], // bounceOnSurface, emissiveColor
	[0, 1, 0]// vectorDir - CANNOT be [0, 0, 0]
];

_pSource setDropInterval (0.5/_radius);
_pSource setParticleCircle [(_radius/2), [0,1,0]];
/*
	lifeTime, 
	position, 
	moveVelocity, 
	rotationVelocity, 
	size, 
	color, 
	directionPeriod, 
	directionIntensity, 
	angle, 
	bounceOnSurface
*/
_pSource setParticleRandom
[
	0,
	[(_radius/2), (_radius/2), 1],
	[0, 0, 0.5],
	4,
	1,
	[0, 0, 0, 0],
	0,
	0
];

//return the particle source
_pSource;