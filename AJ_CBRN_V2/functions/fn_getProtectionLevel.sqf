/*
returns protection level of local player
*/

// init lists of protective equiptment
private _allowedGoggles = [
	"G_AirPurifyingRespirator_01_F",
	"G_AirPurifyingRespirator_02_black_F",
	"G_AirPurifyingRespirator_02_olive_F",
	"G_AirPurifyingRespirator_02_sand_F",
	"G_RegulatorMask_F"
];
private _allowedUniforms = [
	"U_B_CBRN_Suit_01_MTP_F",
	"U_B_CBRN_Suit_01_Tropic_F",
	"U_B_CBRN_Suit_01_Blue_F",
	"U_B_CBRN_Suit_01_White_F",
	"U_B_CBRN_Suit_01_Wdl_F",
	"U_I_CBRN_Suit_01_AAF_F",
	"U_I_E_CBRN_Suit_01_EAF_F"
];
private _allowedVehicles = [
	"rhsusf_m1a2sep1wd_usarmy",
	"rhsusf_m1a2sep1tuskiwd_usarmy",
	"rhsusf_m1a2sep1tuskiiwd_usarmy",
	"rhsusf_m1a2sep2wd_usarmy",
	"RHS_M2A3_BUSKIII_wd",
	"B_APC_Wheeled_01_cannon_F"
];

//init protection level variable
private _protectionLevel = 0;

// if they are wearing a mask
if (goggles player in _allowedGoggles) then {
	// if they are wearing the suit
	if (uniform player in _allowedUniforms) then {
		_protectionLevel = 2;
	} else {
		_protectionLevel = 1;
	};
};


// if the player is in a protected vehicle
if (typeOf objectParent player in _allowedVehicles) then {
	_protectionLevel = 2
};

//return
_protectionLevel;