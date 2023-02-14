# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[]}
def inorder_traversal(root)
  result = []
  stack = [root]

  while 0 < stack.size
    node = stack.last
    break if node.nil?

    unless node.left.nil?
      stack << node.left
      node.left = nil
      next
    end

    result << node.val
    stack.pop()

    unless node.right.nil?
      stack << node.right
      node.right = nil
      next
    end
  end

  result
end

# Runtime 63 ms Beats 97.83%
# Memory 211.1 MB Beats 9.42%

# https://leetcode.com/problems/binary-tree-inorder-traversal/submissions/897910067/
