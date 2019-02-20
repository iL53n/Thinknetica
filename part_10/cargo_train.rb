class CargoTrain < Train

  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT

  def initialize(number)
    super(number, :cargo)
  end

  def attachable_carriage?(carriage)
    carriage.is_a?(CargoCarriage)
  end
end
