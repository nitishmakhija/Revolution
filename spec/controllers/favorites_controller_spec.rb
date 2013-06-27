require 'spec_helper'

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

describe FavoritesController do

  # This should return the minimal set of attributes required to create a valid
  # Favorite. As you add validations to Favorite, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "favoritable" => "" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FavoritesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all favorites as @favorites" do
      favorite = Favorite.create! valid_attributes
      get :index, {}, valid_session
      assigns(:favorites).should eq([favorite])
    end
  end

  describe "GET show" do
    it "assigns the requested favorite as @favorite" do
      favorite = Favorite.create! valid_attributes
      get :show, {:id => favorite.to_param}, valid_session
      assigns(:favorite).should eq(favorite)
    end
  end

  describe "GET new" do
    it "assigns a new favorite as @favorite" do
      get :new, {}, valid_session
      assigns(:favorite).should be_a_new(Favorite)
    end
  end

  describe "GET edit" do
    it "assigns the requested favorite as @favorite" do
      favorite = Favorite.create! valid_attributes
      get :edit, {:id => favorite.to_param}, valid_session
      assigns(:favorite).should eq(favorite)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Favorite" do
        expect {
          post :create, {:favorite => valid_attributes}, valid_session
        }.to change(Favorite, :count).by(1)
      end

      it "assigns a newly created favorite as @favorite" do
        post :create, {:favorite => valid_attributes}, valid_session
        assigns(:favorite).should be_a(Favorite)
        assigns(:favorite).should be_persisted
      end

      it "redirects to the created favorite" do
        post :create, {:favorite => valid_attributes}, valid_session
        response.should redirect_to(Favorite.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved favorite as @favorite" do
        # Trigger the behavior that occurs when invalid params are submitted
        Favorite.any_instance.stub(:save).and_return(false)
        post :create, {:favorite => { "favoritable" => "invalid value" }}, valid_session
        assigns(:favorite).should be_a_new(Favorite)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Favorite.any_instance.stub(:save).and_return(false)
        post :create, {:favorite => { "favoritable" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested favorite" do
        favorite = Favorite.create! valid_attributes
        # Assuming there are no other favorites in the database, this
        # specifies that the Favorite created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Favorite.any_instance.should_receive(:update).with({ "favoritable" => "" })
        put :update, {:id => favorite.to_param, :favorite => { "favoritable" => "" }}, valid_session
      end

      it "assigns the requested favorite as @favorite" do
        favorite = Favorite.create! valid_attributes
        put :update, {:id => favorite.to_param, :favorite => valid_attributes}, valid_session
        assigns(:favorite).should eq(favorite)
      end

      it "redirects to the favorite" do
        favorite = Favorite.create! valid_attributes
        put :update, {:id => favorite.to_param, :favorite => valid_attributes}, valid_session
        response.should redirect_to(favorite)
      end
    end

    describe "with invalid params" do
      it "assigns the favorite as @favorite" do
        favorite = Favorite.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Favorite.any_instance.stub(:save).and_return(false)
        put :update, {:id => favorite.to_param, :favorite => { "favoritable" => "invalid value" }}, valid_session
        assigns(:favorite).should eq(favorite)
      end

      it "re-renders the 'edit' template" do
        favorite = Favorite.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Favorite.any_instance.stub(:save).and_return(false)
        put :update, {:id => favorite.to_param, :favorite => { "favoritable" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested favorite" do
      favorite = Favorite.create! valid_attributes
      expect {
        delete :destroy, {:id => favorite.to_param}, valid_session
      }.to change(Favorite, :count).by(-1)
    end

    it "redirects to the favorites list" do
      favorite = Favorite.create! valid_attributes
      delete :destroy, {:id => favorite.to_param}, valid_session
      response.should redirect_to(favorites_url)
    end
  end

end
