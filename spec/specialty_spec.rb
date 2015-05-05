require 'spec_helper'

describe(Specialty) do
  describe('#type') do
    it('returns the type of specialty') do
      specialty1 = Specialty.new(type: "brain surgeon", id: nil)
      expect(specialty1.type()).to(eq("brain surgeon"))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Specialty.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the specialty to specialty list') do
      specialty1 = Specialty.new(type: "brain surgeon", id: nil)
      specialty1.save()
      expect(Specialty.all()).to(eq([specialty1]))
    end
  end

  describe('.clear') do
    it('clears all specialties from the database') do
      specialty1 = Specialty.new(type: "brain surgeon", id: nil)
      specialty1.save()
      Specialty.clear()
      expect(Specialty.all()).to(eq([]))
    end
  end
end
