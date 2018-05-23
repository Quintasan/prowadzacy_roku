require 'rails_helper'

RSpec.describe Contestant, type: :model do
  context 'validations' do
    %i[name surname title].each do |attribute|
      it { is_expected.to validate_presence_of(attribute) }
    end
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(%i[surname title]) }
  end
end
