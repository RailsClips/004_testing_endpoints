require 'rails_helper'

describe "Project endpoints for JSON API", type: :request do
  it "returns a list of projects" do
    project1 = create(:project)
    project2 = create(:project)
    project3 = create(:project)

    get "/api/v1/projects.json"

    projects = JSON.parse(response.body)
    expect(projects.size).to eq(3)
    0.upto(projects.size-1).each do |index|
      project = eval("project#{index+1}")
      expect(projects[index]["name"]).to eq(project.name)
      expect(projects[index]["id"]).to eq(project.id)
      expect(projects[index]["tasks"]).not_to be_nil
    end
  end

  it "returns a single project" do
    project = create(:project)

    get "/api/v1/project_#{project.id}.json"

    project_response = JSON.parse(response.body)
    expect(project_response["name"]).to eq(project.name)
    expect(project_response["id"]).to eq(project.id)
  end
end
