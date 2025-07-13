def match_players_and_trainers(players, trainers)
    trainers.sort!
    ti = 0
    players.sort!.inject(0) {|res, p|
        ti += 1 while ti < trainers.size && p > trainers[ti]
        break res if ti >= trainers.size
        ti += 1
        res + 1
    }
end
