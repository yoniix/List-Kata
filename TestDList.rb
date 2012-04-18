#!/usr/bin/env ruby

require 'minitest/autorun'
require './DList'

class TestDList < MiniTest::Unit::TestCase

	attr_accessor :list
	def setup
		@list =  DdoublyLinkedList.new()
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

