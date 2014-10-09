
get "/" do
erb :index
end

get "/contacts" do
  @contacts = Contact.all
  erb :"contacts/index"
end

get "/contacts/new" do
  @contact = Contact.new
  erb :"contacts/new"
end

post "/contacts" do
  @contact = Contact.create!(params[:contact])
  redirect '/contacts'
end

get "/contacts/:id/edit" do
  @contact = Contact.find(params[:id])
  erb :"contacts/edit"
end

put '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.update_attributes(params[:contact])
  erb :"contacts/show"
end

delete '/contacts/:id/' do
  @contact = Contact.find(params[:id])
  @contact.destroy
  erb :'/contacts/show'
end
