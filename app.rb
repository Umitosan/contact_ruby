require 'sinatra'
require 'sinatra/reloader'
require './lib/contact'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  @contacts = Contact.all
  erb(:index)
end

get('/add_contact_form') do
  erb(:add_contact_form)
end

post('/add_contact_form') do
  # contact
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  job_title = params.fetch('job_title')
  # address
  street = params.fetch('street')
  city = params.fetch('city')
  zip  = params.fetch('zip')
  state = params.fetch('state')
  country = params.fetch('country')
  # phone
  type = params.fetch('type')
  number = params.fetch('number')
  # email
  email = params.fetch('email')

  new_contact = Contact.new(first_name, last_name, job_title)
  new_contact.store_address(Address.new(street, city, zip, state, country))
  new_contact.store_phone(Phone.new(number, type))
  new_contact.store_email(Email.new(email))
  redirect('/')
end

get('/contact/:id') do
  # @selected_contact = Contact.find(params.fetch('id').to_i)
  Contact.store_working_contact(Contact.find(params.fetch('id').to_i))
  erb(:contact)
end

get('/address_form/:id') do
  # @selected_contact = Contact.find(params.fetch('id').to_i)
  erb(:address_form)
end

post('/address_form/:id') do
  # @selected_contact = Contact.find(params.fetch('id').to_i)
  street = params.fetch('street')
  city = params.fetch('city')
  zip  = params.fetch('zip')
  state = params.fetch('state')
  country = params.fetch('country')

  @selected_contact.store_address(Address.new(street, city, zip, state, country))
  redirect('/contact/' + params.fetch('id'))
end
