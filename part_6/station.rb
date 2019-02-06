require_relative "./instance_counter.rb"

class Station
  include InstanceCounter

  attr_reader :title, :trains

  @@stations = []

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  def self.all
    @@stations
  end

  def initialize(title)
    @title = title
    @trains = []
    @@stations << self
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

end
