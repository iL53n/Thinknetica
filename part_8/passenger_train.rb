class PassengerTrain < Train
  def initialize(number)
    super(number, :passenger) #Сейчас можно пассажирскому вагону задать тип :cargo. Нужно это запретить на уровне класса. Для этого нужно переопределить конструктор в PassengerTrain/CargoTrain.
  end

  def attachable_carriage?(carriage)
    carriage.is_a?(PassengerCarriage)
  end
end
