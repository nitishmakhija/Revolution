class InquiriesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_inquiry, only: [:show, :edit, :update, :destroy]

  # GET /inquiries
  def index
    @q = Inquiry.page(params[:page]).search(params[:q])
    @inquiries = @q.result(distinct: true)
  end

  # GET /inquiries/1
  def show
  end

  # GET /inquiries/new
  def new
    # @inquiry = Inquiry.new
    @groups = SmallGroup.inquirable
    @person = Person.find(params[:person_id])
  end

  # GET /inquiries/1/edit
  def edit
  end

  # POST /inquiries
  def create
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save
      redirect_to @inquiry, notice: 'Inquiry was successfully created.'
    else
      render action: 'new'
    end
  end
  
  def create_multiple
    # @clazz = params[:contactable_type]
    # @contactable = @clazz.constantize.find(params[:contactable_id]) if @clazz
    person_id = params[:person_id]
    @person = Person.find(person_id)
    number_saved = 0
    groups = params[:groups]
    groups.each_value do |attributes|
      if attributes[:included] == "1"
        inquiry = Inquiry.new(person_id: person_id, group_id: attributes[:group_id])
        if inquiry.save!
          number_saved += 1
          InquiryMailer.notification(inquiry, current_user).deliver!
        end
      end
    end
    flash[:notice] = "#{number_saved} inquiries were successfully created."
    redirect_to @person || root_url
  end
  

  # PATCH/PUT /inquiries/1
  def update
    if @inquiry.update(inquiry_params)
      redirect_to @inquiry, notice: 'Inquiry was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /inquiries/1
  def destroy
    @inquiry.destroy
    redirect_to inquiries_url, notice: 'Inquiry was successfully destroyed.'
  end
  
  def notify_group_leaders
    @q = Inquiry.search(params[:q])
    @inquiries = @q.result(distinct: true)
    @grouped = @inquiries.group_by {|i, inquiries| i.group_id}
    @grouped.each do |group_id, inquiries|
      @group = Group.find(group_id)
      people_ids = inquiries.collect {|a| a.person_id}.uniq
      InquiryMailer.notify_group_leader(@group, people_ids, current_user).deliver! if @group.primary_leaderships.present?
    end
    redirect_to inquiries_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inquiry
      @inquiry = Inquiry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def inquiry_params
      params.require(:inquiry).permit(:person_id, :group_id, :created_by, :updated_by)
    end
end
