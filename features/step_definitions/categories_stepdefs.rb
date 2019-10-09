Given("I am on the categories page") do
  visit 'categories/index'
end

When("I clicked on {string} link") do |link|
  click_on link
end

