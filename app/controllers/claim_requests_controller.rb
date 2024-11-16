class ClaimRequestsController < ApplicationController
  before_action :set_claim_request, only: %i[ show edit update destroy]

  BASE_BENEFIT = 4608
  ADDITIONAL_RETIREMENT_VALUE = 241.77

  RANGE_TO_VALUE_MAP = {
    (13..24) => 4608,
    (25..36) => 4849.77,
    (37..48) => 5091.54,
    (49..60) => 5333.31,
    (61..72) => 5575.08,
    (73..84) => 5816.85,
    (85..96) => 6058.62,
    (97..108) => 6300.39,
    (109..120) => 6542.16,
    (121..132) => 6783.93,
    (133..144) => 7025.70,
    (145..156) => 7267.47,
    (157..168) => 7509.24,
    (169..180) => 7751.01
  }.freeze

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

    @claim_request_type = ClaimRequestType.find(claim_request_params[:claim_request_type_id])
    if @claim_request_type.name != 'Retirement'
      @claim_request.amount = @claim_request_type.amount
    else
      contribution_count = current_user.contributions.count

      if contribution_count < 13
        @claim_request.amount = ClaimRequest::BASE_BENEFIT
      else
        base_value = ClaimRequest::RANGE_TO_VALUE_MAP.select { |range, _| range.include?(contribution_count) }.values.first
        @claim_request.amount = base_value + ClaimRequest::ADDITIONAL_RETIREMENT_VALUE
      end
    end

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
