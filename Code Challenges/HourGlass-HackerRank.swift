
let arr: [[Int]] =
[[1,1,1,0,0,0],
[0,1,0,0,0,0],
[1,1,1,0,0,0],
[0,0,2,4,4,0],
[0,0,0,2,0,0],
[0,0,1,2,4,0]]

let arr1: [[Int]] =
[[-9,-9,-9,1,1,1],
[0,-9,0,4,3,2],
[-9,-9,-9,1,2,3],
[0,0,8,6,6,0],
[0,0,0,-2,0,0],
[0,0,1,2,4,0]]


func hourglassSum(arr: [[Int]]) -> Int {
    var hourGlassesSumMax = -100
    
    for lineIndex in 0...arr.count - 3 {
        let line0 = arr[lineIndex]
        let line1 = arr[lineIndex+1]
        let line2 = arr[lineIndex+2]
        
        for element in 0...line0.count - 3 {
            let sum = getHourGlass(baseIndex: element, arr0: line0, arr1: line1, arr2: line2)
            if sum > hourGlassesSumMax {
                hourGlassesSumMax = sum
            }
        }
    }
    
    return hourGlassesSumMax
}

func getHourGlass(baseIndex: Int, arr0: [Int], arr1: [Int], arr2: [Int]) -> Int {
    let line0 = arr0[baseIndex] + arr0[baseIndex+1] + arr0[baseIndex+2]
    let line1 = arr1[baseIndex+1]
    let line2 = arr2[baseIndex] + arr2[baseIndex+1] + arr2[baseIndex+2]
    return line0 + line1 + line2
}

print(hourglassSum(arr: arr1))

//print(getHourGlass(baseIndex: 0, arr0: arr[0], arr1: arr[1], arr2: arr[2]))
//print(getHourGlass(baseIndex: 2, arr0: arr[3], arr1: arr[4], arr2: arr[5]))

//print(sockMerchant(ar: at))


