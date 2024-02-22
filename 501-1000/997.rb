def find_judge(n, trust)
    judge, store = -1, Hash.new()
    
    return -1 if trust.length < n-1
    
    trust.each do |people|
        store[people[0]] ||= Array.new
        store[people[0]] << people[1]
    end
    
    return -1 if store.length < n-1
    
    (1..n).each do |key|
      unless store[key]
          judge  = key
          break
      end
    end
    
    store.each do |key, value|
        return -1 unless value.include? judge
    end
    
    return judge
end
