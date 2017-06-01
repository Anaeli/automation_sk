# This class is to define Contact Information object
class ContactEntity
  attr_reader :name,
              :email,
              :address,
              :phone_number,
              :comments

  # This method initialize the attributes
  # @param sreq_hash, hash with attributes values
  def initialize(sreq_hash)
    sreq_hash.each do |key, value|
      next if key.eql?('Obj Reference')
      attribute = Utility.convert_to_underscore(key)
      string_to_evaluate = "@#{attribute} = '#{value}'"
      eval(string_to_evaluate)
    end
  end

  # This method is to create a service request from client portal
  # @param portal the data to create the service request
  def create_object(sreq_hash)
    form = ContactInfoUI::FORM
    sreq_hash.each do |field_name, value|
      next if field_name.eql?('Obj Reference')
      new_attr_name = Utility.convert_to_underscore(field_name)
      a = ContactInfoUI::NAME['Type']
      type = eval("ContactInfoUI::#{new_attr_name.upcase}['Type']")
      label = eval("ContactInfoUI::#{new_attr_name.upcase}['Label']")
      ComponentsUtil.fill_field(type, label, value, form)
    end
    ContactInformation.click_btn('Submit')

  end
 end