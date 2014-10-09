get '/contacts/:contact_id/addresses/new' do 
	@contact = Contact.find(params[:contact_id])

	erb :"addresses/new"
end	

post '/contacts/:contact_id/addresses' do 
	@contact = Contact.find(params[:contact_id])
	@address = Address.create(params[:address])
	@address.update_attributes(contact: @contact)
	@address.save

	redirect to "/contacts/#{params[:contact_id]}"
end

get '/contacts/:contact_id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:contact_id])
  @address = Address.find(params[:address_id])

  erb :"addresses/edit"
end

put '/contacts/:contact_id/addresses/:address_id' do
  @contact = Contact.find(params[:contact_id])
  @address = Address.find(params[:address_id])
  @address.update_attributes(params[:address])
  @address.save

	redirect to "/contacts/#{params[:contact_id]}"
end