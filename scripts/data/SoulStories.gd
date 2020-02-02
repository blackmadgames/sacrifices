extends Node

const STORIES = [
    "was a pawn shop clerk who always dreamed of inventing an original signature cocktail until he died a of botched amputation",
    "was an Immigration and Customs inspector who always dreamed of publishing a book of haikus until she slipped on ice and drowned in frozen water",
    "was a banker who always dreamed of climbing a mountain until he caught a sudden fever and died",
    "was an accountant who always dreamed of going fishing in Alaska until he slipped on ice and drowned in frozen water",
    "was a financian analyst who always dreamed of building she own house until she was killed by a cop gone rogue",
    "was an airline pilot who always dreamed of publishing a book of haikus until she was beaten to death with a baguette by a depressed aerospace engineer",
    "was a creative writer who always dreamed of learning to make Moroccan tea until she was hit by lightning",
    "was a banker who always dreamed of meeting the Dalai Lama until she consumed tea, cakes, and wine laced with cyanide, was shot twice, and drowned in a river",
    "was a motel clerk who always dreamed of having a daughter until she slipped on ice and drowned in frozen water",
    "was an airline pilot who always dreamed of learning to throw pottery until she swallowed a toothpick and died",
    "was a motel clerk who always dreamed of climbing a mountain until she was hit by lightning",
    "was a pest control worker who always dreamed of inventing an original signature cocktail until she was hit by a tiny meteorite",
    "was a critical care nurse who always dreamed of learning to make Moroccan tea until she died a of botched amputation",
    "was a dentist who always dreamed of inventing an original signature cocktail until she died a of botched amputation",
    "was a creative writer who always dreamed of having a daughter until she consumed tea, cakes, and wine laced with cyanide, was shot twice, and drowned in a river",
    "was a plumber who always dreamed of climbing a mountain until she died a of botched amputation",
    "was a government service executive who always dreamed of creating a scrapbook until she died a of botched amputation",
    "was a biomass plant technician who always dreamed of scuba diving in Oceania until she consumed tea, cakes, and wine laced with cyanide, was shot twice, and drowned in a river",
    "was a bus driver who always dreamed of visiting the Grand Canyon until she ate a bad sushi and died",
    "was a CEO who always dreamed of climbing a mountain until she was beaten to death with a baseball bat by a jealous wife",
    "was a barber who always dreamed of building she own house until she chocked on the cocoa powder of a tiramisu and died",
    "was a banker who always dreamed of scuba diving in Oceania until she slipped on ice and drowned in frozen water",
    "was a butcher who always dreamed of visiting the Grand Canyon until she was killed by a jealous wife",
    "was a butcher who always dreamed of painting a masterpiece until she caught a sudden fever and died",
    "was a financian analyst who always dreamed of running a marathon until she chocked on the cocoa powder of a tiramisu and died",
    "was a CEO who always dreamed of publishing a book of haikus until she died a of botched amputation",
    "was a bartender who always dreamed of climbing a mountain until she survived choking on a Pretzel, only to by killed by a zealous nun right after",
    "was a pawn shop clerk who always dreamed of having a daughter until she consumed tea, cakes, and wine laced with cyanide, was shot twice, and drowned in a river",
    "was a janitor who always dreamed of inventing an original signature cocktail until she swallowed a toothpick and died",
    "was a bus driver who always dreamed of scuba diving in Oceania until she was beaten to death with a baguette by an Elvis Persley impersonator",
    "was an animal trainer who always dreamed of creating a scrapbook until she was beaten to death with a baguette by an Elvis Persley impersonator",
    "was a telemarketer who always dreamed of learning to play Stairway to Heaven on the guitar until she died in a Segway crash",
    "was a robotics engineer who always dreamed of going fishing in Alaska until she was hit by a tiny meteorite",
    "was an airline pilot who always dreamed of inventing an original signature cocktail until she was hit by a tiny meteorite",
    "was an archivist who always dreamed of having a daughter until she caught a sudden fever and died",
    "was a pest control worker who always dreamed of going to space until she slipped on ice and drowned in frozen water",
    "was a creative writer who always dreamed of going to space until she was hit by a tiny meteorite",
    "was a janitor who always dreamed of going fishing in Alaska until she was hit by a tiny meteorite",
    "was a taxi driver who always dreamed of having a son until she died in a Segway crash",
    "was a pest control worker who always dreamed of publishing a book of haikus until she swallowed a toothpick and died",
    "was a butcher who always dreamed of having a daughter until she ate a bad sushi and died",
    "was a butcher who always dreamed of building she own house until she was hit by lightning",
    "was a taxi driver who always dreamed of learning to make Moroccan tea until she was hit by a tiny meteorite",
    "was a telemarketer who always dreamed of going to space until she chocked on the cocoa powder of a tiramisu and died",
    "was a painter who always dreamed of scuba diving in Oceania until she survived choking on a Pretzel, only to by killed by a zealous nun right after",
    "was an archivist who always dreamed of going to space until she caught a sudden fever and died",
    "was a motel clerk who always dreamed of going fishing in Alaska until she caught a sudden fever and died",
    "was a motel clerk who always dreamed of crossing the ocean until she consumed tea, cakes, and wine laced with cyanide, was shot twice, and drowned in a river",
    "was a cook who always dreamed of climbing a mountain until she was beaten to death with a Bible by a depressed aerospace engineer",
    "was a motel clerk who always dreamed of finding a person he could truly love until he caught a sudden fever and died",
    "was a statistician who always dreamed of climbing a mountain until he slipped on ice and drowned in frozen water",
    "was a painter who always dreamed of finding a person he could truly love until he was hit by lightning",
    "was a janitor who always dreamed of inventing an original signature cocktail until he was hit by lightning",
    "was an animal trainer who always dreamed of publishing a book of haikus until he died in a Segway crash",
    "was a music producer who always dreamed of building he own house until he survived choking on a Pretzel, only to by killed by a hungry bear right after",
    "was a painter who always dreamed of having a son until he was hit by a tiny meteorite",
    "was a sales representative who always dreamed of creating a scrapbook until he died in a Segway crash",
    "was a music producer who always dreamed of scuba diving in Oceania until he was beaten to death with a Bible by a zealous nun",
    "was an accountant who always dreamed of creating a scrapbook until he was beaten to death with a baguette by a depressed dentist",
    "was a dentist who always dreamed of learning to make Moroccan tea until he slipped on ice and drowned in frozen water",
    "was a security guard who always dreamed of climbing a mountain until he was killed by a zealous nun",
    "was an archeologist who always dreamed of building he own house until he was hit by a tiny meteorite",
    "was an archivist who always dreamed of having a son until he survived choking on a Pretzel, only to by killed by a cop gone rogue right after",
    "was a plumber who always dreamed of scuba diving in Oceania until he died a of botched amputation",
    "was a tax attorney who always dreamed of finding a person he could truly love until he was killed by an Elvis Persley impersonator",
    "was a baker who always dreamed of painting a masterpiece until he swallowed a toothpick and died",
    "was a critical care nurse who always dreamed of painting a masterpiece until he was beaten to death with a baguette by a zealous nun",
    "was a telemarketer who always dreamed of learning to make Moroccan tea until he died a of botched amputation",
    "was an archeologist who always dreamed of meeting the Dalai Lama until he ate a bad sushi and died",
    "was an animal trainer who always dreamed of scuba diving in Oceania until he survived choking on a Pretzel, only to by killed by a serial-killing nurse right after",
    "was a flight attendant who always dreamed of learning to make Moroccan tea until he ate a bad sushi and died",
    "was a telemarketer who always dreamed of going to space until he slipped on ice and drowned in frozen water",
    "was a baker who always dreamed of learning to play Stairway to Heaven on the guitar until he chocked on the cocoa powder of a tiramisu and died",
    "was a creative writer who always dreamed of painting a masterpiece until he died a of botched amputation",
    "was a journalist who always dreamed of climbing a mountain until he was hit by a tiny meteorite",
    "was a telemarketer who always dreamed of going fishing in Alaska until he survived choking on a Pretzel, only to by killed by a hungry bear right after",
    "was a statistician who always dreamed of painting a masterpiece until he was hit by a tiny meteorite",
    "was a security guard who always dreamed of learning to make Moroccan tea until he died in a Segway crash",
    "was a bus driver who always dreamed of going to space until he swallowed a toothpick and died",
    "was an airline pilot who always dreamed of going to space until he ate a bad sushi and died",
    "was a tax attorney who always dreamed of visiting New Zealand until he swallowed a toothpick and died",
    "was a janitor who always dreamed of having a daughter until he consumed tea, cakes, and wine laced with cyanide, was shot twice, and drowned in a river",
    "was a pest control worker who always dreamed of learning to throw pottery until he caught a sudden fever and died",
    "was a cook who always dreamed of having a daughter until he died a of botched amputation",
    "was an aerospace engineer who always dreamed of running a marathon until he chocked on the cocoa powder of a tiramisu and died",
    "was a bartender who always dreamed of creating a scrapbook until he slipped on ice and drowned in frozen water",
    "was a financian analyst who always dreamed of learning to throw pottery until he died a of botched amputation",
    "was an Immigration and Customs inspector who always dreamed of learning to play Stairway to Heaven on the guitar until he ate a bad sushi and died",
    "was an archivist who always dreamed of creating a scrapbook until he was hit by a tiny meteorite",
    "was a banker who always dreamed of visiting New Zealand until he was beaten to death with a pipe by a serial-killing nurse",
    "was a cook who always dreamed of going fishing in Alaska until he swallowed a toothpick and died",
    "was an aerospace engineer who always dreamed of painting a masterpiece until he died a of botched amputation",
    "was a plumber who always dreamed of painting a masterpiece until he was hit by lightning",
    "was a government service executive who always dreamed of climbing a mountain until he was hit by lightning",
    "was a financian analyst who always dreamed of scuba diving in Oceania until he died a of botched amputation",
    "was a flight attendant who always dreamed of having a daughter until he swallowed a toothpick and died",
    "was a journalist who always dreamed of meeting the Dalai Lama until he ate a bad sushi and died",
    "was a baker who always dreamed of learning to make Moroccan tea until he was hit by a tiny meteorite",
    "was a Human Resources consultant who always dreamed of going to space until he was hit by lightning",
    "was a teacher who always dreamed of painting a masterpiece until he swallowed a toothpick and died"
]
