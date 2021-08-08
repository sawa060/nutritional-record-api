if Rails.env.development?
  # ユーザー
  user_params = {
    name: "テストユーザー",
    email: "test@test.jp",
    password: "Test1234"
  }
  user = User.create!(user_params)

  # 患者
  PATIENT_NUMBER = 3
  PATIENT_NUMBER.times do |index|
    patient_params = {
      name: "患者テスト#{index}",
      sex: "male",
      email: "test#{index}@test.jp",
      phone_number: "090-0000-0000",
      number: "0000#{index}",
      birthday: "1980-01-01"
    }
    Patient.create!(patient_params)
  end

  # 問診記録（behavior）
  Behavior.create!(
    patient_id: Patient.first.id,
    smoking: "なし",
    drinking: "なし",
    exercise_habits: "週1回30分",
    breakfast: "毎日",
    sleeping: "7時間",
  )

  # 指導記録（records）
  Record.create!(
    user_id: User.first.id,
    patient_id: Patient.first.id,
    subjective: "主訴（S）テスト",
    objective: "Oテスト",
    assessment: "Aテスト",
    plan: "Pテスト",
    note: "備考テスト"
  )

  Result.create!(
    patient_id: Patient.first.id,
    height: 170,
    body_weight: 60,
    systolic_blood_pressure: 150,
    diastolic_blood_pressure: 95,
    abdominal_circumference: 90,
    fat_percentage: 30,
    # wbc:
    # rbc:
    # hb:
    # haematocrit:
    # t_cho:
    # hdl_cho:
    # ldl_cho:
    # tg:
    # ast:
    # alt:
    # gamma_gtp:
    # alp:
    # t_bil:
    # bun:
    # creatinine:
    # ua:
    # bs:
    # hba1c:
    # e_gfr:
    # tp:
    # lap:
    # che:
    # serum_amylase:
    # fe:
    # hcv:
    # cea:
    # crp:
    # mcv:
    # mch:
    # mchc:
    note: "備考サンプル"
  )
end
