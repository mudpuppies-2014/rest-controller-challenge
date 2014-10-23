get '/contacts/:contact_id/addresses/new' do
  @contact = Contact.find(params[:contact_id])
  @address = Address.new
  erb :'addresses/new'
end

post '/contacts/:contact_id/addresses' do
  @contact = Contact.find(params[:contact_id])
  @contact.addresses.create!(params[:address])
  redirect to "/contacts/#{@contact.id}"
end

get '/contacts/:contact_id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:contact_id])
  @address = @contact.addresses.find(params[:address_id])
  erb :'addresses/edit'
end

put '/contacts/:contact_id/addresses/:address_id' do
  @contact = Contact.find(params[:contact_id])
  @address = @contact.addresses.find(params[:address_id])
  @address.update_attributes(params[:address])
  redirect to "/contacts/#{@contact.id}"
end

delete '/contacts/:contact_id/addresses/:address_id' do
  @contact = Contact.find(params[:contact_id])
  @address = @contact.addresses.find(params[:address_id])
  @address.destroy
  redirect to "/contacts/#{@contact.id}"
end
