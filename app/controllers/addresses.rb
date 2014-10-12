# creates addresses
get '/contacts/:id/addresses/new' do
  @contact = Contact.find(params[:id])
  @address = Address.new
  erb :'addresses/new'
end

post '/contacts/:id/addresses' do
  @contact = Contact.find(params[:id])
  @address = Address.create(params[:address])
  redirect '/contacts'
end

#edits addresses
get '/contacts/:id/addresses/:address_id/edit' do 
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:address_id])
  erb :'addresses/edit'
end

put '/contacts/:id/addresses/:address_id' do
  contact = Contact.find(params[:id])
  address = Address.find(params[:address_id])
  address.update(params[:address])
  redirect '/contacts/index'
end