def character_count(inputs)
    hash = Hash.new(0)
    str = inputs.downcase.chars
    str.each do |s|
        next if s == ' '
        hash[s] = hash[s] + 1
    end

    puts hash
end