get '/contacts/:id/addresses/new' do
	@contact = Contact.find(params[:id])
	@address = Address.new(params[:address])
	erb :"addresses/new"
end

post '/contacts/:id/addresses' do
	@contact = Contact.find(params[:id])
	@address = Address.create!(params[:address])
	@contact.addresses << @address
	erb :'contacts/show'	
end

get '/contacts/:contact_id/addresses/:address_id/edit' do
	@contact = Contact.find(params[:contact_id])
	@address = Address.find(params[:address_id])
	erb :"addresses/edit"
end

post '/contacts/:contact_id/addresses/:address_id' do
	@contact = Contact.find(params[:contact_id])
	@address = Address.find(params[:address_id])
	@address.update_attributes(params[:address])
	erb :'contacts/show'	
end