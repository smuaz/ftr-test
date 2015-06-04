class ComplaintsController < ApplicationController
  before_action :set_complaint, only: [:show, :edit, :update, :vote]
  before_action :require_user, except: [:show, :index]
  before_action :require_creator, only: [:edit, :update]

  def index
    @complaints = Complaint.all.sort.reverse
  end

  def new
    @complaint = Complaint.new
  end

  def create
    @complaint = Complaint.new(complaint_params)
    @complaint.status_id = 1

    if current_user.is_a? Admin
      @complaint.admin = current_user
    else
      @complaint.user = current_user
    end

    if @complaint.save
      flash[:success] = "Your complaint has been submitted."
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def edit
    
  end

  def update
    if @complaint.update(complaint_params)
      flash[:success] = "This complaint was updated."
      redirect_to complaint_path(@complaint)
    else
      render :edit
    end  
  end

  def vote
    @vote = Vote.create(voteable: @complaint, user: current_user, vote: params[:vote])

    respond_to do |format|
      format.html do
        if @vote.valid?
          flash[:success] = "Your vote was counted."
        else
          flash[:danger] = "You can only vote once."
        end
      end
      format.js
    end
  end

  def my
    
  end

  private

  def complaint_params
    params.require(:complaint).permit!
  end

  def set_complaint
    @complaint = Complaint.find_by slug: params[:id]
  end

  def require_creator
    access_denied unless (logged_in? and (current_user == @complaint.user)) or admin?
  end
end