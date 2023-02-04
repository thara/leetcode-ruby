# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  prefix = ""

  strs.each_with_index do |s, i|
    if i == 0
      prefix = s
    else
      x = -1
      s.each_char.each_with_index do |c, i|
        break if prefix[i] != c
        x = i
      end
      if 0 <= x
        prefix = prefix[..x]
      else
        return ""
      end
    end
  end

  prefix
end

# Runtime 103 ms Beats 42.28%
# Memory 211 MB Beats 50.89%

# https://leetcode.com/problems/longest-common-prefix/submissions/891301231/

# p [:result, longest_common_prefix(["flower","flow","flight"]), "fl"]
# p [:result, longest_common_prefix(["dog","racecar","car"]), ""]
# p [:result, longest_common_prefix(["a"]), "a"]
# p [:result, longest_common_prefix(["ab", "a"]), "a"]
# p [:result, longest_common_prefix(["", "b"]), ""]
# p [:result, longest_common_prefix(["flower","flower","flower","flower"]), "flower"]
