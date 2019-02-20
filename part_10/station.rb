require_relative './instance_counter.rb'
require_relative './validation.rb'
<<<<<<< HEAD
require_relative './accessors'
=======
>>>>>>> 1e0905092aac27c087aa93f294c9e941b33ce845

class Station
  include InstanceCounter
  include Validation
<<<<<<< HEAD
  extend Accessors

  attr_accessors_with_history :title, :trains
=======

  EMPTY_TITLE_ERROR = 'Укажите название станции!'.freeze
  TITLE_FORMAT_ERROR = 'Название станции не может быть меньше 3 символов!'.freeze

  attr_reader :title, :trains
>>>>>>> 1e0905092aac27c087aa93f294c9e941b33ce845

  validate :title, :presence
  validate :title, :length

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

  def trains_by_type(type)
    @trains.select { |train| train.type == type }
  end

  def send_train(train)
    @trains.delete(train)
  end

  def each_train
    @trains.each { |train| yield(train) }
  end
end
