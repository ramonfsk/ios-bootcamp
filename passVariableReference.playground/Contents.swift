struct Match {
    var score: Int
    
    init(score: Int) {
        self.score = score
    }
}

func finish(_ match: inout Match) {
    match.score = 100
}

var match = Match(score: 100)
print(match.score)
finish(&match)
print(match.score)
