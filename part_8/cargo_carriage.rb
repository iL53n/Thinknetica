class CargoCarriage < Carriage
  def initialize(capacity)
    super(capacity, :cargo)
  end
end
