require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  current_user = User.first_or_create(email:'ibrahim@mail.com', password:'123456', password_confirmation:'123456')
  

end
