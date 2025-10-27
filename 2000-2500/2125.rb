def number_of_beams(bank)
    cnt = 0
    bank.inject(0) {|res, row|
        next res if (curcnt = row.count('1')).zero?
        (res, cnt = res + cnt * curcnt, curcnt).first
    }
end
