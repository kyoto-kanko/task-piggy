require 'thor'
require 'csv'
require 'io/console'

class TodoCLI < Thor
  desc 'create TASK', '新しいタスクを作成'
  TodoCLI.start(ARGV)
  def oink
    puts '今からタスクの計測を開始します。'
    start_time = Time.now
    STDIN.echo = false
    STDIN.raw!
    begin
      loop do
        elapsed_time = Time.now - start_time
        print "\r経過時間: #{elapsed_time.round(2)}秒"
        break if IO.select([STDIN], [], [], 0.1)
      end
    ensure
      STDIN.echo = true
      STDIN.cooked!
    end
    puts "\nタスク計測を終了しました。"
  end
end
TodoCLI.start(ARGV)
