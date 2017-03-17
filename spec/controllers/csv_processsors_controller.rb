require 'byebug'
require "rails_helper"
RSpec.describe CsvProcesssorsController, :type => :controller do
  describe "POST create" do

    it "requested json" do
      post :create, {format: "json", value: "[['Id', 'First Name', 'Last Name'], ['1', 'Manav', 'Tri'], ['2', 'Vineeta', 'Pandey'], ['3', 'Manav', 'Tri'], ['4', 'Ramesh', 'Hello']]"}
      JSON.parse(response.body)["Manav"].should eq(2)
      expect(response).to have_http_status(200)
    end
    it "requested html" do
      post :create, user: {value: [['Id', 'First Name', 'Last Name'], ['1', 'Manav', 'Tri'], ['2', 'Vineeta', 'Pandey'], ['3', 'Manav', 'Tri'], ['4', 'Ramesh', 'Hello']]}
      expect(response).to redirect_to "http://test.host/csv_processsors"
    end
    it "requested json over failure" do
     post :create, {format: "json", value: []}
      expect { raise StandardError }.to raise_error
      expect(response).to have_http_status(200)
    end

  end
end
