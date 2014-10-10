# get "/contacts" do
# 	@contacts = Contact.all
# 	erb :"contacts/index"
# end

# post "/contacts"
# 	@contact = Contact.create!(params[:contact])
# 	erb :"contacts/new"
# end

# post ""

get '/' do
	erb :"index"
	# redirect '/contacts'
end

get '/contacts' do
  @contacts = Contact.all
  erb :"contacts/index"
end

get '/contacts/new' do
	@contact = Contact.new
  erb :"contacts/new"
end

post '/contacts' do
  @contact = Contact.create!(params[:contact])
  erb :"contacts/new"
  redirect "/contacts"
end

get '/contacts/:id' do
	@contact = Contact.find(params[:id])
	erb :"contacts/show"
end

get '/contacts/:id/edit' do
	@contact = Contact.find(params[:id])
	erb :"contacts/edit"
end

post '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.update_attributes(params[:contact])
  erb :"contacts/show"
end

delete '/contacts/:id' do
	@contact = Contact.find(params[:id])
	@contact.destroy
	redirect '/'

end



