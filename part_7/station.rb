require_relative "./instance_counter.rb"
require_relative "./valid.rb"

class Station
  include InstanceCounter
  include Valid

  attr_reader :title, :trains

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(title)
    @title = title
    @trains = []
    @@stations << self
    register_instance
    validate!
  end  

  def add_train(train)
    @trains << train
  end

  def show_trains
    @trains.each { |train| puts train }
  end

  def trains_by_type(type)
    @trains.select { |train| train.type == type}
  end

  def send_train(train)
    @trains.delete(train)
  end

  protected

  def validate!
    raise "Укажите название станции!" if title.nil?
    raise "Название станции не может быть меньше 3 символов!" if title.length < 3
  end
end
