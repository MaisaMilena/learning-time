func minimumBribes(q: [Int]) -> Void {
    // Write your code here
    var brabSum = 0
    var caos: Bool = false
    let arraySize = q.count
    for i in 0..<arraySize{
        var hasNextElement = i != arraySize - 1
        if q[i] > i+3 {
            caos = true
        } else if hasNextElement && q[i] > q[i+1] {
            brabSum += 1
        }
    }
    
    if caos {
        print(3)
        print("Too chaotic")
        return
    } else {
        print(brabSum)
    }
}

let a0 = [2,1,3,5,4,6,7,8]
let a1 = [2, 1, 5, 3, 4]
let a2 = [2, 5, 1, 3, 4]

minimumBribes(q: a1)
