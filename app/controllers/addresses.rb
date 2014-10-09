
get '/contacts/:id/addresses' do
  if Contact.find(params[:id])
  @contact = Contact.find(params[:id])
  @address = Address.new(params[:address])
  erb :"addresses/edit"
  else
    redirect '/contacts'
  end
end

post '/contacts/:id/addresses' do
  if Contact.find(params[:id])
    @contact = Contact.find(params[:id])
    @address = Address.create!(params[:address])
    @contact.addresses << @address
    erb :"addresses/new"
  end
    redirect "/contacts/" + params[:id]
end

get '/contacts/:id/addresses/new' do
  if Contact.find(params[:id])
    @contact = Contact.find(params[:id])
    @address = Address.new(params[:address])
    erb :"addresses/new"
  else
    redirect "/contacts"
  end
end

get '/contacts/:id/addresses/:address_id/edit' do
  if Address.find(params[:address_id])
    @contact = Contact.find(params[:id])
    @address = Address.find(params[:address_id])
    erb :"addresses/edit"
  else
    redirect '/contacts/:id/addresses/'
  end
end

post '/contacts/:id/addresses/:address_id' do
  if Address.find(params[:address_id])
    @contact = Contact.find(params[:id])
    @address = Address.find(params[:address_id])
    @address.update_attributes(params[:address])
    @address.save
    erb :"addresses/edit"
  end
  redirect "/contacts/" + params[:id]
end


delete '/contacts/:id/addresses/:address_id' do
  if Address.find(params[:address_id])
    @contact = Contact.find(params[:id])
    @address = Address.find(params[:address_id])
    @address.destroy
    erb :"addresses/edit"
  end
  redirect "/contacts/" + params[:id]
end
