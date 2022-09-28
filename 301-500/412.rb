# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
  mappings = {
      '3' => 'Fizz',
      '5' => 'Buzz'
  }

  output = []

  n.times.each do |index|
    num = index + 1
    data = ""

    mappings.keys.each do |mapping|
      if (num % mapping.to_i).zero?
        data += mappings[mapping]
      end
    end

    data = data == "" ? num.to_s : data
    output.push data
  end
  output
end
