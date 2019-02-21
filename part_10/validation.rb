module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validations

    def validate(name_attr, type_valid, params = nil)
      @validations ||= []
      @validations << { name_attr: name_attr, type_valid: type_valid, params: params }
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue RuntimeError
      false
    end

    protected

    def presence(value, _)
      raise 'Значение не может быть пуcтым!' if value.nil? || value == ''
    end

    def format(value, format)
      raise 'Не верный формат!' if value !~ format
    end

    def type(value, type)
      raise 'Не верный тип!' unless value.is_a?(type)
    end

    def length(value, _)
      raise 'Значение меньше 3 символов!' if value.length < 3 # в задании нет, но нужно для станций
    end

    def validate!
      self.class.validations.each do |validation|
        value = instance_variable_get("@#{validation[:name_attr]}".to_sym)
        def_name = validation[:type_valid].to_sym
        send(def_name, value, validation[:params])
      end
    end
  end
end


# class Test
#   include Validation
#   NUMBER_FORMAT = /^[a-zа-яё\d]{3}-?[a-zа-яё\d]{2}$/i
#   validate :number, :presence
#   validate :number, :type, String
#   validate :number, :format, NUMBER_FORMAT
#
#   def initialize(number)
#     @number = number
#   end
# end
#
# t1 = Test.new('12345')
# t2 = Test.new(nil)
# t3 = Test.new(12345)
#
# puts t1.valid?
# puts t2.valid?
# puts t3.valid?

