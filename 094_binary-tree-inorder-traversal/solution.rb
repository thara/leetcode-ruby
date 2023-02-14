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
  in_order(root, result)
  result
end

def in_order(node, result)
  return if node.nil?

  in_order(node.left, result) unless node.left.nil?
  result << node.val
  in_order(node.right, result) unless node.right.nil?
end

# Runtime 91 ms Beats 39.86%
# Memory211.1 MB Beats 30.43%
# https://leetcode.com/problems/binary-tree-inorder-traversal/submissions/897890861/
