// Rewrite of the old C program 'Sex' in V
//Jocadbz 2023 - Public Domain

module main

import rand { element }

fn main() {
	
	faster := [
	  "Let the games begin!",             "Sweet Jesus!",
	  "Not that!",                        "At last!",
	  "Land o' Goshen!",                  "Is that all?",
	  "Cheese it, the cops!",             "I never dreamed it could be",
	  "If I do, you won't respect me!",   "Now!",
	  "Open sesame!",                     "EMR!",
	  "Again!",                           "Faster!",
	  "Harder!",                          "Help!",
	  "Fuck me harder!",                  "Is it in yet?",
	  "You aren't my father!",            "Doctor, that's not *my* shou",
	  "No, no, do the goldfish!",         "Holy Batmobile, Batman!",
	  "He's dead, he's dead!",            "Take me, Robert!",
	  "I'm a Republican!",                "Put four fingers in!",
	  "What a lover!",                    "Talk dirty, you pig!",
	  "The ceiling needs painting,",      "Suck harder!",
	  "The animals will hear!",           "Not in public!",
	]
  
	said := [
        "bellowed",             "yelped",               "croaked",
        "growled",              "panted",               "moaned",
        "grunted",              "laughed",              "warbled",
        "sighed",               "ejaculated",           "choked",
        "stammered",            "wheezed",              "squealed",
        "whimpered",            "salivated",            "tongued",
        "cried",                "screamed",             "yelled",
        "said",
	]

	fadj := [
        "saucy",                "wanton",               "unfortunate",
        "lust-crazed",          "forty-nine year old",        "bull-dyke",
        "bisexual",             "gorgeous",             "sweet",
        "nymphomaniacal",       "large-hipped",         "freckled",
        "forty-five year old",  "white-haired",         "large-boned",
        "saintly",              "blind",                "bearded",
        "blue-eyed",            "large tongued",        "friendly",
        "piano playing",        "ear licking",          "doe eyed",
        "sock sniffing",        "lesbian",              "hairy",
	]

	female := [
	   "baggage",              "hussy",                "woman",
	   "Duchess",              "female impersonator",  "nymphomaniac",
	   "virgin",               "leather freak",        "home-coming queen",
	   "defrocked nun",        "bisexual budgie",      "cheerleader",
	   "office secretary",     "sexual deviate",       "DARPA contract monitor",
	   "little matchgirl",     "ceremonial penguin",   "femme fatale",
	   "bosses' daughter",     "construction worker",  "sausage abuser",
	   "secretary",            "Congressman's page",   "grandmother",
	   "penguin",              "German shepherd",      "stewardess",
	   "waitress",             "prostitute",           "computer science group",
	   "housewife",
	]

	madjec := [
	   "thrashing",            "slurping",             "insatiable",
	   "rabid",                "satanic",              "corpulent",
	   "nose-grooming",        "tripe-fondling",       "dribbling",
	   "spread-eagled",        "orally fixated",       "vile",
	   "awesomely endowed",    "handsome",             "mush-brained",
	   "tremendously hung",    "three-legged",         "pile-driving",
	   "cross-dressing",       "gerbil buggering",     "bung-hole stuffing",
	   "sphincter licking",    "hair-pie chewing",     "muff-diving",
	   "clam shucking",        "egg-sucking",          "bicycle seat sniffing",
	]

	male := [
	   "rakehell",             "hunchback",            "lecherous lickspittle",
	   "archduke",             "midget",               "hired hand",
	   "great Dane",           "stallion",             "donkey",
	   "electric eel",         "paraplegic pothead",   "dirty old man",
	   "faggot butler",        "friar",                "black-power advocate",
	   "follicle fetishist",   "handsome priest",      "chicken flicker",
	   "homosexual flamingo",  "ex-celibate",          "drug sucker",
	   "ex-woman",             "construction worker",  "hair dresser",
	   "dentist",              "judge",                "social worker",
	]

	diddled := [
	   "diddled",              "devoured",             "fondled",
	   "mouthed",              "tongued",              "lashed",
	   "tweaked",              "violated",             "defiled",
	   "irrigated",            "penetrated",           "ravished",
	   "hammered",             "bit",                  "tongue slashed",
	   "sucked",               "fucked",               "rubbed",
	   "grudge fucked",        "masturbated with",     "slurped",
	]

	titadj := [
        "alabaster",            "pink-tipped",          "creamy",
        "rosebud",              "moist",                "throbbing",
        "juicy",                "heaving",              "straining",
        "mammoth",              "succulent",            "quivering",
        "rosey",                "globular",             "varicose",
        "jiggling",             "bloody",               "tilted",
        "dribbling",            "oozing",               "firm",
        "pendulous",            "muscular",             "bovine",
	]

	knockers := [
        "globes",               "melons",               "mounds",
        "buds",                 "paps",                 "chubbies",
        "protuberances",        "treasures",            "buns",
        "bung",                 "vestibule",            "armpits",
        "tits",                 "knockers",             "elbows",
        "eyes",                 "hooters",              "jugs",
        "lungs",                "headlights",           "disk drives",
        "bumpers",              "knees",                "fried eggs",
        "buttocks",             "charlies",             "ear lobes",
        "bazooms",              "mammaries",
    ]

    thrust := [
        "plunged",              "thrust",               "squeezed",
        "pounded",              "drove",                "eased",
        "slid",                 "hammered",             "squished",
        "crammed",              "slammed",              "reamed",
        "rammed",               "dipped",               "inserted",
        "plugged",              "augured",              "pushed",
        "ripped",               "forced",               "wrenched",
    ]

    dongadj := [
        "bursting",             "jutting",              "glistening",
        "Brobdingnagian",       "prodigious",           "purple",
        "searing",              "swollen",              "rigid",
        "rampaging",            "warty",                "steaming",
        "gorged",               "trunklike",            "foaming",
        "spouting",             "swinish",              "prosthetic",
        "blue veined",          "engorged",             "horse like",
        "throbbing",            "humongous",            "hole splitting",
        "serpentine",           "curved",               "steel encased",
        "glass encrusted",      "knobby",               "surgically altered",
        "metal tipped",         "open sored",           "rapidly dwindling",
        "swelling",             "miniscule",            "boney",
    ]

    dong := [
   "intruder",             "prong",                "stump",
   "member",               "meat loaf",            "majesty",
   "bowsprit",             "earthmover",           "jackhammer",
   "ramrod",               "cod",                  "jabber",
   "gusher",               "poker",                "engine",
   "brownie",              "joy stick",            "plunger",
   "piston",               "tool",                 "manhood",
   "lollipop",             "kidney prodder",       "candlestick",
   "John Thomas",          "arm",                  "testicles",
   "balls",                "finger",               "foot",
   "tongue",               "dick",                 "one-eyed wonder worm",
   "canyon yodeler",       "middle leg",           "neck wrapper",
   "stick shift",          "dong",                 "Linda Lovelace choker",
   ]

   twatadj := [
        "pulsing",              "hungry",               "hymeneal",
        "palpitating",          "gaping",               "slavering",
        "welcoming",            "glutted",              "gobbling",
        "cobwebby",             "ravenous",             "slurping",
        "glistening",           "dripping",             "scabiferous",
        "porous",               "soft-spoken",          "pink",
        "dusty",                "tight",                "odiferous",
        "moist",                "loose",                "scarred",
        "weapon-less",          "banana stuffed",       "tire tracked",
        "mouse nibbled",        "tightly tensed",       "oft traveled",
        "grateful",             "festering",
    ]

    twat := [
        "swamp.",               "honeypot.",            "jam jar.",
        "butterbox.",           "furburger.",           "cherry pie.",
        "cush.",                "slot.",                "slit.",
        "cockpit.",             "damp.",                "furrow.",
        "sanctum sanctorum.",   "bearded clam.",        "continental divide.",
        "paradise valley.",     "red river valley.",    "slot machine.",
        "quim.",                "palace.",              "ass.",
        "rose bud.",            "throat.",              "eye socket.",
        "tenderness.",          "inner ear.",           "orifice.",
        "appendix scar.",       "wound.",               "navel.",
        "mouth.",               "nose.",                "cunt.",
	]

	fasterr := element(faster) or { panic (err) }
	saidr := element(said) or { panic (err) }
	fadjr := element(fadj) or { panic (err) }
	femaler := element(female) or { panic (err) }
	madjecr := element(madjec) or { panic (err) }
	maler := element(male) or { panic (err) }
	diddledr := element(diddled) or { panic (err) }
	titadjr := element(titadj) or { panic (err) }
	knockersr := element(knockers) or { panic (err) }
	thrustr := element(thrust) or { panic (err) }
	dongadjr := element(dongadj) or { panic (err) }
	dongr := element(dong) or { panic (err) }
	twatadjr := element(twatadj) or { panic (err) }
	twatr := element(twat) or { panic (err) }

	println("'${fasterr}' ${saidr} the ${fadjr} ${femaler} as the ${madjecr} ${maler} ${diddledr} her ${titadjr} ${knockersr} and ${thrustr} his ${dongadjr} ${dongr} into her ${twatadjr} ${twatr}")
}