require "rspec"

require_relative "list"
require_relative "task"

describe List do
  let(:title) { "Things to do"}
  let(:task) { [Task.new("travel") ] }
  let(:empty_list) { List.new(title) }
  let(:list) { List.new(title, task) }

  describe "#initialize" do
  	it "takes a title for its first argument" do
  		List.new("Things to buy").should be_an_instance_of List
  	end

  	it "takes tasks array for second argument" do
  		List.new("things to pack", [Task.new("luggage")] ).should be_an_instance_of List
  	end

  	it "first argument must be a string" do 
  		expect { List.new(1).to raise_error(ArgumentError) }
  	end

  	it "second argument must be an array" do 
  		expect { List.new("Things to pack", "luggage") }.to raise_error(ArgumentError)
  	end

  	it "requires at least one argument" do
  		expect { List.new }.to raise_error(ArgumentError)
  	end
  end

  describe "#title" do
  	it "returns correct description for the list" do 
  		list.title.should eq title
  		empty_list.title.should eq title
  	end
  end

  describe "#tasks" do
  	it "returns empty tasks array if task is not given" do
  		empty_list.tasks.should eq []
  	end

  	it "returns correct task if task is given" do
  		list.tasks.should eq task
  	end
  end

  describe "#add_task" do
  	let(:new_task) { "do grocery" }

  	before(:each) do
  		list.add_task(new_task)
  	end
  	
  	it "adds task object to array" do 	
  		list.tasks.last.should be_an_instance_of Task
  	end	

  	it "returns correct task" do
  		list.tasks.last.description.should eq new_task
  	end
  end

end





