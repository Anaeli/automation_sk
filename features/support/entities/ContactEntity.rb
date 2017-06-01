# This class is to define Contact Information object
class ContactEntity
  attr_reader :name,
              :email,
              :address,
              :phone_number,
              :comments

  # This method initialize the attributes
  # @param cont_info_hash, hash with attributes values
  def initialize(cont_info_hash)
    cont_info_hash.each do |key, value|
      next if key.eql?('Obj Reference')
      attribute = Utility.convert_to_underscore(key)
      string_to_evaluate = "@#{attribute} = '#{value}'"
      eval(string_to_evaluate)
    end
  end

  # This method is to fill Contact Information form
  # @param cont_info_hash, data to fill Contact Information form
  def fill_contact_form(cont_info_hash)
    form = ContactInfoUI::FORM
    cont_info_hash.each do |field_name, value|
      next if field_name.eql?('Obj Reference')
      new_attr_name = Utility.convert_to_underscore(field_name)
      type = eval("ContactInfoUI::#{new_attr_name.upcase}['Type']")
      label = eval("ContactInfoUI::#{new_attr_name.upcase}['Label']")
      ComponentsUtil.fill_field(type, label, value, form)
    end
    ContactInformation.click_btn('Enviar')
  end
end
