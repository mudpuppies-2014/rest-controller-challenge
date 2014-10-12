#retrieves contacts
get '/contacts' do
  @contacts = Contact.all
  erb :'contacts/index'
end

#creates contact
get '/contacts/new' do
  @contact = Contact.new
  erb :'contacts/new'
end


post '/contacts' do
  @contact = Contact.create!(params[:contact])
  redirect '/contacts'
end


#edits contact
get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
  erb :'contacts/edit'
end

put '/contacts/:id' do
  contact = Contact.find(params[:id])
  contact.update(params[:contact])
  redirect '/contacts'
end

#deletes contact
delete '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.destroy
  redirect '/contacts'
end