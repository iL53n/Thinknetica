class CargoTrain < Train
  def initialize(number)
    super(number, :cargo)
  end

  def attachable_carriage?(carriage)
    carriage.is_a?(CargoCarriage)
  end
end
