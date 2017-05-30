# This module contains the utilitary methods
module Utility

  # This method is to convert some string in underscore string
  # @param string is the string to convert
  def Utility.convert_to_underscore(string)
    return string.gsub(/::/, '/').gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').gsub(/([a-z\d])([A-Z])/, '\1_\2').downcase
  end
end