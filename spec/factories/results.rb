FactoryBot.define do
  factory :result do
    patient_id { "" }
    height { 1 }
    body_weight { 1 }
    systolic_blood_pressure { 1 }
    diastolic_blood_pressure { 1 }
    abdominal_circumference { 1 }
    fat_percentage { 1 }
    wbc { 1 }
    rbc { 1 }
    hb { 1 }
    haematocrit { 1 }
    t_cho { 1 }
    hdl_cho { 1 }
    ldl_cho { 1 }
    tg { 1 }
    ast { 1 }
    alt { 1 }
    gamma_gtp { 1 }
    alp { 1 }
    t_bil { 1 }
    bun { 1 }
    creatinine { 1 }
    ua { 1 }
    bs { 1 }
    hba1c { "9.99" }
    e_gfr { "9.99" }
    tp { 1 }
    lap { 1 }
    che { "9.99" }
    serum_amylase { "9.99" }
    fe { "9.99" }
    hcv { "9.99" }
    cea { "9.99" }
    crp { "9.99" }
    mcv { "9.99" }
    mch { "9.99" }
    mchc { "9.99" }
    note { "MyText" }
  end
end
