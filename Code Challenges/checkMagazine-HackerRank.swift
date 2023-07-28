/*
 * Complete the 'checkMagazine' function below.
 *
 * The function accepts following parameters:
 *  1. STRING_ARRAY magazine
 *  2. STRING_ARRAY note
 */

func checkMagazine(magazine: [String], note: [String]) -> Void {
    // Write your code here
    var magazineDict = getWordsMapped(magazine)
    var noteDict = getWordsMapped(note)
    var response = true
    for word in note {
        if (magazineDict[word] == nil) || (magazineDict[word] ?? 0) <= 0 {
            print("No")
            return
        } else {
            magazineDict[word] = magazineDict[word]! - 1
        }
    }
    print("Yes")
}

func getWordsMapped(_ font: [String]) -> [String: Int] {
    var dict: [String: Int] = [:]
    for word in font {
        if (dict[word] != nil) {
            dict[word]! += 1
        } else {
            dict[word] = 1
        }
    }
    return dict
}


let magazine0 = "give me one grand today night".split(separator: " ").map{String($0)}
let note0 = "give one grand today".split(separator: " ").map{String($0)}
checkMagazine(magazine: magazine0, note: note0)

let magazine1 = "two times three is not four".split(separator: " ").map{String($0)}
let note1 = "two times two is four".split(separator: " ").map{String($0)}
//checkMagazine(magazine: magazine1, note: note1)
//print(getWordsMapped(note1))

let magazine2 = "ive got a lovely bunch of coconuts".split(separator: " ").map{String($0)}
let note2 = "ive got some coconuts".split(separator: " ").map{String($0)}
//checkMagazine(magazine: magazine2, note: note2)
