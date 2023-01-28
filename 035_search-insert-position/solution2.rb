# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  first, last = 0, nums.size

  loop do
    diff = last - first
    return first if diff <= 0

    mid = first + diff / 2

    if nums[mid] < target
      first = mid + 1
    else
      last = mid
    end
  end
end

# Runtime 106 ms Beats 35.23%
# Memory 211.2 MB Beats 92.80%
# https://leetcode.com/problems/search-insert-position/submissions/886727969/

p [:result, search_insert([1,3,5,6], 5), 2]
p [:result, search_insert([1,3,5,6], 2), 1]
p [:result, search_insert([1,3,5,6], 7), 4]
