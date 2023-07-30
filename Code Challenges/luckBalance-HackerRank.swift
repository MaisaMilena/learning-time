func luckBalance(k: Int, contests: [[Int]]) -> Int {
    var nImportantAllowedToLose = k
    var importantToWin: [Int: Int] = [:]
    var luckSum = 0
    
    for i in 0..<contests.count {
        let luck = contests[i][0]
        let importance = contests[i][1]
        if importance == 1 {
            importantToWin[i] = luck
        } else {
            luckSum += luck
        }
    }
    
    if importantToWin.count == nImportantAllowedToLose {
        let luckImportant = importantToWin.values.reduce(0, { x, y in
            x + y
        })
        return luckImportant + luckSum
    } else {
        var luckSorted = importantToWin.values.sorted(by: <)
        while nImportantAllowedToLose > 0 {
            luckSum += luckSorted.popLast() ?? 0
            nImportantAllowedToLose -= 1
        }
        for luckSort in luckSorted {
            luckSum -= luckSort
        }
        return luckSum
    }
}



let contest0 = [[5, 1], [2, 1], [1, 1], [8, 1], [10, 0], [5, 0]]
print(luckBalance(k: 3, contests: contest0))

let contest1 = [[5,1], [1,1], [4,0]]
print(luckBalance(k: 2, contests: contest1))
