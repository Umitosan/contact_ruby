require "contact"
require "rspec"
require "pry"

describe(Contact) do
  before do
    Contact.clear
  end

  it("the name attribute to be Dom") do
    new_contact = Contact.new("Dom", "Brown", "Developer")
    expect(new_contact.first_name).to(eq("Dom"))
    expect(new_contact.last_name).to(eq("Brown"))
    expect(new_contact.job_title).to(eq("Developer"))
  end

  it("stores and returns addresses in an array") do
    new_address = Address.new("Beals", "PDX", "97333", "OR", "USA")
    expect(new_address.street).to(eq("Beals"))
  end

  it("stores and returns addresses in Contact list") do
    new_contact = Contact.new("Dom", "Brown", "Developer")
    new_address = Address.new("Beals", "PDX", "97333", "OR", "USA")
    new_contact.store_address(new_address)
    expect(new_contact.addresses[0].street).to(eq("Beals"))
  end

  it("stores a email object in Contacts and returns it") do
    new_contact = Contact.new("Dom", "Brown", "Developer")
    new_email = Email.new("beefcakehottie@aol.com")
    new_contact.store_email(new_email)
    expect(new_contact.emails[0].email).to(eq("beefcakehottie@aol.com"))
  end

  it("stores a phone object in Contacts and returns it") do
    new_contact = Contact.new("Dom", "Brown", "Developer")
    new_phone = Phone.new("8005559292", "Home")
    new_contact.store_phone(new_phone)
    expect(new_contact.phones[0].number).to(eq("8005559292"))
  end

  it("stores all contacts in an array") do
    new_contact = Contact.new("Dom", "Brown", "Developer")
    expect(Contact.all).to(eq([new_contact]))
  end

  it("stores and returns an ID for each contact") do
    new_contact = Contact.new("Dom", "Brown", "Developer")
    expect(new_contact.id).to(eq(1))
  end

end
