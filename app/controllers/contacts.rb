get '/' do
  @contacts = Contact.all
  erb :'contacts/index'
end

get '/contacts' do
 @contacts = Contact.all
 erb :'contacts/index'
end

get '/contacts/new' do
  @contact = Contact.new()
  erb :'contacts/new'
end

post '/contacts' do
  @contact = Contact.create!(params[:contact])
  redirect 'contacts'
end

get '/contacts/:id/edit' do
  @id = params[:id]
  @contact = Contact.find(@id)
  erb :'contacts/edit'
end

get '/contacts/:id' do
    @contact = Contact.find_by("id = #{params[:id]}")
    erb :'contacts/show'
end

post '/contacts/:id' do
  @contact = Contact.find_by("id = #{params[:id]}")
  @contact.update_attributes(params[:contact])
  redirect 'contacts'
end

post '/contacts/:id/delete' do
  @contact = Contact.find_by("id = #{params[:id]}")
  @contact.destroy
  redirect 'contacts'
end

post '/contacts/:id/adresses' do
  @address = Address.create!(params[:address])
  redirect '/contacts'
end