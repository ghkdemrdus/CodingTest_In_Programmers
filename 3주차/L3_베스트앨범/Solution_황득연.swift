import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var genresDict = [String: [(idx: Int, play: Int)]]()
    
    for i in 0..<genres.count {
        genresDict[genres[i], default: []] += [(i, plays[i])]
    }
    
    var sumList = genresDict.map { (key: $0.key, sum: $0.value.map { $0.play }.reduce(0, +))}
    let sumListSorted = sumList.sorted { $0.sum > $1.sum }
    
    var result = [Int]()
    for item in sumListSorted {
        var list = genresDict[item.key]!
        if list.count == 1 {
            result += [list[0].idx]
            continue
        } else {
            list.sort {
                if $0.play == $1.play {
                    return $0.idx < $1.idx
                }
                return $0.play > $1.play
            }
            result += [list[0].idx, list[1].idx]
        }
    }
    return result
}

// func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
//     var result = [Int]()
//     var playsDict = [String: Int]()
//     var genresDict = [String: [(Int,Int)]]()
    
//     for i in 0..<genres.count {
//         playsDict[genres[i]] = playsDict[genres[i], default: 0] + plays[i]
//         genresDict[genres[i]] = genresDict[genres[i], default: []] + [(i,plays[i])]
//     }
    
//     var tuple = playsDict.map { ($0.key, $0.value)}
//     tuple.sort { $0.1 > $1.1 }
//     for i in 0..<tuple.count {
//         let name = tuple[i].0
//         var list: [(Int, Int)] = genresDict[name]!
//         list.sort { $0.1 > $1.1 }
//         result += [list[0].0]
//         if list.count > 1 {
//             result += [list[1].0]
//         }
//     }
    
//     return result
// }
