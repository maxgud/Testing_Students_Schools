require 'rails_helper'

RSpec.describe Student, type: :model do
describe 'attributes' do
    it 'has a name' do
      name = 'Mary'
      student = Student.create(name: name)
      expect(student.name).to eq(name)
    end

    it 'has a address' do
      address = '123 Street BLVD'
      student = Student.create(address: address)
      expect(student.address).to eq(address)
    end

    # it { should respond_to :name } 
  end
  
  describe "association" do
    it { should have_one(:school) }
end

  describe "uniqueness" do
    Student.create(name: 'foo', student_number: '123', gpa: '3')
    it { should validate_uniqueness_of(:name) }
  end

  describe "numericality" do
    before(:each) do
      @student = Student.create(gpa: 3)
    end
    
     it { should validate_numericality_of(:gpa) }
  end 
end 