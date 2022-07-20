require 'rails_helper'

RSpec.describe "Weapons", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get weapons_path
      expect(response).to have_http_status(200)
    end


    it "renders the index template" do
      weapons = create_list(:weapon, 3)
      get weapons_path
      expect(response).to render_template("index")
    end

    it "names are corectly showed" do
      weapons = create_list(:weapon, 3)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include(weapon.name)
      end
    end
    it "current powers are showed" do
      weapons = create_list(:weapon, 3)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include(weapon.currentpower.to_s)
      end
    end
    it "current titles are showed" do
      weapons = create_list(:weapon, 3)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include(weapon.title)
      end
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get weapons_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    context "when it has valid parameters" do
      it "creates the weapon with correct attributes" do
        weapon_attributes = FactoryBot.attributes_for(:weapon)
        post weapons_url, params: { weapon: weapon_attributes }
        expect(Weapon.last).to have_attributes(weapon_attributes)
      end
    end
  
    context "when ir has no valid parameters" do 
      it "does not create weapon" do
        expect{
          post weapons_url, params: { weapon: {name: '', description: '', powerbase: '', powerstep: '', level: '', currentpower: '', title: ''}}
        }.to_not change(Weapon, :count)
      end
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get weapons_path
      expect(response).to have_http_status(200)
    end

    it "must have attributes" do
      weapons = create_list(:weapon, 3)
      weapons.each do |weapon|
        params = { weapon: {name: weapon.name, description: weapon.description, powerbase: weapon.powerbase, powerstep: weapon.powerstep, level: weapon.level, currentpower: weapon.currentpower, title: weapon.title}}
        expect(weapon).to have_attributes(params[:weapon])
      end
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get weapons_path
      expect(response).to have_http_status(200)
    end
  end

end
