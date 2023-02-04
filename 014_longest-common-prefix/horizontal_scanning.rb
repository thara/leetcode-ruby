# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return "" if strs.empty?

  prefix = strs[0]
  strs[1..].each do |s|
    while (s.index(prefix) || -1) != 0
      prefix = prefix[0...prefix.length-1]
      return "" if prefix.empty?
    end
  end

  return prefix
end

# Runtime 96 ms Beats 53.92%
# Memory211.1 MB Beats 25.57%
#
# https://leetcode.com/problems/longest-common-prefix/submissions/891307632/

# p [:result, longest_common_prefix(["flower","flow","flight"]), "fl"]
# p [:result, longest_common_prefix(["dog","racecar","car"]), ""]
# p [:result, longest_common_prefix(["a"]), "a"]
# p [:result, longest_common_prefix(["ab", "a"]), "a"]
# p [:result, longest_common_prefix(["", "b"]), ""]
# p [:result, longest_common_prefix(["flower","flower","flower","flower"]), "flower"]
