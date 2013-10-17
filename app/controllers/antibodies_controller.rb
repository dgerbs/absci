class AntibodiesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @search = Antibody.search(params[:q])
    @antibodies = @search.result.page(params[:page]).per_page(20).find_with_reputation(:votes, :all, order: "votes desc")

    respond_to do |format|
      format.html
      format.json { render json: @antibodies }
    end
  end

  def show
    @antibodies = @search.result

    @antibody = Antibody.find(params[:id])
    if user_signed_in? 
      @protocols = @antibody.protocols.paginate(page: params[:page]).per_page(5)
    else
      @antibody
    end
    respond_to do |format|
      format.html
      format.json { render json: @antibody }
    end
  end

  def new
    @antibody = Antibody.new

    respond_to do |format|
      format.html
      format.json { render json: @antibody }
    end
  end

  def edit
    if user_signed_in?
      @antibody
    else
      @antibody
    end
  end

  def create
    @antibody = Antibody.new(params[:antibody])

    respond_to do |format|
      if @antibody.save
        format.html { redirect_to @antibody, notice: 'Antibody was successfully created.' }
        format.json { render json: @antibody, status: :created, location: @antibody }
      else
        format.html { render action: "new" }
        format.json { render json: @antibody.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @antibody = Antibody.find(params[:id])

    respond_to do |format|
      if @antibody.update_attributes(params[:antibody])
        format.html { redirect_to @antibody, notice: 'Antibody was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @antibody.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @antibody = Antibody.find(params[:id])
    @antibody.destroy

    respond_to do |format|
      format.html { redirect_to antibodies_url }
      format.json { head :no_content }
    end
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @antibody = Antibody.find(params[:id])
    @antibody.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank you for your rating!"
  end
end
