# This module contains methods for manage ContactInfoForm
module ContactInfoForm
  # Method to create a ContactInfoForm
  # @param table_data represents the table data to fill the contact info
  def ContactInfoForm.response_contact_info(table_data)
    table_data.each do |row|
      ContactInformation.set_field('Name', row['Name'])
      ContactInformation.set_field('Email', row['Email'])
      ContactInformation.set_field('Address', row['Address'])
      ContactInformation.set_field('Phone Number', row['Phone Number']) unless row['Comments'].nil?
      ContactInformation.set_field('Comments', row['Comments']) unless row['Comments'].nil?
      ContactInformation.click_btn('Enviar')
    end
  end
end
