get '/contacts' do
  @contacts = Contact.all
  erb :"contacts/index"
end

get '/contacts/new' do
  @contact = Contact.new
  erb :"contacts/new"
end

post '/contacts' do
  Contact.create!(params[:contact])
   redirect to "/contacts"
end

get '/contacts/:user_id' do
  @contact = Contact.find(params[:user_id])
  erb :'contacts/show'
end

get '/contacts/:user_id/edit' do
  @contact = Contact.find(params[:user_id])
  erb :'contacts/edit'
end

put '/contacts/:user_id' do
  @contact = Contact.find(params[:user_id])
  @contact.update_attributes(name: params[:contact][:name], email: params[:contact][:email])
  @contacts = Contact.all
  redirect to "/contacts"
end


delete '/contacts/:user_id' do
  @contact = Contact.find(params[:user_id])
  @contact.delete
  redirect to "/contacts"
end
