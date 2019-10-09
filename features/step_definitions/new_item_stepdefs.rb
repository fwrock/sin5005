Given("I am on the new {string} page with link {string}") do |page, link|
    visit link
  end

When("I fill in {string} with {string}") do |field, value|
    fill_in(field, :with => value)
end
  
When("I press {string}") do |button|
    click_button(button)
end

Then("I should see the message {string}") do |message|
    page.has_content?(message)
end