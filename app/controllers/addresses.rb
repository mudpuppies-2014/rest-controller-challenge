get "/contacts/:contact_id/addresses" do
  @contact = Contact.find(params[:contact_id])
  erb :'contacts/show'
end

get '/contacts/:id/addresses/new' do
  @contact = Contact.find(params[:id])
  @address = @contact.addresses[0]
  erb :'addresses/new'
end

get '/contacts/:contact_id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:contact_id])
  @address = Address.find(params[:address_id]) #@contact.addresses[0]
  erb :'addresses/edit'
end

post "/contacts/:contact_id/addresses" do
  @contact = Contact.find(params[:contact_id])
  @contact.addresses[0].update_attributes!(params[:address])
  erb :'contacts/show'
end

put "/contacts/:contact_id/addresses/:address_id" do
  address = Address.find(params[:address_id])
  address.update_attributes(params[:address])
  redirect "/contacts/#{params[:contact_id]}/addresses"
end

delete "/contacts/:contact_id/addresses/:address_id" do
  address = Address.find(params[:address_id])
  address.delete
  redirect "/contacts/#{params[:contact_id]}/addresses"
end
