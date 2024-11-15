require_relative 'node'

class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    new_node = Node.new(value)
    if head.nil?
      self.head = new_node
      self.tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
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

  def remove_at(index)
    pop if head.nil?

    temp = at(index - 1)
    prev = temp
    temp = temp.next_node
    prev.next_node = temp.next_node
    temp.next_node = nil
    puts temp.value
    temp
  end

  def at(index)
    return 'empty' if head.nil?

    temp = head
    1.upto(index) { temp = temp.next_node }
    temp
  end

  def contains?(value)
    return 'list is empty' if head.nil?

    temp = head
    loop do
      return puts 'true' if temp.value == value

      temp = temp.next_node
    end
    puts 'false'
  end

  def find_key(key)
    return nil if size < 1

    temp = head
    index = 0
    until temp.next_node.nil?
      return index if temp.value[0] == key

      temp = temp.next_node
      index += 1
    end
    return index if temp.value[0] == key

    nil
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