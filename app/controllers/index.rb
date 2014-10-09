get '/' do
  def em(input)
    input
  end
  erb :index
end

get '/contacts' do
  @contacts = Contact.all
  erb :"contacts/index"
end

get '/contacts/new' do
  erb :"contacts/new"
end

get '/contacts/:user_id/edit' do
  @contact = Contact.find(params[:user_id])
  erb :"contacts/edit"
end

get '/contacts/:user_id' do
 @contact = Contact.find(params[:user_id])
 erb :"contacts/show"
end

get '/contacts/:user_id/addresses/new' do
  @contact = Contact.find(params[:user_id])
  erb :"addresses/new"
end

get '/contacts/:user_id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:user_id])
  @address = Address.find(params[:address_id])
  erb :"addresses/edit"
end

post '/contacts' do
  Contact.create(params[:contact])
  redirect to "/contacts"
end

post '/contacts/:user_id/addresses' do
  @contact = Contact.find(params[:user_id])
  @contact.addresses.create(params[:address])
  redirect to "/contacts/#{@contact.id}"
end

post '/contacts/:user_id' do
  @contact = Contact.find(params[:user_id])
  @contact.update(params[:contact])
  redirect to "/contacts/#{@contact.id}"
end

delete '/contacts/:user_id' do
 @contact =Contact.find(params[:user_id])
 @contact.destroy
 redirect to "contacts"
end

post '/contacts/:user_id/addresses/:address_id' do
  @contact = Contact.find(params[:user_id])
  @address = Address.find(params[:address_id])
  @address.update(params[:address])
  redirect to "/contacts/#{@contact.id}"
end


