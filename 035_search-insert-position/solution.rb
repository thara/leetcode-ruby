# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  left, right = 0, nums.size - 1

  return 0 if target < nums[left]
  return nums.size if nums[right] < target

  loop do
    mid = left + (right - left) / 2

    if nums[mid] == target
      return mid
    elsif nums[mid] < target
      left = mid
    else
      right = mid
    end

    return left if nums[left] == target
    return right if nums[right] == target

    if right - left <= 1
      if target < nums[mid]
        return mid
      elsif nums[mid] < target
        return mid + 1
      end
    end
  end
end

# Runtime 114 ms Beats 31.6%
# Memory 211.1 MB Beats 92.80%
# https://leetcode.com/problems/search-insert-position/submissions/886719790/
