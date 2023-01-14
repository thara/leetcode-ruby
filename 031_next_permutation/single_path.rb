# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def next_permutation(nums)
  last = nums.size - 1
  i = last.downto(1).find { |i| nums[i-1] < nums[i] }
  return nums.reverse! if i == nil

  i -= 1

  j = last.downto(i+1).find { |j| nums[i] < nums[j] }
  return if j == nil

  p [i, j, i+1, last]
  nums[i], nums[j] = nums[j], nums[i]

  nums[i+1..last] = nums[i+1..last].reverse
end

# Runtime 84 ms Beats 87.18%
# Memory 211.2 MB Beats 28.21%
