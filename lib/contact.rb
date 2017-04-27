class Contact
  attr_accessor(:first_name, :last_name, :job_title, :addresses, :emails, :phones, :contacts, :id)
  @@contacts = []

  def initialize(first_name, last_name, job_title)
    @first_name = first_name
    @last_name = last_name
    @job_title = job_title
    @addresses = []
    @emails = []
    @phones = []
    @@contacts.push(self)
    @id = @@contacts.length
  end

  def Contact.all
    @@contacts
  end

  def Contact.clear
    @@contacts = []
  end

  def Contact.find(id)
    found_contact = nil
    @@contacts.each do |contact|
      if contact.id.eql?(id)
        found_contact = contact
      end
    end
    found_contact
  end

  def store_address(address)
    @addresses.push(address)
  end

  def store_email(email)
    @emails.push(email)
  end

  def store_phone(phone)
    @phones.push(phone)
  end

end

class Address
  attr_accessor(:street, :city, :zip, :state, :country)
  def initialize(street, city, zip, state, country)
    @street = street
    @city = city
    @zip = zip
    @state = state
    @country = country
  end
end

class Email
  attr_accessor(:email)
  def initialize(email)
    @email = email
  end
end

class Phone
  attr_accessor(:number , :type)
  def initialize(number, type)
    @number = number
    @type = type
  end
end
