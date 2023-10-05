/*
 * Complete the 'makeAnagram' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. STRING a
 *  2. STRING b
 */

func makeAnagram(a: String, b: String) -> Int {
    var dictA: [Character: Int] = [:]
    var diff = 0
    
    a.forEach { char in
        guard dictA[char] != nil else {
            dictA[char] = 1
            return
        }
        dictA[char]! += 1
    }
    
    b.forEach { char in
        if let value = dictA[char] {
            if value > 0 {
                dictA[char]! -= 1
            } else {
                diff += 1
            }
        } else {
            diff += 1
        }
    }
    
    diff += dictA.reduce(0) {
        $0 + $1.value
    }
    return diff
}

//print("Expected 2, got:", makeAnagram(a: "cde", b: "dcf"))
print("Expected 4, got:", makeAnagram(a: "cde", b: "abc"))
//print("Expected 0, got: ", makeAnagram(a: "", b: ""))
//print("Expected 1, got: ", makeAnagram(a: "p", b: ""))
//print("Expected 1, got: ", makeAnagram(a: "", b: "p"))
