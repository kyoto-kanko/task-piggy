#!/usr/bin/env ruby
require 'thor'
require 'csv'
require 'time'

class TodoCLI < Thor
  desc 'build TaskPiggy', 'タスク管理アプリの起動'
  def new
    return puts 'TaskPiggy is already running.' if File.exist?('TaskList.csv')

    aa = "Lets task saving\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM'''''=TMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMB=....~...~..?TMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM#~..~.~~.~.._(+-_(WMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMME<.__.~-(+-_~(z~1lx_MMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM#;<._z>.1v~?l+(l-~(t<(MMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMD;!..(O-(z-.(l<(1lz<_JMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMD><~~.1z_?zll<_.....-MMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN+;<.._1z~..~~..~~._uMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN+><_.__.~..~~...(dMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNe<>><--__~.._(+MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNg&u&&&+gMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWB9''=~~~~~~~~~~~~~~:77TBWMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMB'><~~~~~~~~~~~~-((JJJ+a&gaQ+-~~~~~~?THMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM5<~~~_~~_~~~~~((JgXkkHkbkHH9WUUYT=~~~~~~~~~~?WMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMS+~~~~7HMMMMMM=~~~~~~~~~~~~~_~(WkkHYYC<<~~~~~~~~~~~~~~~:~~~~~~~_7WMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMM8ttl_~~~~~?=<~~~~~~~~~~~~~~_++-~~~~~~~~~~~~~~~~~~~~~~~~~~~~:~~~~~~~?WMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMM#ttttI_~~~~~~~~~~~~~~~~~~((+~~?11-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~(HMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMEtttttz_~~~~~~~~~~~~~:~(Jttt:~~~?11-~~:~~:~~~~~:~~~~~~~~~~:~~~~~~~~~~~~~?MMMMMMMMMMM\nMMMMMMMMMMMMMMMM6ttOltll~~~~~~~~~~~~~~(zrttrO_~~~~(11_~~~~~~~~~~~~~~~~~~~~~~~:~:~~:~~~~~~?MMMMMMMMMM\nMMMMMMMMMMMMMMM#lvz+<<<~~~~~~~~~~:~~~(tttttttc~~~~~~<l+~~~~~:~~~~~~~~~:~~~~~~~~~~~~~~:~~~~JMMMMMMMMM\nMMMMMMMMMMMMMM#:~~~~~~~~~~~~~~~~~~~~_ttttttttI~~~~~~~<=<~~:~~~~~~~~:~~~~~~~:~~~~~~~~~~~~~~~JMMMMMMMM\nMMMMMMMMMMMMMF~~~~~~~~~~~~~~~:~~~~~~~?+ztttttO_~~:~~~~~<~~~~~~:~~:~~~~~~~~~~~~~~~~~~~~~::~~~dMMMMMMM\nMMMMMMMMMMMM5~~~~~~~~~~~~~~~~~:~:~~~~~~~_?1OtO>~~~~~~~~~~:~:~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~(MMMMMMM\nMMMMMMMMMMM#~~~~~~~~~~~:~~:~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:~~:~~~~~~~:~~~~~~~~:~:~~~~~~~~~~dMMMMMM\nMMMMMMMMMMM:~~~~~~~::~~~~~~~~:~~~~~~~~~~~~:~~~~~~~:~~~~~~~~~~~~~~~:~~~:~~:~~~~~~~~~~~~~~~:~~~~(THMMM\nMMMMMMMMMM$~~~~:~~~~~:~~:~~~~~~~~:~:~~::~~:~~_~~~~~~~~~~~:~:~~~~~~~~~~~~~~:~~~~~~~~~:~~~~~~~~~~~~?MM\nMMMMMMMMM#~~~:~~~~~~~~~~~:~~~~~:~~~~:~~:~~~~~~~~~~~~~~~~~~~~~~~:~~~~~~~~~~~~:~~~~~:~~:~~~~~~~(MMMMMM\nMMMMMMMMM<~~~~~:~~:~~~:~~~~~~:~~~~:~~~~~~~~~~~~~~~:~:~~~~~~~:~~~~~:~~~~~~~~~~~~~~~~~~~~~~~~~~(MMMMMM\nMMMMMMMM#~:~~(MHN/~:~~~~~~~~~~~~~:~~~~~~~~:~~~~~~~~~~:~~~:~~~~~~~~~~~:~~~~~~~~~~:~~~~~~~~:~~~(MMMMMM\nMMMMMMMMr~~~~?MHM3~~:~~~~~~~~~~(JJ,~~:_~~~~~~~~~~:~~~~~~~~:~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~JMMMMMM\nMMMMMMMM[~~~~~~~~~~~~:~~:~~:~~J#HH#~~~~~~~~~~~~~~~~~~~~~:~~~~~~:~~~~~~~~~~~~:~~~~~~~~~~~~~:~~(MMMMMM\nMMMMMMMM$__`   ```_~~~:~~~~:~~_?T=~:~~~~~~~~~:~~~~~~~~~~~~~~::~:~~~~~~~~::~~~~~~~~~~~~~~~~~~~dMMMMMM\nMMMMMMB!`````` ` ` `  __~~~~~~~~~~~~~~:~~:~~~~~~:~~~~~~~~~~~~~~~~~::~~~~~~~~~~:~~~~~~~~~:~~~(MMMMMMM\nMMMMB!   `  ` ` ` `````` _~~~~~:~~~~~:~::::::~:~~~~~~~~~:~~~~~~~~:~~~~~~~~:~~~~~~~~~~~~:~~~~jMMMMMMM\nMMM#````.wO,` `` ` .   ` `_~:~~~~~:~_::(;;;;<;:_~~~~~~~:~~~_~~:~:~~~~~~:~~:~~~~~~~~~~:~~:~~(MMMMMMMM\nMMMb    (vwO `  ` wrt{ ` ` _~~:~~:~::;;>>>>>?>>;<:~~~~~~~~~~:~~~~~~~~:~~~~~~~~~:~~:~~_~~~:~(MMMMMMMM\nMMMN` ``,rrO ` `` rrrl `` ` ~~~~~~~~:<>>?>>?>>?>;:~~~~~~~:~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~(MMMMMMMMM\nMMMM2` `.rrI` `   OrrO  ` ` _~~~~~~:::;>>>>>>>;;<~~~~~:~~~~:~~~~~~~:~~~~~~~~:~~~~~~~:~~~~~(MMMMMMMMM\nMMMMMm  `(C!`` `` <rrZ ` `  ~~:~~~~~~~~:::::<<:~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:~~:~~~~~~~dMMMMMMMMM\nMMMMMMNa,`   `` ``` `` `   -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:~~~~~:~~~~~~~~~~~:~~~~~~~~~~~~~(MMMMMMMMMM\nMMMMMMMMMMaJ.,.`  `` `  ..~~~~~~~~~~~~~~~~~:~~~~~~~:~~~~~~~~:~~~~~:~~~~:~~~~~::~~~~(-~~~(MMMMMMMMMMM\nMMMMMMMMMMMMMMMgJ~~~~~~~~_~~~~~~~~~~~~~~:~~~~~~:~~~~~~:~~~~~~~~~~~~:~~:~~~~~~~~~~(MMb~~~JMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMNJ/~~~~~~~~~~:~:~~~~~~~~:~~~~~~~:~~~~~~~~~:~~~~~~~~~~~~~:~~~~(gMMMMMe(jMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMNNeJ-:~:~:~~~~~~~~~~:~~:~:~~~~~~~:~~~:~~~~~~~:~~~~:~~~_(gMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMN;~~~~~~:~::~~~~~~~~~~~~~~~~~~~~~~~~~~:~~~~~~_(JdMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMm~~~~:~(JJ-._~~~:~~~:~~~~~~~~~:~~~~~~~~(((gMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMN_~:~~(MMMMMMMMNNgc~~~~~~(JJJJJ&+ggNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMm_~~(dMMMMMMMMMMMb~~~~:~JMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMNJJMMMMMMMMMMMMMMp~~~~(MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNaJJMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\n"
    aa.size.times do |i|
      sleep 0.001
      print aa[i]
    end

    CSV.open('TaskList.csv', 'wb') do |csv|
      csv << %w[TaskName CreatedAt TimeSpent]
      csv << ["Test", "2024-03-17 20:02:49", 0]
    end
  end

  desc 'create TASK', '新しいタスクを作成'
  def oink(task)
    time = Time.now.getlocal('+09:00').strftime('%Y-%m-%d %H:%M:%S')
    rows = CSV.read('TaskList.csv')
    time_spent = Time.parse(time) - Time.parse(rows.last[1])
    rows.last.push(time_spent.to_i)
    puts "----------------------------Task registered.----------------------------\ntaskName: [#{task}], createdAt: [#{time}]\n------------------------------------------------------------------------"
    CSV.open('TaskList.csv', 'a') do |_csv|
      rows << [task, time]
    end

    CSV.open('TaskList.csv', 'w') do |csv|
      rows.each do |row|
        csv << row
      end
    end
  end

  desc 'index TASK', 'タスク一覧の表示'
  def index
    puts '----------------------------Task List.----------------------------'
    CSV.foreach('TaskList.csv') do |row|
      puts "TaskName: [#{row[0]}], CreatedAt: [#{row[1]}], TimeSpent: [#{SecondToHHMM(row[2].to_i)}]"
    end
    puts '-----------------------------------------------------------------'
  end

  def SecondToHHMM(seconds)
    hours = seconds / 3600
    minutes = (seconds % 3600) / 60
    seconds = (seconds % 3600) % 60
    if seconds.zero?
      'Measuring'
    else
      format('%02d:%02d:%02d', hours, minutes, seconds)

    end
  end
end

TodoCLI.start(ARGV)
