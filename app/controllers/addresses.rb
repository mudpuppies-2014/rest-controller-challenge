
get '/contacts/:id/addresses/new' do
  @contact = Contact.find(params[:id])
  @address = Address.new
  erb :'addresses/new'
end

post '/contacts/:id/addresses' do
  @contact = Contact.find(params[:id])
  @contact.addresses << Address.create!(params[:address])
  redirect "/contacts/#{params[:id]}"
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
  redirect "/contacts/#{params[:contact_id]}"
end