###############################################
# To show output:
# 1. open terminal ---- bin/serve
# 2. open chrome ---- http://127.0.01:3000
###############################################

# get '/' do
#     File.read(File.join('app/views', 'index.erb'))
#     erb(:index)
# end

#  def get_humanized_time_ago (time_ago_in_minutes)
#     if time_ago_in_minutes >= 60
#         "#{time_ago_in_minutes/60} hours ago"

#     else
#         "#{time_ago_in_minutes} minutes ago"
#     end
# end
# # get '/' do
# #   "Hello world!"
# # end

# get '/' do
#     @finstagram_post_shark = {
#     username: "sharky_j",
#     avatar_url: "http://naserca.com/images/sharky_j.jpg",
#     photo_url: "http://naserca.com/images/shark.jpg",
#     get_humanized_time_ago: get_humanized_time_ago(15),
#     like_count: 0,
#     comment_count: 1,
#     comments: [{
#         username: "sharky_j",
#         text:"Out for the long weekend... too embarrassed to show y'all the beach body"
#     }]
#     }

#   @finstagram_post_whale = {
#     username: "kirk_whalum",
#     avatar_url: "http://naserca.com/images/kirk_whalum.jpg",
#     photo_url: "http://naserca.com/images/whale.jpg",
#     get_humanized_time_ago: get_humanized_time_ago(65),
#     like_count: 0,
#     comment_count: 1,
#     comments: [{
#         username: "kirk_whalum",
#         text: "#weekendvibes"
#     }]
#     }

#   @finstagram_post_marlin = {
#     username: "marlin_peppa",
#     avatar_url: "http://naserca.com/images/marlin_peppa.jpg",
#     photo_url: "http://naserca.com/images/marlin.jpg",
#     get_humanized_time_ago: get_humanized_time_ago(190),
#     like_count: 1,
#     comments: [{
#         username: "marlin_peppa",
#         text: "Shawerma Palace time! ;)"
#     }]
#     }

    # [@finstagram_post_shark, @finstagram_post_whale, @finstagram_post_marlin].to_s
    

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

# @finstagram_posts=[@finstagram_post_shark, @finstagram_post_whale, @finstagram_post_marlin]


helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end
end

get '/' do
    @finstagram_posts = FinstagramPost.order(created_at: :desc)
    erb(:index)
end


get '/login' do
  erb(:login)
end

post '/login' do
  username = params[:username]
  password = params[:password]

  @user = User.find_by(username: username)

  if @user && @user.password == password
    session[:user_id] = @user.id
    redirect to('/')

  else
    @error_message = "Login failed."
    erb(:login)
  end
end


get '/logout' do
  session[:user_id] = nil
  redirect to('/')
end


get '/signup' do
  @user=User.new
  erb(:signup)
end


post '/signup' do
  email      = params[:email]
  avatar_url = params[:avatar_url]
  username   = params[:username]
  password   = params[:password]

@user=User.new({email:email, avatar_url:avatar_url, username:username, password:password})

if @user.save
  redirect to('/login')

else
    erb(:signup)
  end
end 

get '/finstagram_posts/new' do
  @finstagram_post = FinstagramPost.new
  erb(:"finstagram_posts/new")
end

post '/finstagram_posts' do
  photo_url = params[:photo_url]

  @finstagram_post = FinstagramPost.new({ photo_url: photo_url, user_id: current_user.id })

  if @finstagram_post.save
    redirect(to('/'))
  else
    erb(:"finstagram_posts/new")
  end
end

get '/finstagram_posts/:id' do
  @finstagram_post = FinstagramPost.find(params[:id])
  erb(:"finstagram_posts/show")
end

