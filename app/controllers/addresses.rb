post '/contacts/:id/addresses' do
	@contact = Contact.find_by(id: params[:id])
	@address = Address.create!(street: params[:address][:street],
							   city: params[:address][:city],
							   state: params[:address][:state],
							   zip: params[:address][:zip],
							   contact_id: @contact.id)

	redirect '/contacts/' + (params[:id])
end

get '/contacts/:contact_id/addresses/:address_id/edit' do
  @contact = Contact.find_by(id: params[:contact_id])
  @address = Address.find_by(id: params[:address_id])

  erb :'addresses/edit'
end

put '/contacts/:contact_id/addresses/:address_id' do
  @contact = Contact.find_by(id: params[:contact_id])
  @address = Address.find_by(id: params[:address_id])
  @address.update_attributes(street: params[:address][:street],
							   city: params[:address][:city],
							   state: params[:address][:state],
							   zip: params[:address][:zip])

  redirect '/contacts/' + (params[:contact_id])
end

delete '/contacts/:contact_id/addresses/:address_id' do
  @address = Address.find_by(id: params[:address_id])
  @address.destroy

  redirect '/contacts/' + (params[:contact_id])
end