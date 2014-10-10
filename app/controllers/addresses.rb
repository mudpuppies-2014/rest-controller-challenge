get '/contacts/:id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:id])
  @address = @contact.addresses.find(params[:address_id])
  erb :'addresses/edit'
end

post '/contacts/:id/addresses/:address_id' do
  @contact = Contact.find(params[:id])
  @address = Address.find_by("id = #{params[:address_id]}")
  @address.update_attributes(params[:address])
  redirect "/contacts/#{params[:id]}"
end

get '/contacts/:id/addresses' do
  @addresses = Address.all
  erb :'contacts/show'
end

get '/contacts/:id/addresses/new' do
  @address = Address.new(contact_id: params[:id])
  @contact = Contact.find_by("id = #{params[:id]}")
  erb :'addresses/new'
end

post '/contacts/:id/addresses' do
  new_address = Address.create!(params[:address])
  new_address.update_attributes(contact_id: params[:id])
  redirect "/contacts/#{params[:id]}"
end

post '/contacts/:id/addresses/:address_id/delete' do
  @address = Address.find_by("id = #{params[:address_id]}")
  @address.destroy
  redirect "/contacts/#{params[:id]}"
end