class CoupansController < ApplicationController
  before_action :set_coupan, only: [:show, :edit, :update, :destroy]

  # GET /coupans
  # GET /coupans.json
  def index
    @coupans = Coupan.all
  end

  # GET /coupans/1
  # GET /coupans/1.json
  def show
  end

  # GET /coupans/new
  def new
    @coupan = Coupan.new
  end

  # GET /coupans/1/edit
  def edit
  end

  # POST /coupans
  # POST /coupans.json
  def create
    @coupan = Coupan.new(coupan_params)

    respond_to do |format|
      if @coupan.save
        format.html { redirect_to @coupan, notice: 'Coupan was successfully created.' }
        format.json { render :show, status: :created, location: @coupan }
      else
        format.html { render :new }
        format.json { render json: @coupan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupans/1
  # PATCH/PUT /coupans/1.json
  def update
    respond_to do |format|
      if @coupan.update(coupan_params)
        format.html { redirect_to @coupan, notice: 'Coupan was successfully updated.' }
        format.json { render :show, status: :ok, location: @coupan }
      else
        format.html { render :edit }
        format.json { render json: @coupan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupans/1
  # DELETE /coupans/1.json
  def destroy
    @coupan.destroy
    respond_to do |format|
      format.html { redirect_to coupans_url, notice: 'Coupan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupan
      @coupan = Coupan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coupan_params
      params.require(:coupan).permit(:code, :discount, :expriry_date)
    end
end
