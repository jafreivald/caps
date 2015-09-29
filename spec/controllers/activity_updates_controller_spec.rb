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

RSpec.describe ActivityUpdatesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # ActivityUpdate. As you add validations to ActivityUpdate, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ActivityUpdatesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all activity_updates as @activity_updates" do
      activity_update = ActivityUpdate.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:activity_updates)).to eq([activity_update])
    end
  end

  describe "GET #show" do
    it "assigns the requested activity_update as @activity_update" do
      activity_update = ActivityUpdate.create! valid_attributes
      get :show, {:id => activity_update.to_param}, valid_session
      expect(assigns(:activity_update)).to eq(activity_update)
    end
  end

  describe "GET #new" do
    it "assigns a new activity_update as @activity_update" do
      get :new, {}, valid_session
      expect(assigns(:activity_update)).to be_a_new(ActivityUpdate)
    end
  end

  describe "GET #edit" do
    it "assigns the requested activity_update as @activity_update" do
      activity_update = ActivityUpdate.create! valid_attributes
      get :edit, {:id => activity_update.to_param}, valid_session
      expect(assigns(:activity_update)).to eq(activity_update)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ActivityUpdate" do
        expect {
          post :create, {:activity_update => valid_attributes}, valid_session
        }.to change(ActivityUpdate, :count).by(1)
      end

      it "assigns a newly created activity_update as @activity_update" do
        post :create, {:activity_update => valid_attributes}, valid_session
        expect(assigns(:activity_update)).to be_a(ActivityUpdate)
        expect(assigns(:activity_update)).to be_persisted
      end

      it "redirects to the created activity_update" do
        post :create, {:activity_update => valid_attributes}, valid_session
        expect(response).to redirect_to(ActivityUpdate.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved activity_update as @activity_update" do
        post :create, {:activity_update => invalid_attributes}, valid_session
        expect(assigns(:activity_update)).to be_a_new(ActivityUpdate)
      end

      it "re-renders the 'new' template" do
        post :create, {:activity_update => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested activity_update" do
        activity_update = ActivityUpdate.create! valid_attributes
        put :update, {:id => activity_update.to_param, :activity_update => new_attributes}, valid_session
        activity_update.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested activity_update as @activity_update" do
        activity_update = ActivityUpdate.create! valid_attributes
        put :update, {:id => activity_update.to_param, :activity_update => valid_attributes}, valid_session
        expect(assigns(:activity_update)).to eq(activity_update)
      end

      it "redirects to the activity_update" do
        activity_update = ActivityUpdate.create! valid_attributes
        put :update, {:id => activity_update.to_param, :activity_update => valid_attributes}, valid_session
        expect(response).to redirect_to(activity_update)
      end
    end

    context "with invalid params" do
      it "assigns the activity_update as @activity_update" do
        activity_update = ActivityUpdate.create! valid_attributes
        put :update, {:id => activity_update.to_param, :activity_update => invalid_attributes}, valid_session
        expect(assigns(:activity_update)).to eq(activity_update)
      end

      it "re-renders the 'edit' template" do
        activity_update = ActivityUpdate.create! valid_attributes
        put :update, {:id => activity_update.to_param, :activity_update => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested activity_update" do
      activity_update = ActivityUpdate.create! valid_attributes
      expect {
        delete :destroy, {:id => activity_update.to_param}, valid_session
      }.to change(ActivityUpdate, :count).by(-1)
    end

    it "redirects to the activity_updates list" do
      activity_update = ActivityUpdate.create! valid_attributes
      delete :destroy, {:id => activity_update.to_param}, valid_session
      expect(response).to redirect_to(activity_updates_url)
    end
  end

end