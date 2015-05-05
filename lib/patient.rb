class Patient
  attr_reader(:first_name, :last_name, :birthdate, :doctor_id)

  def initialize(attributes)
    @first_name = attributes[:first_name]
    @last_name  = attributes[:last_name]
    @birthdate  = attributes[:birthdate]
    @doctor_id  = attributes[:doctor_id]
  end

  def save
    DB.exec("INSERT INTO patients (first_name, last_name, birthdate, doctor_id) VALUES ('#{@first_name}', '#{@last_name}', #{@birthdate}, #{@doctor_id}) RETURNING id;")
  end
end
