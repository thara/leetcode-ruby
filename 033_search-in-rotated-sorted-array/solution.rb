# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  p = find_pivot(nums)

  left = binary_search(nums[...p], target)
  return left if 0 <= left

  right = binary_search(nums[p..], target)
  return right + p if 0 <= right

  -1
end

def find_pivot(nums)
  low, high = 0, nums.size - 1
  mid = nums.size / 2

  while low < high
    if nums[mid-1] > nums[mid]
      return mid
    elsif mid+1 < nums.size && nums[mid] > nums[mid+1]
      return mid + 1
    else
      if nums[low] > nums[mid]
        high = mid
      else
        low = mid + 1
      end
    end
    mid = low + ((high - low) / 2)
  end

  0
end

def binary_search(nums, target)
  low, high = 0, nums.size

  while low < high
    mid = low + ((high - low) / 2)
    return mid if nums[mid] == target
    break if high - low <= 1

    if target < nums[mid]
      high = mid
    else
      low = mid
    end
  end
  -1
end

# https://leetcode.com/problems/search-in-rotated-sorted-array/submissions/882382532/
#
# Runtime 82 ms Beats 83.33%
# Memory 211.3 MB Beats 40.63%
