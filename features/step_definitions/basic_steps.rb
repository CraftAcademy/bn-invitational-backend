Given("I am on the {string} page") do |page_name|
  visit page_path(page_name)
end

When("I click {string} button") do |button_name|
  click_button_or_link button_name
end

Then("I should be on the {string} page") do |page_name|
  expect(page.current_path).to eq page_path(page_name)
end

When("I fill in {string} with {string}") do |field, input|
  fill_in(field, with: input)
end

Then("I should see {string}") do |message|
  expect(page).to have_content message
end

And(/^I attach a file$/) do
  attach_file('article_image', "#{::Rails.root}/spec/fixtures/dummy_image.jpg")
end

def page_path(path)
  if path == 'Dashboard'
    root_path
  elsif path == 'Create Athlete'

  else
    raise "You need to add #{path} to page_path function"
  end
end
