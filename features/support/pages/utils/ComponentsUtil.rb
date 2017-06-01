# This module is to actions related to Custom Form
module ComponentsUtil
  # Method to fill a field according field type
  # @param type name to set a value
  # @param field name to set a value
  # @param value to set in the field specified
  # @param component is the component name to build code line
  def ComponentsUtil.fill_field(type, field, value, component)
    raise("#{field} is not filled because is empty") if value.eql?('')
    formatted_value = value.is_a?(Array) ? value : "'#{value}'"
    string_to_eval = "#{component}.action('#{field}', #{formatted_value})"
    action = option_type(type)
    eval(string_to_eval.gsub('action', action)) unless action.nil?
  end

  # Method that define the type of operation to be used for filling the fields
  # @param component is the name of the class or module to be used
  # @param type is the description of the type of data
  def ComponentsUtil.option_type(type)
    case type
    when 'IntegerType', 'DecimalType', 'TextType', 'LongTextAreaType', 'DatatimeType'
      'set_field'
    when 'ReferenceType'
      'set_lookup_field'
    when 'ReferenceTypeWindow'
      'select_in_lookup_window'
    when 'CheckboxType'
      'check_chbox'
    when 'CheckboxGroupType'
      'check_group_checkbox'
    when 'PicklistType', 'PicklistYNType'
      'select_option'
    when 'AttachmentType'
      'set_attachment_field'
    when 'RichAreaType'
      'set_rich_text_field'
    end
  end
end
