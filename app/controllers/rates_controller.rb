class RatesController < ApplicationController
  
  # GET /rates
  # GET /rates.json
  def index
    @title = t('view.rates.index_title')
    @rates = Rate.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rates }
    end
  end

  # GET /rates/1
  # GET /rates/1.json
  def show
    @title = t('view.rates.show_title')
    @rate = Rate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rate }
    end
  end

  # GET /rates/new
  # GET /rates/new.json
  def new
    @title = t('view.rates.new_title')
    @rate = Rate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rate }
    end
  end

  # GET /rates/1/edit
  def edit
    @title = t('view.rates.edit_title')
    @rate = Rate.find(params[:id])
  end

  # POST /rates
  # POST /rates.json
  def create
    @title = t('view.rates.new_title')
    @rate = Rate.new(params[:rate])

    respond_to do |format|
      if @rate.save
        format.html { redirect_to @rate, notice: t('view.rates.correctly_created') }
        format.json { render json: @rate, status: :created, location: @rate }
      else
        format.html { render action: 'new' }
        format.json { render json: @rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rates/1
  # PUT /rates/1.json
  def update
    @title = t('view.rates.edit_title')
    @rate = Rate.find(params[:id])

    respond_to do |format|
      if @rate.update_attributes(params[:rate])
        format.html { redirect_to @rate, notice: t('view.rates.correctly_updated') }
        format.json { head :ok }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rate.errors, status: :unprocessable_entity }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_rate_url(@rate), alert: t('view.rates.stale_object_error')
  end

  # DELETE /rates/1
  # DELETE /rates/1.json
  def destroy
    @rate = Rate.find(params[:id])
    @rate.destroy

    respond_to do |format|
      format.html { redirect_to rates_url }
      format.json { head :ok }
    end
  end
end
