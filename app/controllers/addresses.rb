get '/contacts/:contact_id/addresses/new' do
  @contact = Contact.find(params[:contact_id])
  @address = Address.new
  erb :'addresses/new'
end

post '/contacts/:contact_id/addresses' do
  @contact = Contact.find(params[:contact_id])
  new_address = params[:address]
  @contact.addresses << Address.create(street: new_address[:street], city: new_address[:city], state: new_address[:state], zip: new_address[:zip])
  @contact.save
  redirect ('/contacts/' + params[:contact_id])
end

get '/contacts/:contact_id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:contact_id])
  @address = Address.find(params[:address_id])
  erb :'addresses/edit'
end

put '/contacts/:contact_id/addresses/:address_id' do
  @address = Address.find(params[:address_id])
  new_address = params[:address]

  @address.update_attributes(street: new_address[:street], city: new_address[:city], state: new_address[:state], zip: new_address[:zip])
  redirect ('/contacts/' + params[:contact_id])
end

delete '/contacts/:contact_id/addresses/:address_id' do
  @address = Address.find(params[:address_id])
  @address.destroy
  redirect ('/contacts/' + params[:contact_id])
end