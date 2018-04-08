
Given("the following athlete exists:") do |table|
  table.hashes.each do |athlete|
    create(:athlete, name: athlete[:name])
    find_athlete = Athlete.find_by(name: athlete[:name])
    create(:result, athlete: find_athlete,
                  score: athlete[:score],
                  number_of_votes: athlete[:votes],
                  valid_score:athlete[:valid_score])
  end
end
