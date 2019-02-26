require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Relationships" do
    it { should have_many(:favorites) }
    it { should have_many(:champions).through(:favorites) }
  end

  describe "Validations" do

  end

end
