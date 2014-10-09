# RETRIEVE ALL CONTACTS
# direct to the contacts page and list all exisiting contacts

get '/contacts' do 
  @contacts = Contact.all

  erb :"contacts/index"
end


# CREATE A NEW CONTACT
# direct to the new contact page and create a new Contact object with contact params

get '/contacts/new' do 
  @contact = Contact.new # use new instead of create! because new will create the Ruby object but not put it in the database whereas create! will essentially take the job away from the below POST

  erb :"contacts/new"
end

# there is a new contact form to fill out so before a new contact can be totally created, the post must be submitted which means... a POST route is needed

post '/contacts' do 
  @contact = Contact.create!(params[:contact])

  redirect to "/contacts"
end


# EDIT A CONTACT
# in order to edit a contact, must first click on one and GET to that page

# must find the specific contact we clicked on (based on ID)

get '/contacts/:id' do
  @contact = Contact.find(params[:id]) 

  erb :"contacts/show"
end

# now that we're on the individual contact's page, we can click the edit link and GET to THAT page
# must continue to find the specific contact we want (based on ID) because the computer needs to know what it's editiing after clicking the edit link

get '/contacts/:id/edit' do 
  @contact = Contact.find(params[:id])

  erb :"contacts/edit"
end

# Now that we are on the edit page and have filled out our new info and have hit the save button, we need to have a PUT method that updates the contact and redirects back to the main list of contacts

# Find the contact and update its atributes

post '/contacts/:id' do 
  @contact = Contact.find(params[:id])
  @contact.update_attributes(params[:contact]) # update the contact itself

  redirect to "/contacts"
end


# DELETE A CONTACT
# find the contact that you would like to delete and detroy it!

# don't forget to hide the action in the edit view, right beneath form action!!

delete '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.destroy 

  redirect to "/contacts" # makes most sense to redirect to the contacts page where you can see that the contact you want deleted was in fact deleted
end