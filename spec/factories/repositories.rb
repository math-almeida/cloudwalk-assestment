FactoryBot.define do
  factory :repository do
    name { 'Repo teste'}
    url { "https://github.com/teste/repo_teste" }
    stars { 1 }
  end
end
