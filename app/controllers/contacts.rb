get '/contacts' do
  @contacts = Contact.all
  erb :'contacts/index'
end

get '/contacts/new' do
  @contact = Contact.new
  erb :'contacts/new'
end

post '/contacts' do
  @contact = Contact.create!(params[:contact])
  redirect to "/contacts/#{@contact.id}"
end

get '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])
  erb :'contacts/show'
end

get '/contacts/:contact_id/edit' do
  @contact = Contact.find(params[:contact_id])
  erb :'contacts/edit'
end

put '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])
  @contact.update_attributes(params[:contact])
  redirect to "/contacts/#{@contact.id}"
end

delete '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])
  @contact.destroy
  redirect to "/contacts"
end
