class PassengerTrain < Train
  def initialize(number, type = 'passenger')
    super
    @type = type
  end
end
