$tst = Array[]
File.open('test.txt', 'r') do |file|
  (0..11).each do |i|
    $tst[i] = file.readline
  end
end
class Question
  def initialize(start)
    @cust_start = start
  end

  def asking
    print($tst[@cust_start]); puts(''); print($tst[@cust_start + 1]); puts(''); print($tst[@cust_start + 2]); puts(''); puts('Введите 1 или 2')
  end
end
$b = ''
class Answer
  def initialize(answ, nom)
    @cust_answ = answ
    @cust_nom = nom
  end

  def answering
    while (@cust_answ != '1') && (@cust_answ != '2')
      puts('Введите корректное значение')
      puts('Введите 1 или 2')
      @cust_answ = gets.chomp
    end
    $b = $b + 'а' if @cust_answ == '1'
    $b = $b + 'б' if @cust_answ == '2'
    puts "\e[H\e[2J"
  end
end
class String
  def pur1
    "\e[45m#{self}\e[0m"
  end

  def pur2
    "\e[35m#{self}\e[0m"
  end
end
(0..3).each do |i|
  qn = Question.new(i * 3)
  qn.asking
  ans = gets.chomp
  an = Answer.new(ans, $b[i])
  an.answering
end
print 'Итак'
3.times { sleep 0.5; print '. ' }
puts ''
print 'Ваш тип личности'
3.times { sleep 0.5; print '. ' }
puts "\e[H\e[2J"
case $b
when 'аааа' then name = 'Макс Горький'
when 'бббб' then name = 'Гексли'
when 'абаб' then name = 'Гюго'
when 'ббаб' then name = 'Наполеон'
when 'аааб' then name = 'Штирлиц'
when 'ббба' then name = 'Есенин'
when 'баба' then name = 'Бальзак'
when 'бабб' then name = 'Дон Кихот'
when 'аабб' then name = 'Джек Лондон'
when 'ббаа' then name = 'Дюма'
when 'абба' then name = 'Достоевский'
when 'ааба' then name = 'Робеспьер'
when 'аббб' then name = 'Гамлет'
when 'бааа' then name = 'Габен'
when 'бааб' then name = 'Жуков'
when 'абаа' then name = 'Драйзер'
end
3.times do
  puts name.pur1; sleep 0.5; puts "\e[H\e[2J"; puts name.pur2; sleep 0.5; puts "\e[H\e[2J"
end
puts name.pur1
