FactoryGirl.define do 


  # a valid user
  factory :user do 
    username               "joeuser2"
    email                  { "#{username}@example.com" }
    password               "password"
    password_confirmation  "password"
  end


  trait :admin do
    username "bossey"
    after(:create) do |user|
      #FactoryGirl.create :role, factory: :user, :role => 'admin' 
      # FactoryGirl.create :role, user: user    #, :role => 'admin' 
      user.roles << Role.find_by_name('teacher')
    end
  end

  trait :teacher do
    username "tom"
  end    

  trait :parent do 
    username "paul"
  end

  factory :role do
    id 10
    name "ten ten"  
  end

  factory :user_with_roll do
    rolls { [ FactoryGirl.create(:role, :admin)] }
  end

end
