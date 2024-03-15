Booking.destroy_all
Listing.destroy_all
User.destroy_all
puts 'Adding users'
# Create Users
peter = User.create!(email: 'peter@gmail.com', password: 'password123', password_confirmation: 'password123', first_name: 'Peter', last_name: 'Doe')
john = User.create!(email: 'john@yahoo.com', password: 'password123', password_confirmation: 'password123', first_name: 'John', last_name: 'Crawford')
jane = User.create!(email: 'jane@yahoo.com', password: 'password123', password_confirmation: 'password123', first_name: 'Jane', last_name: 'Austen')
emily = User.create!(email: 'emily@yahoo.com', password: 'password123', password_confirmation: 'password123', first_name: 'Emily', last_name: 'Bronte')

puts 'Adding listings'
# Create listings
mountain = Listing.create!(name: "Cozy Mountain Retreat", location: "Aspen, Colorado", wifi: true, workspace: true, price: 150.50, availability: true, user: peter)
bungalow = Listing.create!(name: "Beachside Bungalow", location: "Malibu, California", wifi: true, workspace: false, price: 200.75, availability: true, user: peter)
loft = Listing.create!(name: "Urban Loft", location: "New York, New York", wifi: true, workspace: true, price: 120.99, availability: false, user: john)
cottage = Listing.create!(name: "Country Cottage", location: "Charleston, South Carolina", wifi: false, workspace: false, price: 85.00, availability: true, user: john)
lakehouse = Listing.create!(name: "Lake House Getaway", location: "Lake Tahoe, California", wifi: true, workspace: false, price: 175.25, availability: false, user: john)

puts 'Adding bookings'
# Create bookings
Booking.create!(start_date: Date.new(2023, 3, 15), end_date: Date.new(2023, 3, 20), listing: mountain, user: jane)
Booking.create!(start_date: Date.new(2023, 4, 10), end_date: Date.new(2023, 4, 15), listing: cottage, user: jane)
Booking.create!(start_date: Date.new(2023, 5, 12), end_date: Date.new(2023, 5, 17), listing: bungalow, user: emily)
