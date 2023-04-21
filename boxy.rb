def self.boxy(number)
    return nil unless number.integer? || number.nonzero?
    hyphen = "  - " * number
    str = ''
    (1..number).each_with_index do |num, index|
      str = if number == num
              str + "| #{num} |"
            else
              str + "| #{num} "
            end
    end
    puts hyphen, str, hyphen
  end