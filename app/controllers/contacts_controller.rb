
get '/contacts' do
  @contacts = Contact.all
  erb :"contacts/index"
end

get '/contacts/new' do
  @contact = Contact.new
  erb :"contacts/new"
end

get '/contacts/:user_id' do
  @contact = Contact.find(params[:user_id])

  erb :"contacts/show"
end


post '/contacts' do
  new_contact = {
    name: params[:contact][:name],
    email: params[:contact][:email]
  }
  @contact = Contact.new(new_contact)
  if @contact.valid?
    @contact.save
  else
    #figure this out later
  end
  @contacts = Contact.all
  erb :"contacts/index"
end

get '/contacts/:user_id/edit' do
  @contact = Contact.find(params[:user_id])
  erb :"contacts/edit"
end

put '/contacts/:user_id' do
  @contact = Contact.find(params[:user_id])
  new_info = {
    name: params[:contact][:name],
    email: params[:contact][:email]
  }
  @contact.update_attributes(new_info)
  @contacts = Contact.all
  erb :"contacts/index"
end

delete '/contacts/:user_id' do
  @contact = Contact.find(params[:user_id])
  @contact.delete
  @contacts = Contact.all

  erb :"contacts/index"
end
