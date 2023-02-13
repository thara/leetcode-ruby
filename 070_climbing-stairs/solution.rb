# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  def fib(n, cache)
    cache[n] || begin
      case n
      when 1 then 1
      when 2 then 2
      else
        fib(n-1, cache) + fib(n-2, cache)
      end
    end.tap do |result|
      cache[n] = result
    end
  end

  fib(n, Hash.new)
end

# Runtime 100 ms Beats 21.72%
# Memory 211 MB Beats 37.30%

# https://leetcode.com/problems/climbing-stairs/submissions/897239600/

p [:result, climb_stairs(2), 2]
p [:result, climb_stairs(3), 3]
p [:result, climb_stairs(38), 63245986]
