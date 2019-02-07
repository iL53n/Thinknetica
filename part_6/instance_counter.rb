# [ ]  Создать модуль InstanceCounter, содержащий следующие методы класса и инстанс-методы, 
#которые подключаются автоматически при вызове include в классе:
# [ ]  Методы класса:
#      - instances, который возвращает кол-во экземпляров данного класса
# [ ]  Инастанс-методы:
#      - register_instance, который увеличивает счетчик кол-ва экземпляров класса и 
#который можно вызвать из конструктора. При этом данный метод не должен быть публичным.
# [ ]  Подключить этот модуль в классы поезда, маршрута и станции.
# **Примечание:** инстансы подклассов могут считатья по отдельности, 
#не увеличивая счетчик инстансев базового класса.

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :instances

    def instances
      @instances
      #озвращает кол-во экземпляров данного класса
    end
  end

  module InstanceMethods
    
    protected

    def register_instance
      self.class.instances ||= 0 #если nil, установить 0
      self.class.instances += 1
      #увеличивает счетчик кол-ва экземпляров класса и который можно вызвать из конструктора.
    end
  end
end

#require_relative "./instance_counter.rb"
#include InstanceCounter
