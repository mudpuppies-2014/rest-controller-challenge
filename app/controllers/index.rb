post '/contacts' do
	Contact.create!(params[:contact])
	redirect to '/contacts'
end

get '/contacts' do
	@contacts = Contact.all
	erb :"contacts/index"
end

get '/contacts/new' do
	@contact = Contact.new(name: "", email: "")
	erb :"contacts/new"
end

get '/contacts/:id' do
	@contact = Contact.find(params[:id])
	erb :"contacts/show"
end

delete '/contacts/:id' do
	Contact.find(params[:id]).destroy
	redirect to '/contacts'
end

post '/contacts/:id' do
	@contact = Contact.find(params[:id])
	@contact.update_attributes(params[:contact])
	redirect to "/contacts/#{params[:id]}"
end

get '/contacts/:id/edit' do
	@contact = Contact.find(params[:id])
	erb :"contacts/edit"
end

get '/contacts/:id/addresses/new' do
	@contact = Contact.find(params[:id])
	@address = @contact.addresses.new()
	erb :"addresses/new"
end

post '/contacts/:id/addresses' do
	@contact = Contact.find(params[:id])
	@address = @contact.addresses.create!(params[:address])
	redirect to redirect to "/contacts/#{params[:id]}"
end

post '/contacts/:id/addresses/:address_id' do
	@address = Address.find(params[:address_id])
	@address.update_attributes(params[:address])
	redirect to "/contacts/#{params[:id]}"
end

delete '/contacts/:id/addresses/:address_id' do
	Address.find(params[:address_id]).destroy
	redirect to "/contacts/#{params[:id]}"
end


get '/contacts/:id/addresses/:address_id/edit' do
	@contact = Contact.find(params[:id])
	@address = Address.find(params[:address_id])
	erb :"addresses/edit"
end
