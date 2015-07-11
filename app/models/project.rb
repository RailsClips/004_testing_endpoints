class Project < ActiveRecord::Base
  has_many :tasks

  validates_presence_of :name

  def as_json(options={})
    super({only: [:id, :name], include: :tasks}.merge(options))
  end
end
