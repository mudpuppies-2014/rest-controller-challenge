get '/contacts' do
	@contacts = Contact.all
	erb :'contacts/index'
end

get '/contacts/new' do
	@contact = Contact.new
	erb :'contacts/new'
end

post '/contacts' do
	Contact.create! params[:contact]
	redirect '/contacts'
end

get '/contacts/:id/edit' do
	@contact = Contact.find params[:id]
	erb :'contacts/edit'
end

get '/contacts/:id' do
	@contact = Contact.find(params[:id])
	erb :'contacts/show'
end

put '/contacts/:id' do
	contact = Contact.find params[:id]
	contact.update_attributes params[:contact]
	redirect '/contacts' 
end

delete '/contacts/:id' do
	contact = Contact.find params[:id]
	contact.destroy
	redirect '/contacts'
end

get '/contacts/:id/addresses/new' do
	@contact = Contact.find(params[:id])
	@address = Address.new
	erb :'addresses/new'
end

post '/contacts/:id/addresses' do
	Contact.find(params[:id]).addresses.create!(params[:address])
	redirect "/contacts/#{params[:id]}"
end

get '/contacts/:id/addresses/:address_id/edit' do
	@contact = Contact.find(params[:id])
	@address = @contact.addresses.find(params[:address_id])
	erb :'/addresses/edit'
end

put '/contacts/:id/addresses/:address_id' do
	Contact.find(params[:id]).addresses.find(params[:address_id]).update_attributes(params[:address])
	redirect "/contacts/#{params[:id]}"
end
