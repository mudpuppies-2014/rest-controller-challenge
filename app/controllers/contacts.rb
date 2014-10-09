get '/contacts' do
  @contacts = Contact.all
  erb :'contacts/index'
end

get '/contacts/new' do
  @contact = Contact.new
  erb :'contacts/new'
end

get '/contacts/:id/edit' do
  id = params[:id]
  @contact = Contact.find(id)
  erb :"contacts/edit"
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :'contacts/show'
end

post '/contacts' do
  Contact.create!(params[:contact])
  redirect '/contacts'
end

put '/contacts/:id' do
  contact = Contact.find(params[:id])
  contact.update_attributes(params[:contact])
  redirect '/contacts'
end

delete '/contacts/:id' do
  contact = Contact.find(params[:id])
  contact.delete
  redirect '/contacts'
end
