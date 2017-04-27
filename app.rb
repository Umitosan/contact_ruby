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
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  job_title = params.fetch('job_title')
  Contact.new(first_name, last_name, job_title)
  redirect('/')
end

get('/contact/:id') do
  @selected_contact = Contact.find(params.fetch('id').to_i)
  erb(:contact)
end
