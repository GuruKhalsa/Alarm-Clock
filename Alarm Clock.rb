puts "What time would you like your alarm to go off?"
alarm_time_request = gets.chomp.downcase

until alarm_time_request.match(/(\d+):(\d+)/)
puts "Please enter a valid time (ex. 9:15, 12:05 am, 1:12 pm"
alarm_time_request = gets.chomp.downcase
end

alarm_time_request[/(\d+):(\d+)/]

hour = $1.to_i

if alarm_time_request.include?("pm") && hour < 12 && hour > 0
	hour = $1.to_i + 12
elsif alarm_time_request.include?("am") && hour == 12
	hour = 0		
elsif hour == 24
	hour = 0	
else
	hour = $1.to_i
end

puts hour

am_or_pm = ""

unless alarm_time_request.include?("m")
puts "AM or PM?"
am_or_pm = gets.chomp.downcase
	if am_or_pm.include?("pm") && hour < 12 && hour > 0
		hour = hour + 12
	end
end

puts hour

if [12, 24].include?(hour) && [alarm_time_request, am_or_pm].include?("am")
	hour = 0
end

puts hour

current_time = Time.now
alarm_time = Time.local(2013,9,13, hour,$2,0).to_i

until current_time == alarm_time do
	current_time = Time.now.to_i
end

puts "Alarm"
pid = fork{ exec 'afplay', "./moonlight_theme.mp3" }