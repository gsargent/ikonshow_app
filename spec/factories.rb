FactoryGirl.define do 


  # a valid user
  factory :user do 
    username               "joeuser"
    email                  { "#{username}@example.com" }
    password               "foobar"
    password_confirmation  "foobar"
  end


  trait :admin do
    username "bossey"
    after(:create) do |user|
      association :roles, factory: :user, :role => 'admin' 
    end
  end

  trait :teacher do
    username "tom"
  end    

  trait :parent do 
    username "paul"
  end

  factory :role do
    puts "inside :role factory-------"
    id 100
    name "__-__"  
  end

  factory :add_roll do
    roles { [ FactoryGirl.create(:role)] }
  end

end
