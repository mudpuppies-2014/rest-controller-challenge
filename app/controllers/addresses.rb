# CREATE A NEW ADDRESS
# After you've clicked on the new address button in the show contact view, get directed to the new address route...

# Find the contact whose address you want to add and then create a new address

get '/contacts/:id/addresses/new' do
  @contact = Contact.find(params[:id]) 
  @address = Address.new

  erb :"addresses/new"
end

# Now that we've been taken to the page where you can create a new address by filling out the form, we'll need a post route for sending the info that will be inputted in the form

# Find the contact that you want to create an address for, create the address, then update the contact for the address since address is PART OF contact and not something that itself is being edited, then save it

# Because the spec says that it's expecting to see "123 happy trail" after the address has been entered, must redirect to the contact's specific page as opposed to the home contacts page (where it doesn't list the addresses)

post '/contacts/:id/addresses' do 
  @contact = Contact.find(params[:id])
  @address = Address.create(params[:address])
  @address.update_attributes(contact: @contact)
  @address.save

  redirect to "/contacts/#{params[:id]}"
end


# EDIT ADDRESS

# After you click on the address, you need to be taken to a page where you can edit the address 

# Find the specific contact who has the address and then find the address itself since the contact might have numerous addresses

get '/contacts/:id/addresses/:address_id/edit' do 
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:address_id])

  erb :"addresses/edit"
end

# Now that we have altered our address in the form and need to submit it so that our address can be updated, we need a post (really, we need PUT or PATCH but I'm a POST devotee) route

# Find the contact that needs to be updated, find the address within the contact that needs to be updated, and then update the address, NOT the contact

post '/contacts/:id/addresses/:address_id' do 
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:address_id])
  @address.update_attributes(params[:address])

  redirect to "/contacts/#{params[:id]}"
end