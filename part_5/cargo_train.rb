class CargoTrain < Train
  def initialize(number, type = 'cargo')
    super
    @type = type
  end
end
