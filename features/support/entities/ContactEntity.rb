# This class is to define Service Request object
class ServiceRequestEntity
  attr_reader :name,
              :email,
              :address,
              :phone_number,
              :comments

  # This method initialize the attributes
  # @param sreq_hash, hash with attributes values
  def initialize(sreq_hash)
    sreq_hash.each do |key, value|
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
      new_attr_name = Utility.convert_to_underscore(field_name)
      type = eval("ContactInfoUI::'#{new_attr_name.upcase}'['Type']")
      label = eval("ContactInfoUI::'#{new_attr_name.upcase}']['Label']")
      ComponentsUtil.fill_field(type, label, value, form)
    end

  end
 end