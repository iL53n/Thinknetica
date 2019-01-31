class Station
  attr_reader :title, :trains

  def initialize(title)
    @title = title
    @trains = []
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
