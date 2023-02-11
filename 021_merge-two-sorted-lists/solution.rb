# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
def merge_two_lists(list1, list2)
  result = []
  cur1, cur2 = list1, list2

  loop do
    case [cur1 == nil, cur2 == nil]
    in [true, true]
      break
    in [true, false]
        result << cur2.val
        cur2 = cur2.next
    in [false, true]
        result << cur1.val
        cur1 = cur1.next
    in [false, false]
      if cur1.val == cur2.val
        result.push(cur1.val, cur2.val)
        cur1 = cur1.next
        cur2 = cur2.next
      elsif cur1.val < cur2.val
        result << cur1.val
        cur1 = cur1.next
      else
        result << cur2.val
        cur2 = cur2.next
      end
    end
  end

  result
end

# Runtime 99 ms Beats 39.43%
# Memory 211 MB Beats 50.77%
# https://leetcode.com/problems/merge-two-sorted-lists/submissions/896000909/

class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end

  def to_a
    a = []
    list = self
    loop do
      a.push(list.val)
      break if list.next == nil

      list = list.next
    end
    a
  end

  def self.from_a(array)
    first = nil
    cur = nil
    array.each do |e|
      if cur == nil
        cur = ListNode.new(val=e)
        first = cur
      else
        cur.next = ListNode.new(val=e)
        cur = cur.next
      end
    end
    first
  end
end


l = ListNode.from_a([1,2,4])
p l.to_a

p [:result, merge_two_lists(ListNode.from_a([1,2,4]), ListNode.from_a([1,3,4])).to_a, [1,1,2,3,4,4]]
p [:result, merge_two_lists(nil, nil).to_a, []]
p [:result, merge_two_lists(nil, ListNode.from_a([1])).to_a, [1]]
