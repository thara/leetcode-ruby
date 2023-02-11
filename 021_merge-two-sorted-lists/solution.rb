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
  result = nil
  cur1, cur2 = list1, list2

  first = nil

  def advance(val, result)
    first = false
    if result == nil
      result = ListNode.new(val=val)
      first = true
    else
      result.next = ListNode.new(val=val)
      result = result.next
    end
    [result, first]
  end

  loop do
    break if cur1 == nil && cur2 == nil

    fwd1, fwd2 = false, false

    case [cur1 == nil, cur2 == nil]
    in [true, false]
        fwd2 = true
    in [false, true]
        fwd1 = true
    in [false, false]
      if cur1.val == cur2.val
        fwd1, fwd2 = true, true
      elsif cur1.val < cur2.val
        fwd1 = true
      else
        fwd2 = true
      end
    end

    if fwd1
      result, has_first = advance(cur1.val, result)
      first = result if has_first
      cur1 = cur1.next
    end
    if fwd2
      result, has_first = advance(cur2.val, result)
      first = result if has_first
      cur2 = cur2.next
    end
  end

  first
end

# Runtime 94 ms Beats 52.6%
# Memory 211.2 MB Beats 7.99%
# https://leetcode.com/problems/merge-two-sorted-lists/submissions/896016145/

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
