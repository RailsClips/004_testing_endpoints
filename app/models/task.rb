class Task < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :name

  def complete
    update_attribute(:completed, true)
  end

  def as_json(option={})
    super(only: [:id, :name, :due_at])
  end
end
