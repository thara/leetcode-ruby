# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  2 * nums.uniq.sum - nums.sum
end

# Runtime 83 ms Beats 95.81%
# Memory 213.1 MB Beats 55.69%
