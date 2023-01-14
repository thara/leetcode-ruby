# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def next_permutation(nums)
  p = nums.permutation.sort.uniq

  next_index = p.find_index(nums) + 1
  next_index = 0 if p.size <= next_index

  next_nums = p.take(next_index+1).last

  nums.each_with_index do |_, i|
    nums[i] = next_nums[i]
  end
end

# Time Limit Exceeded
