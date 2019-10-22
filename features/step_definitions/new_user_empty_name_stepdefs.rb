Given("I am on the new user page, with an empty name, with link {string}") do |string|
  puts string
  visit(string)
end

When("I fill in, with an empty name {string}, {string} and {string} and press {string}") do |string, string2, string3, string4|
	fill_in('user_name', :with => string)
	fill_in('user_email', :with => string2)
	fill_in('user_password', :with => string3)
	fill_in('user_password_confirmation', :with => string3)
	click_button(string4)
end	

Then("I see, with an empty name, the message {string}") do |string|
  expect(page).to have_content(string)
end
