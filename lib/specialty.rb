class Specialty
  attr_reader(:id, :type)

  def initialize(attributes)
    @id = attributes[:id]
    @type = attributes[:type]
  end

  def self.all
    returned_specialties = DB.exec("SELECT * FROM specialties;")
    specialties = []
    returned_specialties.each do |specialty|
      id   = specialty["id"]
      type = specialty["type"]
      specialties << Specialty.new(id: id, type: type)
    end
    specialties
  end

  def save
    result = DB.exec("INSERT INTO specialties (type) VALUES ('#{@type}') RETURNING id;")
    @id = result.first["id"].to_i
  end

  def ==(another_specialty)
    self.type == another_specialty.type
  end

  def self.clear
    DB.exec("DELETE FROM specialties *;")
  end
end
