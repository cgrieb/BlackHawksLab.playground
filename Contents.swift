//: Blackhawks Lab
//: Note: I only entered the data for the forwards. It's a lot of data!

import UIKit

// an array that translates month numbers to names
let month = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]

// data from the Blackhawks derived from:
// http://blackhawks.nhl.com/club/roster.htm

// team gives the player name indexed by player number
let team = [ 15 : "Artem Anisimov",
    39 : "Kyle Baun",
    29 : "Bryan Bickell",
    56 : "Marko Dano",
    11 : "Andrew Desjardins",
    28 : "Ryan Garbutt",
    62 : "Ryan Haggerty",
    38 : "Ryan Hartman",
    48 : "Vincent Hinostroza",
    81 : "Marian Hossa",
    88 : "Patrick Kane",
    67 : "Tanner Kero",
    58 : "Graham Knott",
    16 : "Marcus Kreuger",
    46 : "Mike Liambas",
    53 : "Brandon Mashinter",
    41 : "Mark McNeill",
    27 : "Jeremy Morin",
    72 : "Artemi Panarin",
    70 : "Dennis Rasmussen",
    61 : "Garret Ross",
    65 : "Andrew Shaw",
    86 : "Teuvo Teravainen",
    14 : "Viktor Tikhonov",
    19 : "Jonathan Toews",
    25 : "Corey Tropp"
]

// playerdata contains: number, weight, height, birthdate, age
let number = 0, weight = 1, height = 2, birthdate = 3, age = 4
var playerdata = [
    [ 15, 198, 76, 19880524, 27 ],
    [ 39, 209, 74, 19920504, 23 ],
    [ 29, 223, 76, 19860309, 29 ],
    [ 56, 183, 71, 19941130, 20 ],
    [ 11, 195, 73, 19860727, 29 ],
    [ 28, 195, 72, 19850812, 30 ],
    [ 62, 201, 72, 19930304, 22 ],
    [ 38, 191, 71, 19940920, 21 ],
    [ 48, 158, 69, 19940403, 21 ],
    [ 81, 207, 73, 19790112, 36 ],
    [ 88, 177, 71, 19881119, 26 ],
    [ 67, 185, 72, 19920724, 23 ],
    [ 58, 188, 75, 19970113, 18 ],
    [ 16, 186, 72, 19900527, 25 ],
    [ 46, 203, 70, 19890216, 26 ],
    [ 53, 212, 76, 19880920, 27 ],
    [ 41, 214, 74, 19930222, 22 ],
    [ 27, 189, 73, 19910416, 24 ],
    [ 72, 170, 71, 19911030, 23 ],
    [ 70, 205, 75, 19900703, 25 ],
    [ 61, 173, 72, 19920526, 23 ],
    [ 65, 179, 71, 19910720, 24 ],
    [ 86, 178, 71, 19940911, 21 ],
    [ 14, 189, 74, 19880512, 27 ],
    [ 19, 201, 74, 19880429, 27 ],
    [ 25, 185, 72, 19890725, 26 ]]

// player countries indexed by player number
let countries : [ Int : String ] = [ 15 : "Russia",
     39 : "Canada",
     29 : "Canada",
     56 : "Austria",
     11 : "Canada",
     28 : "Canada",
     62 : "USA",
     38 : "USA",
     48 : "USA",
     81 : "Slovakia",
     88 : "USA",
     67 : "USA",
     58 : "Canada",
     16 : "Sweden",
     46 : "Canada",
     53 : "Canada",
     41 : "Canada",
     27 : "USA",
     72 : "Russia",
     70 : "Sweden",
     61 : "USA",
     65 : "Canada",
     86 : "Finland",
     14 : "Latvia",
     19 : "Canada",
     25 : "USA" ]

// calculate the average age of the players
// calculate the average height of the players
// determine the month in which most player birthdays fall
var totalAge = 0
var totalHeight = 0
var monthCount = [ Int : Int ]()

// iterate through the data and total up the ages an heights
// and also count up the birthdays by month
for subArray in playerdata {
    totalAge += subArray[age]
    totalHeight += subArray[height]
    let birthMonth = (subArray[birthdate] % 10000) / 100
    if let tempValue = monthCount[birthMonth] {
        monthCount[birthMonth] = tempValue + 1
    } else {
        monthCount[birthMonth] = 1
    }
}

// now use the data collected to figure the average height
let averageHeight = totalHeight/team.count
// and look at the birthdays by month to get the most frequent
var maxCount = 0
var maxMonth = 0
for (key,value) in monthCount {
    if monthCount[key] > maxCount {
        maxCount = monthCount[key]!
        maxMonth = key
    }
}

// display a header

print("\n\nChicago Blackhawks Team Data: Forwards\n")


// print out the "statistics"

print("The average age of the players is \(totalAge/team.count).")
if averageHeight < 72 {
    print("The average height of the players is 5'\(averageHeight-60)\".")
} else {
    print("The average height of the players is 6'\(averageHeight-72)\".")
}
print("The month with the most player birthdays is \(month[maxMonth]).")

// display team roster
// first, player list in order given

print("\n#\tNAME\t\t\t\tHEIGHT\tWEIGHT\tDOB\t\t\t\tAGE\t\tCOUNTRY")
print("--  ----------------    ----    ----    ------------    ----    --------")

for subArray in playerdata {
    let name = team[subArray[number]]!
    let dd = subArray[birthdate] % 100
    let mm = (subArray[birthdate] % 10000) / 100
    let yyyy = subArray[birthdate] / 10000
    var dob : String = "\(month[mm]) \(dd), \(yyyy)"
    dob = dob.characters.count < 12 ? (dob + " ") : dob
    var padded = name.characters.count < 12 ? (name + "    ") : name
    padded = padded.characters.count < 16 ? (padded + "    ") : padded
    if subArray[height] < 72 {
        print("\(subArray[number])\t\(padded)\t\(subArray[weight])\t\t5'\(subArray[height]-60)\"\t\(dob)\t\(subArray[age])\t\t\(countries[subArray[number]]!)")
    } else {
        print("\(subArray[number])\t\(padded)\t\(subArray[weight])\t\t6'\(subArray[height]-72)\"\t\(dob)\t\(subArray[age])\t\t\(countries[subArray[number]]!)")
    }
}

// now display the roster sorted by age

print("\nTeam Roster by age")
print("#\tNAME\t\t\t\tHEIGHT\tWEIGHT\tDOB\t\t\t\tAGE\t\tCOUNTRY")
print("--  ----------------    ----    ----    ------------    ----    --------")

for subArray in playerdata.sort({ ($0[age] ) < ($1[age] ) }) {
    let name = team[subArray[number]]!
    let dd = subArray[birthdate] % 100
    let mm = (subArray[birthdate] % 10000) / 100
    let yyyy = subArray[birthdate] / 10000
    var dob : String = "\(month[mm]) \(dd), \(yyyy)"
    dob = dob.characters.count < 12 ? (dob + " ") : dob
    var padded = name.characters.count < 12 ? (name + "    ") : name
    padded = padded.characters.count < 16 ? (padded + "    ") : padded
    if subArray[height] < 72 {
        print("\(subArray[number])\t\(padded)\t\(subArray[weight])\t\t5'\(subArray[height]-60)\"\t\(dob)\t\(subArray[age])\t\t\(countries[subArray[number]]!)")
    } else {
        print("\(subArray[number])\t\(padded)\t\(subArray[weight])\t\t6'\(subArray[height]-72)\"\t\(dob)\t\(subArray[age])\t\t\(countries[subArray[number]]!)")
    }
}

// finally, create a list of players sorted by country

print("\nTeam Roster by country")
print("#\tNAME\t\t\t\tHEIGHT\tWEIGHT\tDOB\t\t\t\tAGE\t\tCOUNTRY")
print("--  ----------------    ----    ----    ------------    ----    --------")

let countriesSorted = countries.values.sort()
var lastCountry = String()
for thisCountry in countriesSorted {
    if thisCountry != lastCountry {
        for subArray in playerdata {
            if countries[subArray[number]] == thisCountry {
                let name = team[subArray[number]]!
                let dd = subArray[birthdate] % 100
                let mm = (subArray[birthdate] % 10000) / 100
                let yyyy = subArray[birthdate] / 10000
                var dob : String = "\(month[mm]) \(dd), \(yyyy)"
                dob = dob.characters.count < 12 ? (dob + " ") : dob
                var padded = name.characters.count < 12 ? (name + "    ") : name
                padded = padded.characters.count < 16 ? (padded + "    ") : padded
                if subArray[height] < 72 {
                    print("\(subArray[number])\t\(padded)\t\(subArray[weight])\t\t5'\(subArray[height]-60)\"\t\(dob)\t\(subArray[age])\t\t\(countries[subArray[number]]!)")
                } else {
                    print("\(subArray[number])\t\(padded)\t\(subArray[weight])\t\t6'\(subArray[height]-72)\"\t\(dob)\t\(subArray[age])\t\t\(countries[subArray[number]]!)")
                }
                
            }
        }
        lastCountry = thisCountry
    }
}


