get '/' do
 erb :index
end


get '/contacts/:user_id/addresses/new' do
  @contact = Contact.find(params[:user_id])
  @address = Address.new(contact_id: @contact.id)
  erb :"addresses/new"
end

post '/contacts/:user_id/addresses' do
  @contact = Contact.find(params[:user_id])

  updates = {
    contact_id: params[:user_id],
    street: params[:address][:street],
    city: params[:address][:city],
    state: params[:address][:state],
    zip: params[:address][:zip]
  }
  @address = Address.new(updates)
  if @address.valid?
    @address.save
  else
    #haven't made error message about wrong user input
  end
  erb :"contacts/show"
end

get '/contacts/:user_id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:user_id])
  @address = Address.find(params[:address_id])
  erb :"addresses/edit"
end

put '/contacts/:user_id/addresses/:address_id' do
  @contact = Contact.find(params[:user_id])
  @address = Address.find(params[:address_id])
  user_changes = {
    street: params[:address][:street],
    city: params[:address][:city],
    state: params[:address][:state],
    zip: params[:address][:zip]
  }
  @address.update_attributes(user_changes)
  erb :"contacts/show"
end
