OCTAL_TO_BINARY = {
    "0" => "000",
    "1" => "001",
    "2" => "010",
    "3" => "011",
    "4" => "100",
    "5" => "101",
    "6" => "110",
    "7" => "111"
  }

def conversion(number, from, to)
    case from
    when 'decimal'
      binary_string = ''
      divider = to.eql?('binary') ? 2 : 8

      while number > 0
        remainder = number % divider
        binary_string = remainder.to_s + binary_string
        number /= divider
      end

      puts binary_string
    when 'octal'
      if to.eql?('decimal')
        sum = 0

        number.to_s.split('').reverse.each_with_index do |digit, index|
          sum += digit.to_i * (8 ** index)
        end

        puts sum
      else
        str = ''
        while number > 0
          remainder = number % 10
          str = OCTAL_TO_BINARY[remainder.to_s] + str
          number /= 10
        end

        puts str
      end
    when 'binary'
      if to.eql?('decimal')
        sum = 0

        number.to_s.split('').reverse.each_with_index do |digit, index|
          sum += digit.to_i * (2 ** index)
        end

        puts sum
      else
        decimal_sum = 0

        number.to_s.split('').reverse.each_with_index do |digit, index|
          decimal_sum += digit.to_i * (2 ** index)
        end

        octal_string = ''
        divider = 8

        while decimal_sum > 0
          remainder = decimal_sum % divider
          octal_string = remainder.to_s + octal_string
          decimal_sum /= divider
        end

        puts octal_string
      end
    end 
  end

  conversion(10101, 'binary', 'octal')



# module Conversion
#   OCTAL_TO_BINARY = {
#     "0" => "000",
#     "1" => "001",
#     "2" => "010",
#     "3" => "011",
#     "4" => "100",
#     "5" => "101",
#     "6" => "110",
#     "7" => "111"
#   }

#   def self.convert(number, from, to)
#     case from
#     when 'decimal'
#       convert_decimal(number, to)
#     when 'octal'
#       convert_octal(number, to)
#     when 'binary'
#       convert_binary(number, to)
#     end 
#   end

#   def self.convert_decimal(number, to)
#     binary_string = ''
#     divider = to.eql?('binary') ? 2 : 8

#     while number > 0
#       remainder = number % divider
#       binary_string = remainder.to_s + binary_string
#       number /= divider
#     end

#     puts binary_string
#   end

#   def self.convert_octal(number, to)
#     if to.eql?('decimal')
#       puts convert_to_decimal(number, 8)
#     else
#       str = ''
#       while number > 0
#         remainder = number % 10
#         str = OCTAL_TO_BINARY[remainder.to_s] + str
#         number /= 10
#       end

#       puts str
#     end
#   end

#   def self.convert_binary(number, to)
#     if to.eql?('decimal')
#       puts convert_to_decimal(number, 2)
#     else
#       decimal_sum = convert_to_decimal(number, 2)
#       octal_string = ''
#       divider = 8

#       while decimal_sum > 0
#         remainder = decimal_sum % divider
#         octal_string = remainder.to_s + octal_string
#         decimal_sum /= divider
#       end

#       puts octal_string
#     end
#   end

#   def self.convert_to_decimal(number, multiplier)
#     sum = 0
    
#     number.to_s.split('').reverse.each_with_index do |digit, index|
#       sum += digit.to_i * (multiplier ** index)
#     end

#     sum
#   end
# end