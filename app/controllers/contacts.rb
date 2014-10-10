get '/contacts' do
  @contacts = Contact.all
  erb :'contacts/index'
end

post '/contacts' do
  new_contact = params[:contact]
  Contact.create(name: new_contact[:name], email: new_contact[:email])
  redirect to '/contacts'
end

get '/contacts/new' do
  @contact = Contact.new
  erb :'contacts/new'
end

get '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])
  erb :'contacts/show'
  # edit = '/contacts/' + params[:contact_id] + '/edit'
  # redirect to edit
end

get '/contacts/:contact_id/edit' do
  @contact = Contact.find(params[:contact_id])
  erb :'contacts/edit'
end

put '/contacts/:contact_id' do
  @contact = Contact.find_by(id: params[:contact_id])
  new_contact = params[:contact]
  @contact.update_attributes(name: new_contact[:name], email: new_contact[:email])
  redirect to '/contacts'
end

delete '/contacts/:contact_id' do
  @contact = Contact.find_by(id: params[:contact_id])
  @contact.destroy
  redirect to '/contacts'
end