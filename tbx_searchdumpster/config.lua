Config = {
	EnableWeapons = false, -- If you want the players to be able to find weapons (false by default).
	SearchTime = 10000, -- How much time it takes to search in millisecond.

	Dumpsters = { -- Props of the dumpsters wich is getting defined in the client.
		"prop_dumpster_01a",
		"prop_dumpster_02a",
		"prop_dumpster_02b"
	},

	Items = { -- Add whatever items you want here.
        "fishing_lure",
        "bandage",
        "weed_pooch",
        "bread",
        "lotteryticket",
		"spray",
		"panties",
		"WEAPON_PETROLCAN",
		"lockpick",
		"cola",
		"beer",
		"burger",
		"diamond",
		"garbage",

	},
	
	Weapons = { -- Add whatever weapons you want here (don't care about this if EnableWeapons = false).
        "WEAPON_SWITCHBLADE",
        "WEAPON_SNSPISTOL"
    }
}

Strings = { -- Translation
	["Search"] = "Zmackni [~g~E~s~] pro prohledani",
	["Searched"] = "Znova?",
	["Found"] = "nasel jste ",
	["Searching"] = "hledani...",
	["Nothing"] = "Nic si nenasel..."
}
