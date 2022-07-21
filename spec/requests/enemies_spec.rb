require 'rails_helper'

RSpec.describe "Enemies", type: :request do
  describe "PUT /enemies" do
    context "when the enemy exists" do
      let(:enemy) { create(:enemy) }
      let(:enemy_attributes) { attributes_for(:enemy) }

      before(:each) { put "/enemies/#{enemy.id}", params: enemy_attributes }


      it "returns status code 200" do
        ## essas linhas deixam de existir pois estamos utilizando o let e o before para utilizar o DRY
        #enemy = create(:enemy)
        #enemy_attributes = attributes_for(:enemy)
        #put "/enemies/#{enemy.id}", params: enemy_attributes
        expect(response).to have_http_status(200)
      end

      it "updates the enemy" do
      expect(enemy.reload).to have_attributes(enemy_attributes)
      end
      it "returns te enemy updated" do 
        #json_response = JSON.parse(response.body) essa linha foi substituida pelo helper do json
        expect(enemy.reload).to have_attributes(json.except('created_at', 'updated_at')) #aqui podemos utilizar apenas o json.
      end
    end

    context "when the enemy dos not exist" do 
      before(:each) { put "/enemies/0", params: attributes_for(:enemy) }

      it "returns status code 404" do
        
        ## esse put foi substituido pelo before
        #put "/enemies/0", params: attributes_for(:enemy)
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do 
        expect(response.body).to match(/Couldn't find Enemy/)
      end
    end
  end

  describe "DELETE /enemies" do
    context "when the enemy exists" do
      let(:enemy) { create(:enemy) }
      
      before(:each) { delete "/enemies/#{enemy.id}" }

      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end
      it "destroy the record" do
        expect { enemy.reload }.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context "when the enemy does not exist" do

      before(:each) { delete "/enemies/0" }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Enemy/)
      end
    end
  end
end
