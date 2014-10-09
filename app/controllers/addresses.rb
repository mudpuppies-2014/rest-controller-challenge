get '/contacts/:user_id/addresses/new' do
  @contact = Contact.find(params[:user_id])
  @address = Address.new
  erb :"addresses/new"
end

post '/contacts/:user_id/addresses' do
  @contact = Contact.find(params[:user_id])
  address_info = params[:address]
  @contact.addresses << Address.create(address_info)
  redirect to "/contacts/#{@contact.id}"
end

get '/contacts/:user_id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:user_id])
  @address = Address.find(params[:address_id])
  erb :"addresses/edit"
end

put '/contacts/:user_id/addresses/:address_id' do
  @contact = Contact.find(params[:user_id])
  @address = Address.find(params[:address_id])
  @address.update_attributes(params[:address])
  redirect to "/contacts/#{@contact.id}"
end

delete '/contacts/:user_id/addresses/:address_id' do
  @contact = Contact.find(params[:user_id])
  @address = Address.find(params[:address_id])
  @address.delete
  redirect to "/contacts"
end
