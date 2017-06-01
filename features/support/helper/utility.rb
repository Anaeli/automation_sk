# This module contains utilities methods
module Utility
  # This method is to convert some string in underscore string
  # @param string, is the string to convert
  def Utility.convert_to_underscore(string)
    return string.gsub(/::/, '/').gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').gsub(/([a-z\d])([A-Z])/, '\1_\2').downcase
  end

  # Method that capitalize an attribute and delete the @ character
  # @param attr_name, attribute name
  def Utility.capitalize_attribute(attr_name)
    return attr_name.to_s.delete('@').gsub(/[A-Za-z]+/, &:capitalize).delete('_', '')
  end
end
