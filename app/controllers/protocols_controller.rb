class ProtocolsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  def index
    @protocols = Protocol.order("created_at desc").page(params[:page]).per_page(4)

    respond_to do |format|
      format.html
      format.json { render json: @protocols }
    end
  end

  def show
    @protocol = Protocol.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @protocol }
    end
  end

  def new
    @protocol = current_user.protocols.new
    @antibody = Antibody.find(params[:antibody_id])

    respond_to do |format|
      format.html
      format.json { render json: @protocol }
    end
  end

  def edit
    @protocol = current_user.protocols.find(params[:id])
  end

  def create
    @protocol = current_user.protocols.new(params[:protocol])
    @antibody = Antibody.find(params[:antibody_id])

    @protocol.antibody = @antibody

    respond_to do |format|
      if @protocol.save
        format.html { redirect_to @antibody, notice: 'Protocol was successfully created.' }
        format.json { render json: @protocol, status: :created, location: @protocol }
      else
        format.html { render action: "new" }
        format.json { render json: @protocol.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @protocol = current_user.protocols.find(params[:id])

    respond_to do |format|
      if @protocol.update_attributes(params[:protocol])
        format.html { redirect_to @protocol, notice: 'Protocol was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @protocol.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @protocol = current_user.protocols.find(params[:id])
    @protocol.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end
end
