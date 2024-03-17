require 'thor'
require 'csv'

class TodoCLI < Thor
  desc 'build TaskPiggy', 'タスク管理アプリの起動'
  def new
    return puts 'TaskPiggy is already running.' if File.exist?('task_list.csv')

    aa = "Lets task saving\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM'''''=TMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMB=....~...~..?TMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM#~..~.~~.~.._(+-_(WMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMME<.__.~-(+-_~(z~1lx_MMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM#;<._z>.1v~?l+(l-~(t<(MMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMD;!..(O-(z-.(l<(1lz<_JMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMD><~~.1z_?zll<_.....-MMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN+;<.._1z~..~~..~~._uMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN+><_.__.~..~~...(dMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNe<>><--__~.._(+MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNg&u&&&+gMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWB9''=~~~~~~~~~~~~~~:77TBWMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMB'><~~~~~~~~~~~~-((JJJ+a&gaQ+-~~~~~~?THMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM5<~~~_~~_~~~~~((JgXkkHkbkHH9WUUYT=~~~~~~~~~~?WMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMS+~~~~7HMMMMMM=~~~~~~~~~~~~~_~(WkkHYYC<<~~~~~~~~~~~~~~~:~~~~~~~_7WMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMM8ttl_~~~~~?=<~~~~~~~~~~~~~~_++-~~~~~~~~~~~~~~~~~~~~~~~~~~~~:~~~~~~~?WMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMM#ttttI_~~~~~~~~~~~~~~~~~~((+~~?11-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~(HMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMEtttttz_~~~~~~~~~~~~~:~(Jttt:~~~?11-~~:~~:~~~~~:~~~~~~~~~~:~~~~~~~~~~~~~?MMMMMMMMMMM\nMMMMMMMMMMMMMMMM6ttOltll~~~~~~~~~~~~~~(zrttrO_~~~~(11_~~~~~~~~~~~~~~~~~~~~~~~:~:~~:~~~~~~?MMMMMMMMMM\nMMMMMMMMMMMMMMM#lvz+<<<~~~~~~~~~~:~~~(tttttttc~~~~~~<l+~~~~~:~~~~~~~~~:~~~~~~~~~~~~~~:~~~~JMMMMMMMMM\nMMMMMMMMMMMMMM#:~~~~~~~~~~~~~~~~~~~~_ttttttttI~~~~~~~<=<~~:~~~~~~~~:~~~~~~~:~~~~~~~~~~~~~~~JMMMMMMMM\nMMMMMMMMMMMMMF~~~~~~~~~~~~~~~:~~~~~~~?+ztttttO_~~:~~~~~<~~~~~~:~~:~~~~~~~~~~~~~~~~~~~~~::~~~dMMMMMMM\nMMMMMMMMMMMM5~~~~~~~~~~~~~~~~~:~:~~~~~~~_?1OtO>~~~~~~~~~~:~:~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~(MMMMMMM\nMMMMMMMMMMM#~~~~~~~~~~~:~~:~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:~~:~~~~~~~:~~~~~~~~:~:~~~~~~~~~~dMMMMMM\nMMMMMMMMMMM:~~~~~~~::~~~~~~~~:~~~~~~~~~~~~:~~~~~~~:~~~~~~~~~~~~~~~:~~~:~~:~~~~~~~~~~~~~~~:~~~~(THMMM\nMMMMMMMMMM$~~~~:~~~~~:~~:~~~~~~~~:~:~~::~~:~~_~~~~~~~~~~~:~:~~~~~~~~~~~~~~:~~~~~~~~~:~~~~~~~~~~~~?MM\nMMMMMMMMM#~~~:~~~~~~~~~~~:~~~~~:~~~~:~~:~~~~~~~~~~~~~~~~~~~~~~~:~~~~~~~~~~~~:~~~~~:~~:~~~~~~~(MMMMMM\nMMMMMMMMM<~~~~~:~~:~~~:~~~~~~:~~~~:~~~~~~~~~~~~~~~:~:~~~~~~~:~~~~~:~~~~~~~~~~~~~~~~~~~~~~~~~~(MMMMMM\nMMMMMMMM#~:~~(MHN/~:~~~~~~~~~~~~~:~~~~~~~~:~~~~~~~~~~:~~~:~~~~~~~~~~~:~~~~~~~~~~:~~~~~~~~:~~~(MMMMMM\nMMMMMMMMr~~~~?MHM3~~:~~~~~~~~~~(JJ,~~:_~~~~~~~~~~:~~~~~~~~:~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~JMMMMMM\nMMMMMMMM[~~~~~~~~~~~~:~~:~~:~~J#HH#~~~~~~~~~~~~~~~~~~~~~:~~~~~~:~~~~~~~~~~~~:~~~~~~~~~~~~~:~~(MMMMMM\nMMMMMMMM$__`   ```_~~~:~~~~:~~_?T=~:~~~~~~~~~:~~~~~~~~~~~~~~::~:~~~~~~~~::~~~~~~~~~~~~~~~~~~~dMMMMMM\nMMMMMMB!`````` ` ` `  __~~~~~~~~~~~~~~:~~:~~~~~~:~~~~~~~~~~~~~~~~~::~~~~~~~~~~:~~~~~~~~~:~~~(MMMMMMM\nMMMMB!   `  ` ` ` `````` _~~~~~:~~~~~:~::::::~:~~~~~~~~~:~~~~~~~~:~~~~~~~~:~~~~~~~~~~~~:~~~~jMMMMMMM\nMMM#````.wO,` `` ` .   ` `_~:~~~~~:~_::(;;;;<;:_~~~~~~~:~~~_~~:~:~~~~~~:~~:~~~~~~~~~~:~~:~~(MMMMMMMM\nMMMb    (vwO `  ` wrt{ ` ` _~~:~~:~::;;>>>>>?>>;<:~~~~~~~~~~:~~~~~~~~:~~~~~~~~~:~~:~~_~~~:~(MMMMMMMM\nMMMN` ``,rrO ` `` rrrl `` ` ~~~~~~~~:<>>?>>?>>?>;:~~~~~~~:~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~(MMMMMMMMM\nMMMM2` `.rrI` `   OrrO  ` ` _~~~~~~:::;>>>>>>>;;<~~~~~:~~~~:~~~~~~~:~~~~~~~~:~~~~~~~:~~~~~(MMMMMMMMM\nMMMMMm  `(C!`` `` <rrZ ` `  ~~:~~~~~~~~:::::<<:~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:~~:~~~~~~~dMMMMMMMMM\nMMMMMMNa,`   `` ``` `` `   -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:~~~~~:~~~~~~~~~~~:~~~~~~~~~~~~~(MMMMMMMMMM\nMMMMMMMMMMaJ.,.`  `` `  ..~~~~~~~~~~~~~~~~~:~~~~~~~:~~~~~~~~:~~~~~:~~~~:~~~~~::~~~~(-~~~(MMMMMMMMMMM\nMMMMMMMMMMMMMMMgJ~~~~~~~~_~~~~~~~~~~~~~~:~~~~~~:~~~~~~:~~~~~~~~~~~~:~~:~~~~~~~~~~(MMb~~~JMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMNJ/~~~~~~~~~~:~:~~~~~~~~:~~~~~~~:~~~~~~~~~:~~~~~~~~~~~~~:~~~~(gMMMMMe(jMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMNNeJ-:~:~:~~~~~~~~~~:~~:~:~~~~~~~:~~~:~~~~~~~:~~~~:~~~_(gMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMN;~~~~~~:~::~~~~~~~~~~~~~~~~~~~~~~~~~~:~~~~~~_(JdMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMm~~~~:~(JJ-._~~~:~~~:~~~~~~~~~:~~~~~~~~(((gMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMN_~:~~(MMMMMMMMNNgc~~~~~~(JJJJJ&+ggNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMm_~~(dMMMMMMMMMMMb~~~~:~JMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMNJJMMMMMMMMMMMMMMp~~~~(MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNaJJMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\n"
    aa.size.times do |i|
      sleep 0.001
      print aa[i]
    end

    CSV.open('task_list.csv', 'wb') do |csv|
      csv << %w[taskName createdAt]
    end
  end

  desc 'create TASK', '新しいタスクを作成'
  def oink(task)
    time = Time.now.getlocal('+09:00').strftime('%Y-%m-%d %H:%M:%S')
    puts "----------------------------Task registered.----------------------------\ntaskName: [#{task}], createdAt: [#{time}]\n------------------------------------------------------------------------"
    CSV.open('task_list.csv', 'a') do |csv|
      csv << %w[taskName createdAt]
      csv << [task, time]
    end
  end

  desc 'index TASK', 'タスク一覧の表示'
  def Index
    puts '----------------------------Task list.----------------------------'
    CSV.foreach('task-list.csv') do |row|
      puts "taskName: [#{row[0]}], createdAt: [#{row[1]}]"
    end
    puts '-----------------------------------------------------------------'
  end
end

TodoCLI.start(ARGV)
