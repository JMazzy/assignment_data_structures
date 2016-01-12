class LinkedList
  attr_accessor :head, :tail

  def initialize(first_node = nil)
    @head = first_node
    @tail = first_node
  end

  def add_first_node(word, definition)
    @head = Node.new(word, definition)
    @tail = @head
  end

  def add_node(word, definition)
    if @head.nil?
      add_first_node(word, definition)
    else
      new_node = Node.new(word, definition)
      @tail.next = new_node
      @tail = new_node
    end
  end

  # This is O(n), in the worst case that index is the last index of the LinkedList.
  def find_node_at(index)
    current_index = 0
    node = @head
    until current_index == index
      puts current_index
      node = node.next
      current_index += 1
    end
    puts "returning node at #{current_index}"
    node
  end

  def insert_node_at(word, definition, index)
    before_node = find_node_at(index-1)
    after_node = before_node.next
    new_node = Node.new(word, definition, after_node)
    before_node.next = new_node
  end
end

Node = Struct.new(:word, :definition, :next)

listy = LinkedList.new
listy.add_node("Baby", "Tiny Baby")
listy.add_node("Grampa", "Old Baby")
listy.add_node("Dragon", "Scaly Baby")

listy.insert_node_at("Chupacabra", "Not A Baby", 1)
