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
  first, tail = nil, nil
  cur1, cur2 = list1, list2

  loop do
    fwd = nil

    case [cur1 == nil, cur2 == nil]
    in [true, true]
        break
    in [true, false]
        fwd = cur2
    in [false, true]
        fwd = cur1
    in [false, false]
      if cur1.val < cur2.val
        fwd = cur1
      else
        fwd = cur2
      end
    end

    if tail == nil
      tail = ListNode.new(val=fwd.val)
      first = tail
    else
      tail.next = ListNode.new(val=fwd.val)
      tail = tail.next
    end

    cur1 = cur1.next if fwd == cur1
    cur2 = cur2.next if fwd == cur2
  end

  first
end

# Runtime 91 ms Beats 61.86%
# Memory 211.1 MB Beats 50.77%
# https://leetcode.com/problems/merge-two-sorted-lists/submissions/896020543/

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
