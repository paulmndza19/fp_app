class ClaimRequestTypesController < ApplicationController
  before_action :set_claim_request_type, only: %i[ show edit update destroy ]

  # GET /claim_request_types or /claim_request_types.json
  def index
    @claim_request_types = ClaimRequestType.all
  end

  # GET /claim_request_types/1 or /claim_request_types/1.json
  def show
  end

  # GET /claim_request_types/new
  def new
    @claim_request_type = ClaimRequestType.new
  end

  # GET /claim_request_types/1/edit
  def edit
  end

  # POST /claim_request_types or /claim_request_types.json
  def create
    @claim_request_type = ClaimRequestType.new(claim_request_type_params)

    respond_to do |format|
      if @claim_request_type.save
        format.html { redirect_to claim_request_type_url(@claim_request_type), notice: "Claim request type was successfully created." }
        format.json { render :show, status: :created, location: @claim_request_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @claim_request_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /claim_request_types/1 or /claim_request_types/1.json
  def update
    respond_to do |format|
      if @claim_request_type.update(claim_request_type_params)
        format.html { redirect_to claim_request_type_url(@claim_request_type), notice: "Claim request type was successfully updated." }
        format.json { render :show, status: :ok, location: @claim_request_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @claim_request_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /claim_request_types/1 or /claim_request_types/1.json
  def destroy
    @claim_request_type.destroy!

    respond_to do |format|
      format.html { redirect_to claim_request_types_url, notice: "Claim request type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claim_request_type
      @claim_request_type = ClaimRequestType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def claim_request_type_params
      params.require(:claim_request_type).permit(:name)
    end
end
