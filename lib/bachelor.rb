require 'pry'
require 'json'
bachelor_file = File.read('spec/fixtures/contestants.json')
bachelor_hash = JSON.parse(bachelor_file)

def all_contestants(data)
  data.values.flatten
end

def get_first_name_of_season_winner(data, season)
  # code here
  (
    data[season].find do | contestant_hash |
      contestant_hash["status"] = "Winner"
    end
  )["name"].split(" ")[0]
end

def get_contestant_name(data, occupation) 
  # code here
  (
    all_contestants(data).find do | contestant_hash |
      contestant_hash["occupation"] == occupation
    end
  )["name"]  
end

def count_contestants_by_hometown(data, hometown)
  # code here
  (
    all_contestants(data).filter do | contestant_hash |
      contestant_hash["hometown"] == hometown
    end
  ).length
end

def get_occupation(data, hometown)
  # code here
  (
    all_contestants(data).find do | contestant_hash |
      contestant_hash["hometown"] == hometown
    end
  )["occupation"]  
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

def get_average_age_for_season_redux(data, season) 
  (
    (
      data[season].map do | contestant_hash | # data[season] is an array of hashes
        contestant_hash["age"].to_f           # map returns array w/ same # of elements
      end
    ).sum / data[season].length
  ).round
end

