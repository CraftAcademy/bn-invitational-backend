
Given("the following athlete exists with these results:") do |table|
  table.hashes.each do |athlete|
    create(:athlete, name: athlete[:name])
    find_athlete = Athlete.find_by(name: athlete[:name])
    create(:result, athlete: find_athlete,
                  score: athlete[:score],
                  numberofvotes: athlete[:votes],
                  validscore:athlete[:validscore])
  end
end
