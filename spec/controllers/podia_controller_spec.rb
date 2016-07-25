# == Schema Information
#
# Table name: podia
#
#  created_at  :datetime         not null
#  end_date_at :datetime         not null
#  id          :integer          not null, primary key
#  updated_at  :datetime         not null
#

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe PodiaController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Podium. As you add validations to Podium, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PodiaController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all podia as @podia" do
      podium = Podium.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:podia)).to eq([podium])
    end
  end

  describe "GET #show" do
    it "assigns the requested podium as @podium" do
      podium = Podium.create! valid_attributes
      get :show, {:id => podium.to_param}, valid_session
      expect(assigns(:podium)).to eq(podium)
    end
  end

  describe "GET #new" do
    it "assigns a new podium as @podium" do
      get :new, {}, valid_session
      expect(assigns(:podium)).to be_a_new(Podium)
    end
  end

  describe "GET #edit" do
    it "assigns the requested podium as @podium" do
      podium = Podium.create! valid_attributes
      get :edit, {:id => podium.to_param}, valid_session
      expect(assigns(:podium)).to eq(podium)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Podium" do
        expect {
          post :create, {:podium => valid_attributes}, valid_session
        }.to change(Podium, :count).by(1)
      end

      it "assigns a newly created podium as @podium" do
        post :create, {:podium => valid_attributes}, valid_session
        expect(assigns(:podium)).to be_a(Podium)
        expect(assigns(:podium)).to be_persisted
      end

      it "redirects to the created podium" do
        post :create, {:podium => valid_attributes}, valid_session
        expect(response).to redirect_to(Podium.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved podium as @podium" do
        post :create, {:podium => invalid_attributes}, valid_session
        expect(assigns(:podium)).to be_a_new(Podium)
      end

      it "re-renders the 'new' template" do
        post :create, {:podium => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested podium" do
        podium = Podium.create! valid_attributes
        put :update, {:id => podium.to_param, :podium => new_attributes}, valid_session
        podium.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested podium as @podium" do
        podium = Podium.create! valid_attributes
        put :update, {:id => podium.to_param, :podium => valid_attributes}, valid_session
        expect(assigns(:podium)).to eq(podium)
      end

      it "redirects to the podium" do
        podium = Podium.create! valid_attributes
        put :update, {:id => podium.to_param, :podium => valid_attributes}, valid_session
        expect(response).to redirect_to(podium)
      end
    end

    context "with invalid params" do
      it "assigns the podium as @podium" do
        podium = Podium.create! valid_attributes
        put :update, {:id => podium.to_param, :podium => invalid_attributes}, valid_session
        expect(assigns(:podium)).to eq(podium)
      end

      it "re-renders the 'edit' template" do
        podium = Podium.create! valid_attributes
        put :update, {:id => podium.to_param, :podium => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested podium" do
      podium = Podium.create! valid_attributes
      expect {
        delete :destroy, {:id => podium.to_param}, valid_session
      }.to change(Podium, :count).by(-1)
    end

    it "redirects to the podia list" do
      podium = Podium.create! valid_attributes
      delete :destroy, {:id => podium.to_param}, valid_session
      expect(response).to redirect_to(podia_url)
    end
  end

end