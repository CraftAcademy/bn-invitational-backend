Given("I am on the {string} page") do |page_name|
  visit page_path(page_name)
end

When("I click {string} button") do |button_name|
  click_link_or_button button_name
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
  attach_file('athlete_image', "#{::Rails.root}/spec/fixtures/dummy_image.jpg")
end

When("show me the page") do
  save_and_open_page
end

def page_path(path)
  if path == 'Dashboard'
    root_path
  elsif path == 'Create Athlete'
    new_athlete_path
  else
    raise "You need to add #{path} to page_path function"
  end
end
