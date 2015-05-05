require('spec_helper')

describe(Doctor) do
  describe('#first_name') do
    it("returns the doctor's first name") do
      doctor = Doctor.new(id: nil, first_name: "Bill", last_name: "Brasky", specialty_id: 1)
      expect(doctor.first_name).to(eq("Bill"))
    end
  end
end
