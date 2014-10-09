get '/contacts' do 
	@contacts = Contact.all

	erb :'contacts/index'
end

get '/contacts/new' do 
	@contact = Contact.new

	erb :'contacts/new'
end

post '/contacts' do
	@contact = Contact.create!(name: params[:contact][:name],email: params[:contact][:email])

	redirect '/contacts'
end

get '/contacts/:id' do 
	@contact = Contact.find_by(id: params[:id])

	erb :'contacts/show'
end

get '/contacts/:id/addresses/new' do
  @contact = Contact.find_by(id: params[:id])
  @address = Address.new

	erb :'addresses/new'
end

get '/contacts/:id/edit' do
  @contact = Contact.find_by(id: params[:id])

  erb :'contacts/edit'
end

put '/contacts/:contact_id' do
  @contact = Contact.find_by(id: params[:contact_id])
  @contact.update_attributes(name: params[:contact][:name],
							 email: params[:contact][:email])

  redirect '/contacts/' + (params[:contact_id])
end

delete '/contacts/:contact_id' do
  @contact = Contact.find_by(id: params[:contact_id])
  # @address = Address.find_by(contact_id: params[:contact_id])
  # @address.destroy
  @contact.destroy

  redirect '/contacts'
end