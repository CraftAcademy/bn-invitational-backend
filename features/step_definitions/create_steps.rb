
Given("the following athlete exists with these results:") do |table|
  table.hashes.each do |athlete|
    create(:athlete, name: athlete[:name])
    find_athlete = Athlete.find_by(name: athlete[:name])
    create(:result, athlete: find_athlete,
                  score: athlete[:score],
                  number_of_votes: athlete[:votes],
                  valid_score:athlete[:valid_score])
  end
end

Given("the following user exist:") do |table|
  table.hashes.each do |user|
    create(:user, email: user[:email],
                  password: user[:password],
                  password_confirmation: user[:password_confirmation])
  end
end
