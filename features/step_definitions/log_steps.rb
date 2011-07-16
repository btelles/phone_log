
When /^I delete the (\d+)(?:st|nd|rd|th) log$/ do |pos|
  visit logs_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following logs:$/ do |expected_logs_table|
  expected_logs_table.diff!(tableish('table tr', 'td,th'))
end
