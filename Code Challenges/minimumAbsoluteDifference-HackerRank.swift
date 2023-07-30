
func minimumAbsoluteDifference(arr: [Int]) -> Int {
    if arr.isEmpty {
        return 0
    }
    var minValue = Int.max
    let orderedArr = arr.sorted()
    for index in 0..<(orderedArr.count-1) {
        let difference = abs(orderedArr[index] - orderedArr[index + 1])
        if difference < minValue  {
            minValue = difference
        }
    }
    return minValue
}


let arr0 = [-59,-36,-13,1,-53,-92,-2,-96,-54,75]
print(minimumAbsoluteDifference(arr: arr0))

let arr1 = [Int]()
print(minimumAbsoluteDifference(arr: arr1))

let arr2 = [-2, -10, -4, 0]
print(minimumAbsoluteDifference(arr: arr2))

let arr3 = [1,-3,71,68,17]
print(minimumAbsoluteDifference(arr: arr3))
