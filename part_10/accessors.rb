module Accessors
  def attr_accessors_with_history(*names)
    names.each do |name|
      variable = "@#{name}".to_sym # переменная
      variable_history = "@#{name}_history".to_sym # для хранения истории переменной

      define_method(name) { instance_variable_get(variable) }

      define_method("#{name}=".to_sym) do |value|
        prev_value = instance_variable_get(variable) # получаем пред. значение(текущ.)
        instance_variable_set(variable, value) # устанавливаем новое значение

        if instance_variable_get(variable_history)
          instance_variable_get(variable_history) << prev_value #if true добавляем пред. значение
        else
          instance_variable_set(variable_history, []) # массив для складирования истории
        end
      end

      define_method("#{name}_history") { instance_variable_get(variable_history) }
    end
  end

  def strong_attr_accessor(name, name_class)
    variable = "@#{name}".to_sym

    define_method(name) { instance_variable_get(variable) }

    define_method("#{name}=".to_sym) do |value|
      raise("Не верный тип для #{name}. Необходим: #{name_class}.") unless value.is_a?(name_class)
      instance_variable_set(variable, value)
    end
  end
end

# class Test
#   extend Accessors
#
#   attr_accessors_with_history :a, :b, :c
#   strong_attr_accessor :text, String
# end
