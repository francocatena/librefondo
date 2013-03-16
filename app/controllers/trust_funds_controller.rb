class TrustFundsController < ApplicationController
  before_filter :parameters

  # GET /trust_funds
  # GET /trust_funds.json
  def index
    @title = t('view.trust_funds.index_title')
    @searchable = true
    @trust_funds = TrustFund.filtered_list(params[:q]).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trust_funds }
    end
  end

  # GET /trust_funds/1
  # GET /trust_funds/1.json
  def show
    @title = t('view.trust_funds.show_title')
    @trust_fund = TrustFund.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trust_fund }
    end
  end

  # GET /trust_funds/new
  # GET /trust_funds/new.json
  def new
    @title = t('view.trust_funds.new_title')
    @trust_fund = TrustFund.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trust_fund }
    end
  end

  # GET /trust_funds/1/edit
  def edit
    @title = t('view.trust_funds.edit_title')
    @trust_fund = TrustFund.find(params[:id])
  end

  # POST /trust_funds
  # POST /trust_funds.json
  def create
    @title = t('view.trust_funds.new_title')
    @trust_fund = TrustFund.new(params[:trust_fund])

    respond_to do |format|
      if @trust_fund.save
        format.html { redirect_to @trust_fund, notice: t('view.trust_funds.correctly_created') }
        format.json { render json: @trust_fund, status: :created, location: @trust_fund }
      else
        format.html { render action: 'new' }
        format.json { render json: @trust_fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trust_funds/1
  # PUT /trust_funds/1.json
  def update
    @title = t('view.trust_funds.edit_title')
    @trust_fund = TrustFund.find(params[:id])

    respond_to do |format|
      if @trust_fund.update_attributes(params[:trust_fund])
        format.html { redirect_to @trust_fund, notice: t('view.trust_funds.correctly_updated') }
        format.json { head :ok }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trust_fund.errors, status: :unprocessable_entity }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_trust_fund_url(@trust_fund), alert: t('view.trust_funds.stale_object_error')
  end

  # DELETE /trust_funds/1
  # DELETE /trust_funds/1.json
  def destroy
    @trust_fund = TrustFund.find(params[:id])
    @trust_fund.destroy

    respond_to do |format|
      format.html { redirect_to trust_funds_url }
      format.json { head :ok }
    end
  end


  private

  def parameters
    params.permit!
  end
end
