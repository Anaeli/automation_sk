# This module is to actions related to Custom Form
module ComponentsUtil
  # Method to fill a field according field type
  # @param type name to set a value
  # @param field name to set a value
  # @param value to set in the field specified
  # @param component is the component name to build code line
  # @param section is to reduce the context to find the field
  def ComponentsUtil.fill_field(type, field, value, component, section = nil)
    if value.eql?('')
      cst_logger.info("#{field} is not filled because is empty")
    else
      formatted_value = value.is_a?(Array) ? value : "'#{value}'"
      string_to_eval = "#{component}.action('#{field}', #{formatted_value})"
      action = option_type(component, type)
      eval(string_to_eval.gsub('action', action)) unless action.nil?
    end
  end

  # Method that define the type of operation to be used for filling the fields
  # @param component is the name of the class or module to be used
  # @param type is the description of the type of data
  def ComponentsUtil.option_type(component, type)
    case type
    when 'IntegerType', 'DecimalType', 'TextType', 'LongTextAreaType', 'DatatimeType'
      'set_field'
    when 'ReferenceType'
      if Mobile.is_mobile_page?
        'click_lookup_field_row'
      elsif component == 'MainContainerSection'
        'select_option'
      else
        'set_lookup_field'
      end
    when 'ReferenceTypeWindow'
      'select_in_lookup_window'
    when 'CheckboxType'
      if component == 'MainContainerSection'
        'no_support'
      else
        'check_chbox'
      end
    when 'CheckboxGroupType'
      if component == 'MainContainerSection'
        'no_support'
      else
        'check_group_checkbox'
      end
    when 'PicklistType', 'PicklistYNType'
      'select_option'
    when 'AttachmentType'
      'set_attachment_field'
    when 'RichAreaType'
      'set_rich_text_field'
    end
  end
end
