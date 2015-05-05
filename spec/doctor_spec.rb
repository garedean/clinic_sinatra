require('spec_helper')

describe(Doctor) do
  describe('#first_name') do
    it("returns the doctor's first name") do
      doctor = Doctor.new(id: nil, first_name: "Bill", last_name: "Brasky", specialty_id: 1)
      expect(doctor.first_name).to(eq("Bill"))
    end
  end

  describe('#last_name') do
    it("returns the doctor's first name") do
      doctor = Doctor.new(id: nil, first_name: "Bill", last_name: "Brasky", specialty_id: 1)
      expect(doctor.last_name).to(eq("Brasky"))
    end
  end

  describe('#id') do
    it("returns the doctor's first name") do
      doctor = Doctor.new(id: nil, first_name: "Bill", last_name: "Brasky", specialty_id: 1)
      doctor.save()
      expect(doctor.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#specialty_id') do
    it("returns the doctor's first name") do
      doctor = Doctor.new(id: nil, first_name: "Bill", last_name: "Brasky", specialty_id: 1)
      expect(doctor.specialty_id).to(eq(1))
    end
  end

  describe('#save') do
    it("saves the doctor to doctor list") do
      doctor = Doctor.new(id: nil, first_name: "Bill", last_name: "Brasky", specialty_id: 1)
      doctor.save()
      expect(Doctor.all()).to(eq([doctor]))
    end
  end

  describe('.all') do
    it("is empty at first") do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe('#==') do
    it("is equal if doctor first name, last name, and specialty id is the same") do
      doctor = Doctor.new(id: nil, first_name: "Bill", last_name: "Brasky", specialty_id: 1)
      doctor.save()
      doctor1 = Doctor.new(id: nil, first_name: "Bill", last_name: "Brasky", specialty_id: 1)
      doctor1.save()
      expect(doctor1).to(eq(doctor))
    end
  end

end
