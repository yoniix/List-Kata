class DdoublyLinkedList	
	 Node = Struct.new(:data, :next,:prev)

	attr_accessor :root,:tail
	def initialize()
		@root = nil
		@tail = nil
	end
	def add(data)
		new_node = Node.new(data)
		new_node.next = nil
		if @root.nil?
			@root =@tail = new_node	
		else
			@tail.next = new_node
			@tail= new_node
		end
				
	end

	def delete(data)
		return nil unless @root		
		node_to_delete = find (data)
		return nill unless node_to_delete
		if node_to_delete ==@root
			@root = node_to_delete.next
			node_to_delete.prev=@root
		elsif node_to_delete ==@tail
			@tail = node_to_delete.prev  
			node_to_delete.prev.next=null
		else	
			node_to_delete.prev.next = node_to_delete.next
			node_to_delete.next.prev = node_to_delete.prev 
		end	
	end

	def find(data)
		return nil unless @root
		current_node = @root		
		while (current_node.data!=data)		
			current_node=current_node.next
			break if current_node.nil?			
		end
		return current_node
	end

	def values()
		values = []		
		return values unless @root
		current_node =@root
		while (current_node)	
			values << current_node.data		
			current_node =current_node.next
		end
		values
	end

	def each
	  	current_node = @root
		while (current_node)
			yield current_node.value
			current_node =current_node.next
		end	 	
	end 	
end
