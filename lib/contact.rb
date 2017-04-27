class Contact
  attr_accessor(:first_name, :last_name, :job_title, :addresses, :emails, :phones)
  @@contacts = []

  def initialize(first_name, last_name, job_title)
    @first_name = first_name
    @last_name = last_name
    @job_title = job_title
    @addresses = []
    @emails = []
    @phones = []
  end

  def store_address(address)
    @addresses.push(address)
  end

  def store_email(email)
    @emails.push(email)
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
