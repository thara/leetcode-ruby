# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  rec_search(0, nums.size, target, nums)
end

def rec_search(first, last, target, nums)
  diff = last - first
  return first if diff == 0

  mid = first + diff / 2

  if nums[mid] < target
    rec_search(mid + 1, last, target, nums)
  else
    rec_search(first, mid, target, nums)
  end
end

# Runtime 122 ms Beats 28.41%
# Memory 211.3 MB Beats 24.24%
# https://leetcode.com/problems/search-insert-position/submissions/886726160/

p [:result, search_insert([1,3,5,6], 5), 2]
p [:result, search_insert([1,3,5,6], 2), 1]
p [:result, search_insert([1,3,5,6], 7), 4]
