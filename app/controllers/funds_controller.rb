class FundsController < ApplicationController
  before_filter :parameters
  
  # GET /funds
  # GET /funds.json
  def index
    @title = t('view.funds.index_title')
    @searchable = true
    @funds = Fund.filtered_list(params[:q]).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @funds }
    end
  end

  # GET /funds/1
  # GET /funds/1.json
  def show
    @title = t('view.funds.show_title')
    @fund = Fund.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fund }
    end
  end

  # GET /funds/new
  # GET /funds/new.json
  def new
    @title = t('view.funds.new_title')
    @fund = Fund.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fund }
    end
  end

  # GET /funds/1/edit
  def edit
    @title = t('view.funds.edit_title')
    @fund = Fund.find(params[:id])
  end

  # POST /funds
  # POST /funds.json
  def create
    @title = t('view.funds.new_title')
    @fund = Fund.new(params[:fund])

    respond_to do |format|
      if @fund.save
        format.html { redirect_to @fund, notice: t('view.funds.correctly_created') }
        format.json { render json: @fund, status: :created, location: @fund }
      else
        format.html { render action: 'new' }
        format.json { render json: @fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /funds/1
  # PUT /funds/1.json
  def update
    @title = t('view.funds.edit_title')
    @fund = Fund.find(params[:id])

    respond_to do |format|
      if @fund.update_attributes(params[:fund])
        format.html { redirect_to @fund, notice: t('view.funds.correctly_updated') }
        format.json { head :ok }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fund.errors, status: :unprocessable_entity }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_fund_url(@fund), alert: t('view.funds.stale_object_error')
  end

  # DELETE /funds/1
  # DELETE /funds/1.json
  def destroy
    @fund = Fund.find(params[:id])
    @fund.destroy

    respond_to do |format|
      format.html { redirect_to funds_url }
      format.json { head :ok }
    end
  end

  private

  def parameters
    params.permit!  
  end
end
