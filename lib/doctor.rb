class Doctor
  attr_reader(:first_name, :last_name, :id, :specialty_id)

  def initialize(attributes)
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @id = attributes[:id]
    @specialty_id = attributes[:specialty_id]
  end

  def save
    result = DB.exec("INSERT INTO doctors (first_name, last_name, specialty_id) VALUES ('#{@first_name}', '#{@last_name}', #{@specialty_id}) RETURNING id;")
    @id = result.first["id"].to_i
  end

  def self.all
    returned_doctors = DB.exec("SELECT * FROM doctors")
    doctors = []
    returned_doctors.each do |doctor|
      id           = doctor['id'].to_i()
      first_name   = doctor['first_name']
      last_name    = doctor['last_name']
      specialty_id = doctor['specialty_id'].to_i()
      doctors << Doctor.new(id: id,
                            first_name: first_name,
                            last_name: last_name,
                            specialty_id: specialty_id)
    end
    doctors
  end

  def ==(another_doctor)
    self.last_name == another_doctor.last_name && self.specialty_id == another_doctor.specialty_id
  end
end
