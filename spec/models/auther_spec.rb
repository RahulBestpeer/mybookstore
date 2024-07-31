require 'rails_helper'

RSpec.describe Author, type: :model do

  describe ' Model.Author' do
    let(:author1) { FactoryBot.create :author }

    describe 'must be valid ' do

      context "Author name text case" do 
        it 'name must be valid' do
          expect(author1).to be_valid
        end
        it 'name presente error message must be' do
          author1.name = nil
          author1.save
          expect(author1.errors[:name]).to include("can't be blank")
        end
        it 'is valid with a unique name' do
          author2 = Author.new(name: author1.name, dob:Date.new)

          expect(author1).to be_valid
          expect(author2).not_to be_valid
          expect(author2.errors[:name]).to include('has already been taken')
        end
      end

      context "Author Date of Birth text case" do 
        it 'DOB must be valid' do
          expect(author1).to be_valid
        end
        it 'DOB not presente error message must be' do
          author1 = Author.new(name:"fssfsf", dob:"")
          author1.save
          expect(author1.errors[:dob]).to include("can't be blank")
        end
        

      end
    end
  end
end
