# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return "" if strs.empty?

  strs[0].each_char.each_with_index do |c, i|
    strs[1..].each do |s|
      if i == s.length || s[i] != c
        return strs[0][0...i]
      end
    end
  end

  strs[0]
end

# Runtime 106 ms Beats 36.20%
# Memory 211 MB Beats 50.89%
#
# https://leetcode.com/problems/longest-common-prefix/submissions/891312568/

# p [:result, longest_common_prefix(["flower","flow","flight"]), "fl"]
# p [:result, longest_common_prefix(["dog","racecar","car"]), ""]
# p [:result, longest_common_prefix(["a"]), "a"]
# p [:result, longest_common_prefix(["ab", "a"]), "a"]
# p [:result, longest_common_prefix(["", "b"]), ""]
# p [:result, longest_common_prefix(["flower","flower","flower","flower"]), "flower"]

