class AntibodiesController < ApplicationController
  # GET /antibodies
  # GET /antibodies.json
  def index
    @antibodies = Antibody.page(params[:page]).per_page(8).find_with_reputation(:votes, :all, order: "votes desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @antibodies }
    end
  end

  # GET /antibodies/1
  # GET /antibodies/1.json
  def show
    @antibody = Antibody.find(params[:id])
    if user_signed_in? 
      @protocols = @antibody.protocols.paginate(page: params[:page]).per_page(5)
    else
      @antibody
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @antibody }
    end
  end

  # GET /antibodies/new
  # GET /antibodies/new.json
  def new
    @antibody = Antibody.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @antibody }
    end
  end

  # GET /antibodies/1/edit
  def edit
    @antibody = Antibody.find(params[:id])
  end

  # POST /antibodies
  # POST /antibodies.json
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

  # PUT /antibodies/1
  # PUT /antibodies/1.json
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

  # DELETE /antibodies/1
  # DELETE /antibodies/1.json
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
