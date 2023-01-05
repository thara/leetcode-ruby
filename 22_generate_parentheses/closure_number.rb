# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  result = []

  if n == 0
    result << ""
  else
    (0..n*2).times.each do |i|
      generate_parenthesis(i).each do |s|
      end
    end
    generate_parenthesis(n-1).each do |s|
      result << "(#{s})"
    end
  end

  result
end
