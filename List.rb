#!/usr/bin/env ruby
require 'minitest/autorun'
class  MyList 
	
	 Node = Struct.new(:data, :next)

	attr_accessor :root,:tail
	def initialize()
		@root = nil
		@tail = nil
	end
	def add(data)
		new_node = Node.new(data)

		if @root.nil?
			@root =@tail = new_node	
		else
			@tail.next = new_node
			@tail= new_node
		end
				
	end
	def delete(data)
		return nil unless @root
		current_node = @root
		prev_node = @root
		while (current_node.data!=data)
			prev_node=current_node
			current_node = current_node.next 
			break if current_node.nil?	
		end		
		
		unless current_node.nil? && prev_node.nil?
			prev_node.next = current_node.next
			@root = current_node.next if  @root == current_node
			@tail = prev_node  if @tail = current_node
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


class TestMyList < MiniTest::Unit::TestCase

	attr_accessor :list
	def setup
		@list = MyList.new()	
	end
	def teardown

	end
	def test_nil()
		assert_nil @list.root
		assert_nil @list.tail
		assert_nil @list.find('fred')
		assert_equal @list.values,[]
	end

	def test_add
		@list.add('fred')
		assert_equal @list.find('fred').data, 'fred'
	end

	def test_find
		@list.add('fred')
		@list.add('max')
		assert_equal @list.find('max').data, 'max'
	end

	def test_delete		
		@list.add('max')
		@list.add('fred')
		@list.delete('max')
		assert_equal @list.find('max'), nil
	end
	def test_values
		@list.add('fred')
		@list.add('wilma')
		@list.add('betty')
		@list.add('barney')
		assert_equal ['fred','wilma','betty','barney'], @list.values
	end
	def test_each
		@list.add('fred')
		@list.add('wilma')
		@list.add('barney')
		assert_equal ['fred','wilma','barney'], @list.values.map {|e| e}
	end 
end


