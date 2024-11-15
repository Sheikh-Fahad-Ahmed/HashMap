class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if head.nil?
      self.head = new_node
      self.tail = new_node
    else
      temp = head
      temp = temp.next_node until temp.next_node.nil?
      temp.next_node = new_node
      self.tail = new_node
    end
    self.size += 1
    true
  end

  def pop
    return 'list is empty' if head.nil?

    if size == 1
      temp = head
      self.head = nil
      self.tail = nil
    else
      temp = head
      temp = temp.next_node until temp.next_node == tail
      self.tail = temp
      temp = temp.next_node
      tail.next_node = nil
    end
    self.size -= 1
    puts temp.value
  end

  def to_s
    temp = head
    until temp.nil?
      print "( #{temp.value} ) -> "
      temp = temp.next_node
    end
    'nil'
  end

end