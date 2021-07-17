FactoryBot.define do
  factory :record do
    user_id { "" }
    patient_id { "" }
    subjective { "MyText" }
    objective { "MyText" }
    assessment { "MyText" }
    plan { "MyText" }
    note { "MyText" }
  end
end
