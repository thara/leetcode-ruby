# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  result = []

  # http://www.geometer.org/mathcircles/catalan.pdf
  if n == 0
    result << ""
  else
    n.times.each do |k|
      generate_parenthesis(k).each do |left|
        generate_parenthesis(n - k - 1).each do |right|
          result << "(#{left})#{right}"
        end
      end
    end
  end

  result
end

# Runtime 170 ms Beats 43.97%
# Memory 211.3 MB Beats 48.28%
