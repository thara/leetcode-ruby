# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  _generate_parenthesis("", 0, 0, n)
end

def _generate_parenthesis(s, left, right, n)
  return [s] if s.size >= n * 2

  result = []

  if left < n
    a = _generate_parenthesis(s + "(", left + 1, right, n)
    result.concat(a)
  end
  if right < left
    a = _generate_parenthesis(s + ")", left, right + 1, n)
    result.concat(a)
  end

  result
end

# Runtime 173 ms Beats 38.79%
# Memory 211.3 MB Beats 75%
