# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  f = lambda do |s, left, right, f|
    return [s] if s.size >= n * 2

    result = []

    if left < n
      a = f.call(s + "(", left + 1, right, f)
      result.concat(a)
    end
    if right < left
      a = f.call(s + ")", left, right + 1, f)
      result.concat(a)
    end

    result
  end
  f.call("", 0, 0, f)
  # result = []

  # lambda do |s, left, right, f|
  #   if s.size >= n * 2
  #     result << s if s.size >= n * 2
  #     return
  #   end

  #   if left < n
  #     f.call(s + "(", left + 1, right, f)
  #   end

  #   if right < left
  #     f.call(s + ")", left, right + 1, f)
  #   end
  # end.tap { |f| f.call("", 0, 0, f) }

  # result
end

# Runtime 189 ms Beats 22.41%
# Memory 211.4 MB Beats 48.28%
