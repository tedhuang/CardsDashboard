
leaderboard_list = ['Ted', 'Joe', 'Edmond', 'Stanley', 'Andrew', 'Jacky', 'Ian', 'David', 'Mitchel', 'Adrian', 'Joseph'] 
list_count = Hash.new({ value: 0 })
curr_pt_1 = 0
curr_pt_2 = 0

# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '2s', :first_in => 0 do |job|
#  send_event('team1pts', {"text":"hello"})
#  send_event('position', {"text":"hello"})
  random_entry = leaderboard_list.sample
  list_count[random_entry] = { label: random_entry, value: (list_count[random_entry][:value] + 1) % 30 }
  
  send_event('leaderboards', { items: list_count.values })
  
  # curr_pt_1 += 3
  # curr_pt_2 += 4
  # send_event('team1pts', { text: curr_pt_1 })
  # send_event('team2pts', { text: curr_pt_2 })
end