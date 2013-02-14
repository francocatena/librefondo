class KindsController < ApplicationController
  
  # GET /kinds
  # GET /kinds.json
  def index
    @title = t('view.kinds.index_title')
    @kinds = Kind.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @kinds }
    end
  end

  # GET /kinds/1
  # GET /kinds/1.json
  def show
    @title = t('view.kinds.show_title')
    @kind = Kind.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kind }
    end
  end

  # GET /kinds/new
  # GET /kinds/new.json
  def new
    @title = t('view.kinds.new_title')
    @kind = Kind.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @kind }
    end
  end

  # GET /kinds/1/edit
  def edit
    @title = t('view.kinds.edit_title')
    @kind = Kind.find(params[:id])
  end

  # POST /kinds
  # POST /kinds.json
  def create
    @title = t('view.kinds.new_title')
    @kind = Kind.new(params[:kind])

    respond_to do |format|
      if @kind.save
        format.html { redirect_to @kind, notice: t('view.kinds.correctly_created') }
        format.json { render json: @kind, status: :created, location: @kind }
      else
        format.html { render action: 'new' }
        format.json { render json: @kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /kinds/1
  # PUT /kinds/1.json
  def update
    @title = t('view.kinds.edit_title')
    @kind = Kind.find(params[:id])

    respond_to do |format|
      if @kind.update_attributes(params[:kind])
        format.html { redirect_to @kind, notice: t('view.kinds.correctly_updated') }
        format.json { head :ok }
      else
        format.html { render action: 'edit' }
        format.json { render json: @kind.errors, status: :unprocessable_entity }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_kind_url(@kind), alert: t('view.kinds.stale_object_error')
  end

  # DELETE /kinds/1
  # DELETE /kinds/1.json
  def destroy
    @kind = Kind.find(params[:id])
    @kind.destroy

    respond_to do |format|
      format.html { redirect_to kinds_url }
      format.json { head :ok }
    end
  end
end
