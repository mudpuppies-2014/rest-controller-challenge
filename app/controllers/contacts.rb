get '/' do
	@contacts = Contact.all
  erb :"contacts/index"
end

get '/contacts' do
	@contacts = Contact.all
  erb :"contacts/index"
end

post '/contacts' do
	@contact = Contact.new(params[:contact])
	if @contact.save
		redirect '/'
	else 
	  erb :"contacts/new"
	  @contact
	end
end

get '/contacts/new' do
  @contact = Contact.new
  erb :"contacts/new"
end

get '/contacts/:id' do
	@contact = Contact.find(params[:id])
	erb :'contacts/show'	
end

post '/contacts/:id' do
	@contact = Contact.find(params[:id])
	@contact.update_attributes(params[:contact])
	erb :'contacts/show'
end

get '/contacts/:id/edit' do
	if Contact.find(params[:id])
		@contact = Contact.find(params[:id])
		erb :"contacts/edit"
	else
		redirect '/'
	end
end

delete '/contacts/:id' do
	if Contact.find(params[:id])
		@contact = Contact.destroy(params[:id])
		redirect '/'
	else 
		redirect '/'
	end
end