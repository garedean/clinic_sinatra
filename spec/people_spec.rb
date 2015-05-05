require "spec_helper"

describe(Patient) do
  describe('#first_name') do
    it("returns first name of the patient") do
      test_patient = Patient.new(first_name: 'john', last_name: 'denver', doctor_id: nil, birthdate: "2014-12-20")
      expect(test_patient.first_name()).to(eq('john'))
    end
  end

  describe('#last_name') do
    it("returns last name of the patient") do
      test_patient = Patient.new(first_name: 'john', last_name: 'denver', doctor_id: nil, birthdate: "2014-12-20")
      expect(test_patient.last_name()).to(eq('denver'))
    end
  end

end
