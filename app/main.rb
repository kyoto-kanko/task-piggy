require 'thor'
require 'csv'

class TodoCLI < Thor
  desc 'create TASK', '新しいタスクを作成'
  def oink(task)
    time = Time.now.getlocal('+09:00').strftime('%Y-%m-%d %H:%M:%S')
    puts "----------------------------Task registered.----------------------------\ntaskName: [#{task}], createdAt: [#{time}]\n------------------------------------------------------------------------"
    CSV.open('todo.csv', 'a') do |csv|
    end
  end
end

TodoCLI.start(ARGV)
