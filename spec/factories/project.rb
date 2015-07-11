FactoryGirl.define do
  sequence :project_name do |n|
    "project_#{n}"
  end

  sequence :task_name do |n|
    "task_#{n}"
  end

  factory :task do
    name { generate(:task_name) }
    due_at Date.today
    project
  end

  factory :project do
    name { generate(:project_name) }

    after(:create) do |project|
      create_list(:task, 3, project: project)
    end
  end
end
