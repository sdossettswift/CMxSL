require 'csv'
require 'pp'

contacts = []

CSV.foreach('brokers.csv', headers: true) do |row|
  contact_as_hash = row.to_hash
  contacts << contact_as_hash
end


contacts.each do |contact|
  @contact = Contact.create!
  @contact.first_name = contact["first_name"]
  @contact.last_name =  contact["last_name"]
  @contact.list_id =  contact["list_id"]
  @contact.company =  contact["company"]
  @contact.title =  contact["title"]
  @contact.phone =  contact["phone"]
  @contact.email =  contact["email"]
  @contact.address1 =  contact["address1"]
  @contact.city =  contact["city"]
  @contact.state =  contact["state"]
  @contact.zip =  contact["zip"]
  @contact.notes =  contact["notes"]
end
