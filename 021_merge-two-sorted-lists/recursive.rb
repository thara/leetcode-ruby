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
  case [list1 == nil, list2 == nil]
  in [true, true]
    nil
  in [false, true]
    list1
  in [true, false]
    list2
  in [false, false] if list1.val < list2.val
    list1.next = merge_two_lists(list1.next, list2)
    list1
  else
    list2.next = merge_two_lists(list1, list2.next)
    list2
  end
end

# Runtime 99 ms Beats 39.43%
# Memory 211.1 MB Beats 50.77%
# https://leetcode.com/problems/merge-two-sorted-lists/submissions/896025579/

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
