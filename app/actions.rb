###############################################
# To show output:
# 1. open terminal ---- bin/serve
# 2. open chrome ---- http://127.0.01:3000
###############################################

get '/' do
    File.read(File.join('app/views', 'index.erb'))
    erb(:index)
end

 def get_humanized_time_ago (time_ago_in_minutes)
    if time_ago_in_minutes >= 60
        "#{time_ago_in_minutes/60} hours ago"

    else
        "#{time_ago_in_minutes} minutes ago"
    end
end
# get '/' do
#   "Hello world!"
# end

def get_humanized_time_ago (time_ago_in_minutes)
    if time_ago_in_minutes >= 60
        "#{time_ago_in_minutes/60} hours ago"

    else
        "#{time_ago_in_minutes} minutes ago"
    end
end

get '/' do
    finstagram_post_shark = {
    username: "sharky_j",
    avatar_url: "http://naserca.com/images/sharky_j.jpg",
    photo_url: "http://naserca.com/images/shark.jpg",
    get_humanized_time_ago: get_humanized_time_ago(15),
    like_count: 0,
    comment_count: 1,
    comments: [{
        username: "sharky_j",
        text:"Out for the long weekend... too embarrassed to show y'all the beach body"
    }]
    }

    finstagram_post_whale = {
}

  finstagram_post_whale = {
    username: "kirk_whalum",
    avatar_url: "http://naserca.com/images/kirk_whalum.jpg",
    photo_url: "http://naserca.com/images/whale.jpg",
    get_humanized_time_ago: get_humanized_time_ago(65),
    like_count: 0,
    comment_count: 1,
    comments: [{
<<<<<<< HEAD
        username: "kirk_whalum",
        text: "#weekendvibes"
    }]
    }

    finstagram_post_marlin = {
=======
      username: "kirk_whalum",
      text: "#weekendvibes"
    }]
  }

  finstagram_post_marlin = {
>>>>>>> a013f0b11c066b1d67df2728e86dd0e082c7c1fa
    username: "marlin_peppa",
    avatar_url: "http://naserca.com/images/marlin_peppa.jpg",
    photo_url: "http://naserca.com/images/marlin.jpg",
    get_humanized_time_ago: get_humanized_time_ago(190),
    like_count: 1,
    comments: [{
        username: "marlin_peppa",
        text: "Shawerma Palace time! ;)"
    }]
<<<<<<< HEAD
    }

    posts_array = [finstagram_post_shark, finstagram_post_whale, finstagram_post_marlin]
    posts_array.to_s

# (1..100).each do |num|
#     if num % 3 == 0 && num % 5 == 0
#         puts  "FIZZBUZZ"
#     elsif num % 3 == 0
#         puts  "FIZZ"

#     elsif num % 5 == 0
#         puts "BUZZ"
#     else
#         puts num
#     end
# end

=======
  }

posts_array = [finstagram_post_shark, finstagram_post_whale, finstagram_post_marlin]
posts_array.to_s

end
>>>>>>> a013f0b11c066b1d67df2728e86dd0e082c7c1fa
