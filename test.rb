require 'datey'

30.times do |i|
  date = (Date.today - 15) + i
  print Datey.format(date, :past).date_and_time.ljust(30)
  print Datey.format(date, :future).date_and_time.ljust(30)
  puts
end
