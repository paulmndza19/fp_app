class ClaimRequestsController < ApplicationController
  before_action :set_claim_request, only: %i[ show edit update destroy ]

  # GET /claim_requests or /claim_requests.json
  def index
    @claim_requests = current_user.claim_requests.includes(:user, :claim_request_type).page(params[:page])
  end

  # GET /claim_requests/1 or /claim_requests/1.json
  def show
  end

  # GET /claim_requests/new
  def new
    @claim_request = ClaimRequest.new
  end

  # GET /claim_requests/1/edit
  def edit
  end

  # POST /claim_requests or /claim_requests.json
  def create
    @claim_request = ClaimRequest.new(claim_request_params)
    @claim_request.document.attach(claim_request_params[:document])

    respond_to do |format|
      if @claim_request.save
        NewClaimRequestMailer.new_request(@claim_request).deliver_now

        format.html { redirect_to claim_requests_url, notice: "Claim request was successfully created." }
        format.json { render :show, status: :created, location: @claim_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @claim_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /claim_requests/1 or /claim_requests/1.json
  def update
    respond_to do |format|
      if @claim_request.update(claim_request_params)
        format.html { redirect_to claim_request_url(@claim_request), notice: "Claim request was successfully updated." }
        format.json { render :show, status: :ok, location: @claim_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @claim_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /claim_requests/1 or /claim_requests/1.json
  def destroy
    @claim_request.destroy!

    respond_to do |format|
      format.html { redirect_to claim_requests_url, notice: "Claim request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claim_request
      @claim_request = ClaimRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def claim_request_params
      params.require(:claim_request).permit(:user_id, :claim_request_type_id, :document)
    end
end
