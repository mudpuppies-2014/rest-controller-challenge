# RETRIEVE ALL CONTACTS
# we need to retrieve all of the contacts so we are asking to go to the index page and
# create a visual representation (through the index.erb) of @contacts; because our index.erb is iterating through @contacts and
# showing (in list form) the contact.name as a link and their email.
get '/contacts' do
  @contacts = Contact.all # we query the databse and set all of the contacts in our database to @contacts

  erb :"contacts/index"
end


#CREATES A CONTACT
# right now, when we click on the 'create a contact' link, it takes us to /contacts/new, but there is nothing there becuase we have not
# created a route from the new.erb to that page.  We need to submit a get request to that page and say that we want it to look like our
# contacts/new.erb.

get '/contacts/new' do
  @contact = Contact.new # we are taking the input so that we can use it for our eventual post request (below line 23)

  erb :"contacts/new"
end

post '/contacts' do
  @contact = Contact.create!(params[:contact]) # if we just had this, we would be creating a new contact and it would be located at /contacts but we then get to a blank page... we want to redirect to the original page where the contact is now located

  redirect to '/contacts'
end

#EDIT A CONTACT

get '/contacts/:id' do
  @contact = Contact.find(params[:id])

  erb :'/contacts/show'
end
# I want to go to a specific contact (so I need to find it) and make a post request to edit the contact.
# First do a get request
get '/contacts/:id/edit' do # need to specify /edit because in the test, they want edit.erb to be specific on a edit page.
  @contact = Contact.find(params[:id]) # finding the contact with specific id

  erb :'/contacts/edit' # using the edit.erb as the view for this particular page and what it takes in.
end
# Now we use PUT to update the information. We find the contact and set it to @contact.
put '/contacts/:id' do # * if you use PUT OR PATCH to update a contact, you need to trick the browser (line 7 on edit.erb)
  @contact = Contact.find(params[:id])
  @contact.update_attributes(params[:contact]) # use update_attributes and put it the whole :contact hash so it can use either name or email attributes
  redirect to '/contacts' #redirect to the list of contacts to see the updated contact
end

#DELETE A CONTACT

delete '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.destroy

  redirect to '/contacts'
end

