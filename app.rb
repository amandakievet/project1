require 'bundler'
Bundler.require

ROOT_PATH = Dir.pwd
Dir[ROOT_PATH+"/models/*.rb"].each{ |file| require file}

ActiveRecord::Base.establish_connection(
	adapter: "postgresql",
	database: "restaurantsql"
)

# Display links to navigate the application
## Links: ['Add Party', 'List of Open Tables',
## 'List of Closed Tables', 'View Menu']
get '/' do 
	erb :index
end

# Display a list of menu items available
## WL: Organize by meal ['breakfast', 'lunch', 'brunch', 'dinner', etc]
## WL: Seperated in dropdown lists by course ['appetizers', 'drinks', 'salads', 'etc']
get '/menu_items' do
	@menu_items = MenuItem.all
	erb :"menu_items/index" 
end

# Display a form for a new menu item
get '/menu_items/new' do
	erb :"menu_items/new"
end

# Display a single menu item
get '/menu_items/:id' do
	@menu_item= MenuItem.find(params[:id])
	erb :"menu_items/show"
end

#Creats a new menu item
post '/menu_items' do 
	MenuItem.create(params[:menu_item])
	redirect '/menu_items'
end

# Display a form to edit a menu item
get '/menu_items/:id/edit' do 
	@menu_item= MenuItem.find(params[:id])
	erb :"menu_items/edit"
end

#Updates a menu item
patch '/menu_items/:id' do 
	menu_item= MenuItem.find(params[:id])
	menu_item.update(params[:menu_item])
	redirect "/menu_items/#{menu_item.id}"
end

# Deletes a menu item
delete '/menu_items/:id' do 
	@menu_item= MenuItem.find(params[:id])
	MenuItem.destroy(params[:id])
	redirect "/menu_items"
end

# Display a list of all OPEN parties 
## (parties who have at least one non-paid order)
get '/parties' do 
end

#Display a form for a new party
get '/parties/new' do
end

#creates a new party
post '/parties' do
	redirect '/parties'
end

# Display a single party and all the menu items they've ordered 
# link to add a new order to that party
get '/parties/:id' do
end

# Display a form to edit a party's details
get '/parties/:id/edit' do 
end

# Update a party's details
patch '/parties/:id' do 
end

# Delete a party <--  NOT THE SAME AS MARKING AS CLOSED AND MOVING TO CLOSED ORDERS
delete '/parties/:id' do
end

# Lists all the party's orders
get '/parties/:id/orders' do 
end

# Displays a form for a new order
get '/parties/:id/orders/new' do 
end

# Creates a new order for the party
post '/parties/:id/orders' do
	redirect 
end

# Display a single order 
get '/parties/:id/orders/:order_id' do
end

# Display a form to edit the order details ['notes', 'change queue', 'etc']
get '/parties/:id/orders/:order_id/edit' do
end

# Updates the order's details
patch '/parties/:id/orders/:order_id' do
	redirect
end

# Removes an order
delete '/parties/:id/orders' do
end

# Saves the party's receipt data to a file.
# Displays the content of the receipt.
# Offer the file for download
get '/parties/:id/receipt' do 
end

# Marks the party as paid
patch '/parties/:id/checkout' do
end























