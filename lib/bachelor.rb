require 'pry'
def find_season_winner(data, season) # helper function for get_first_name_of_season_winner
  data[season].find do | contestant_hash |
    contestant_hash["status"] == "Winner"
  end
end

def get_first_name_of_season_winner(data, season)
  # code here
  find_season_winner(data, season)["name"].split(" ")[0]
end

def all_contestants(data) # remember to refactor this later -- ask someone how
  list_of_contestants = []
  data.each do | season, contestant_array |
    contestant_array.each do | contestant_hash |
      list_of_contestants.push(contestant_hash)
    end
  end
  list_of_contestants
end

def get_contestant_name(data, occupation) # what if more than one contestant shares the same occupation?
  # code here
  (
    all_contestants(data).find do | contestant_hash |
      contestant_hash["occupation"] == occupation
    end
  )["name"] # this syntax is so ugly!!!
end

def count_contestants_by_hometown(data, hometown)
  # code here
  (
    all_contestants(data).filter do | contestant_hash |
      contestant_hash["hometown"] == hometown
    end
  ).length
end

def find_first_from_hometown(data, hometown) # helper function for get_occupation
  all_contestants(data).find do | contestant_hash |
    contestant_hash["hometown"] == hometown
  end
end

def get_occupation(data, hometown)
  # code here
  find_first_from_hometown(data, hometown)["occupation"]
end

def get_average_age_for_season(data, season)
  # code here
  counter = 0.0
  (
    (
      data[season].reduce(0.0) do | sum, contestant_hash |
        counter += 1.0
        sum += contestant_hash["age"].to_f
      end
    ) / counter
  ).round
end