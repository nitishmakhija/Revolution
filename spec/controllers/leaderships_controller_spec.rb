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

describe LeadershipsController do

  # This should return the minimal set of attributes required to create a valid
  # Leadership. As you add validations to Leadership, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "leadable_id" => "1" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LeadershipsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all leaderships as @leaderships" do
      leadership = Leadership.create! valid_attributes
      get :index, {}, valid_session
      assigns(:leaderships).should eq([leadership])
    end
  end

  describe "GET show" do
    it "assigns the requested leadership as @leadership" do
      leadership = Leadership.create! valid_attributes
      get :show, {:id => leadership.to_param}, valid_session
      assigns(:leadership).should eq(leadership)
    end
  end

  describe "GET new" do
    it "assigns a new leadership as @leadership" do
      get :new, {}, valid_session
      assigns(:leadership).should be_a_new(Leadership)
    end
  end

  describe "GET edit" do
    it "assigns the requested leadership as @leadership" do
      leadership = Leadership.create! valid_attributes
      get :edit, {:id => leadership.to_param}, valid_session
      assigns(:leadership).should eq(leadership)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Leadership" do
        expect {
          post :create, {:leadership => valid_attributes}, valid_session
        }.to change(Leadership, :count).by(1)
      end

      it "assigns a newly created leadership as @leadership" do
        post :create, {:leadership => valid_attributes}, valid_session
        assigns(:leadership).should be_a(Leadership)
        assigns(:leadership).should be_persisted
      end

      it "redirects to the created leadership" do
        post :create, {:leadership => valid_attributes}, valid_session
        response.should redirect_to(Leadership.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved leadership as @leadership" do
        # Trigger the behavior that occurs when invalid params are submitted
        Leadership.any_instance.stub(:save).and_return(false)
        post :create, {:leadership => { "leadable_id" => "invalid value" }}, valid_session
        assigns(:leadership).should be_a_new(Leadership)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Leadership.any_instance.stub(:save).and_return(false)
        post :create, {:leadership => { "leadable_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested leadership" do
        leadership = Leadership.create! valid_attributes
        # Assuming there are no other leaderships in the database, this
        # specifies that the Leadership created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Leadership.any_instance.should_receive(:update).with({ "leadable_id" => "1" })
        put :update, {:id => leadership.to_param, :leadership => { "leadable_id" => "1" }}, valid_session
      end

      it "assigns the requested leadership as @leadership" do
        leadership = Leadership.create! valid_attributes
        put :update, {:id => leadership.to_param, :leadership => valid_attributes}, valid_session
        assigns(:leadership).should eq(leadership)
      end

      it "redirects to the leadership" do
        leadership = Leadership.create! valid_attributes
        put :update, {:id => leadership.to_param, :leadership => valid_attributes}, valid_session
        response.should redirect_to(leadership)
      end
    end

    describe "with invalid params" do
      it "assigns the leadership as @leadership" do
        leadership = Leadership.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Leadership.any_instance.stub(:save).and_return(false)
        put :update, {:id => leadership.to_param, :leadership => { "leadable_id" => "invalid value" }}, valid_session
        assigns(:leadership).should eq(leadership)
      end

      it "re-renders the 'edit' template" do
        leadership = Leadership.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Leadership.any_instance.stub(:save).and_return(false)
        put :update, {:id => leadership.to_param, :leadership => { "leadable_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested leadership" do
      leadership = Leadership.create! valid_attributes
      expect {
        delete :destroy, {:id => leadership.to_param}, valid_session
      }.to change(Leadership, :count).by(-1)
    end

    it "redirects to the leaderships list" do
      leadership = Leadership.create! valid_attributes
      delete :destroy, {:id => leadership.to_param}, valid_session
      response.should redirect_to(leaderships_url)
    end
  end

end
