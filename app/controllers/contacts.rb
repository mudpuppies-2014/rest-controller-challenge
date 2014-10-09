get '/' do
  redirect '/contacts'
end

get '/contacts' do
  @contacts = Contact.all
  erb :"contacts/index"
end

post '/contacts' do
  @contact = Contact.create!(params[:contact])
  erb :"contacts/new"
  redirect "/contacts"
end

get '/contacts/new' do
  @contact = Contact.new(params[:contact])
  erb :"contacts/new"
end

get '/contacts/:id' do
  if Contact.find(params[:id])
    @contact = Contact.find(params[:id])
    erb :"contacts/show"
  else
    redirect "/contacts"
  end
end

get '/contacts/:id/edit' do
  if Contact.find(params[:id])
    @contact = Contact.find(params[:id])
  end
  erb :"contacts/edit"
end

post '/contacts/:id' do
  if Contact.find(params[:id])
    @contact = Contact.find(params[:id])
    @contact.update_attributes(name: params[:name], email: params[:email])
    @contact.save
    erb :"contacts/edit"
  end
  redirect 'contacts/' + params[:id]
end

delete '/contacts/:id' do
  if Contact.find(params[:id])
    @contact = Contact.find(params[:id])
    @contact.destroy
    erb :"contacts/edit"
  end
  redirect '/contacts'
end
