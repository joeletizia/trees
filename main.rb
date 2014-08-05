require 'tree'
require 'pry'
require 'thread'

def depth_first(tree_node, value)
  return tree_node if value == tree_node.content

  tree_node.children.each do |sub_tree|
    return_value = depth_first(sub_tree, value)
    return return_value if return_value
  end

  nil
end

def breadth_first(tree_node, value)
  queue = Queue.new
  queue.push(tree_node)

  until queue.empty?
    node = queue.pop
    return node if node.content == value

    node.children.each do |child_node|
      queue.push(child_node)
    end
  end

  nil
end


def build_tree
  root = tree = Tree::TreeNode.new("root", "root")
  5.times do |i|
    tree << Tree::TreeNode.new("root_#{i}a", i)
    tree << Tree::TreeNode.new("root_#{i}b", i*33)
    tree = tree.children.last
  end

  root
end

tree = build_tree()

found_node = depth_first(tree, 4)
puts found_node

