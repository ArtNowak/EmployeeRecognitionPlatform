FactoryBot.define do
  factory :kudo do
    title { 'Title_kudo' }
    content { 'Content_kudo' }
    giver { create(:employee) }
    receiver { create(:employee) }
  end
end
