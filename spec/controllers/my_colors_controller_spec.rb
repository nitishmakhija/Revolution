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

describe MyColorsController do

  # This should return the minimal set of attributes required to create a valid
  # MyColor. As you add validations to MyColor, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "name" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MyColorsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all my_colors as @my_colors" do
      my_color = MyColor.create! valid_attributes
      get :index, {}, valid_session
      assigns(:my_colors).should eq([my_color])
    end
  end

  describe "GET show" do
    it "assigns the requested my_color as @my_color" do
      my_color = MyColor.create! valid_attributes
      get :show, {:id => my_color.to_param}, valid_session
      assigns(:my_color).should eq(my_color)
    end
  end

  describe "GET new" do
    it "assigns a new my_color as @my_color" do
      get :new, {}, valid_session
      assigns(:my_color).should be_a_new(MyColor)
    end
  end

  describe "GET edit" do
    it "assigns the requested my_color as @my_color" do
      my_color = MyColor.create! valid_attributes
      get :edit, {:id => my_color.to_param}, valid_session
      assigns(:my_color).should eq(my_color)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new MyColor" do
        expect {
          post :create, {:my_color => valid_attributes}, valid_session
        }.to change(MyColor, :count).by(1)
      end

      it "assigns a newly created my_color as @my_color" do
        post :create, {:my_color => valid_attributes}, valid_session
        assigns(:my_color).should be_a(MyColor)
        assigns(:my_color).should be_persisted
      end

      it "redirects to the created my_color" do
        post :create, {:my_color => valid_attributes}, valid_session
        response.should redirect_to(MyColor.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved my_color as @my_color" do
        # Trigger the behavior that occurs when invalid params are submitted
        MyColor.any_instance.stub(:save).and_return(false)
        post :create, {:my_color => { "name" => "invalid value" }}, valid_session
        assigns(:my_color).should be_a_new(MyColor)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        MyColor.any_instance.stub(:save).and_return(false)
        post :create, {:my_color => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested my_color" do
        my_color = MyColor.create! valid_attributes
        # Assuming there are no other my_colors in the database, this
        # specifies that the MyColor created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        MyColor.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => my_color.to_param, :my_color => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested my_color as @my_color" do
        my_color = MyColor.create! valid_attributes
        put :update, {:id => my_color.to_param, :my_color => valid_attributes}, valid_session
        assigns(:my_color).should eq(my_color)
      end

      it "redirects to the my_color" do
        my_color = MyColor.create! valid_attributes
        put :update, {:id => my_color.to_param, :my_color => valid_attributes}, valid_session
        response.should redirect_to(my_color)
      end
    end

    describe "with invalid params" do
      it "assigns the my_color as @my_color" do
        my_color = MyColor.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        MyColor.any_instance.stub(:save).and_return(false)
        put :update, {:id => my_color.to_param, :my_color => { "name" => "invalid value" }}, valid_session
        assigns(:my_color).should eq(my_color)
      end

      it "re-renders the 'edit' template" do
        my_color = MyColor.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        MyColor.any_instance.stub(:save).and_return(false)
        put :update, {:id => my_color.to_param, :my_color => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested my_color" do
      my_color = MyColor.create! valid_attributes
      expect {
        delete :destroy, {:id => my_color.to_param}, valid_session
      }.to change(MyColor, :count).by(-1)
    end

    it "redirects to the my_colors list" do
      my_color = MyColor.create! valid_attributes
      delete :destroy, {:id => my_color.to_param}, valid_session
      response.should redirect_to(my_colors_url)
    end
  end

end
