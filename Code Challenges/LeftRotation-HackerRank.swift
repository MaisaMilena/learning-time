func rotLeft(a: [Int], d: Int) -> [Int] {
    if a.count == d {
        return a
    }
    
    var newArray = a
    var counter = 0
    while counter != d {
        let element = newArray.removeFirst()
        newArray.append(element)
        counter += 1
    }
    return newArray
}

let a0 = [1,2,3,4,5]
print(rotLeft(a: a0, d: 2))
print(rotLeft(a: a0, d: 4))
