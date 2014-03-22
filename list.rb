require_relative "task"

class List
  attr_reader :title, :tasks

  def initialize(title, tasks = [])
    raise ArgumentError, "Title must be a string" unless title.class == String
    raise ArgumentError, "Tasks must be an array" unless tasks.class == Array
    
    @title = title
    @tasks = tasks
  end

  def add_task(task)
    task_obj = Task.new(task)
    tasks << task_obj
  end

  def complete_task(index)
    tasks[index].complete!
  end

  def delete_task(index)
    tasks.delete_at(index)
  end

  def completed_tasks
    tasks.select { |task| task.complete? }
  end

  def incomplete_tasks
    tasks.select { |task| !task.complete? }
  end
end