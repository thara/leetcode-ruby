# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return "" if strs.empty?
  rec_longest_common_prefix(strs, 0, strs.length - 1)
end

def rec_longest_common_prefix(strs, l, r)
  return strs[l] if l == r

  mid = (l + r) / 2
  left = rec_longest_common_prefix(strs, l, mid)
  right = rec_longest_common_prefix(strs, mid + 1, r)
  common_prefix(left, right)
end

def common_prefix(left, right)
  min = [left.length, right.length].min
  min.times.each do |i|
    if left[i] != right[i]
      return left[0...i]
    end
  end
  left[0...min]
end

# Runtime 107 ms Beats 34.68%
# Memory 211 MB Beats 50.89%
#
# https://leetcode.com/problems/longest-common-prefix/submissions/891323382/

p [:result, longest_common_prefix(["flower","flow","flight"]), "fl"]
p [:result, longest_common_prefix(["dog","racecar","car"]), ""]
p [:result, longest_common_prefix(["a"]), "a"]
p [:result, longest_common_prefix(["ab", "a"]), "a"]
p [:result, longest_common_prefix(["", "b"]), ""]
p [:result, longest_common_prefix(["flower","flower","flower","flower"]), "flower"]
