class ContactMethodsController < ApplicationController
  # GET /contact_methods
  # GET /contact_methods.json
  def index
    @contact_methods = ContactMethod.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contact_methods }
    end
  end

  # GET /contact_methods/1
  # GET /contact_methods/1.json
  def show
    @contact_method = ContactMethod.find(params[:id])

    respond_to do |format|
      format.html { redirect_to :action => :edit }
      format.json { render json: @contact_method }
    end
  end

  # GET /contact_methods/new
  # GET /contact_methods/new.json
  def new
    @contact_method = ContactMethod.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact_method }
    end
  end

  # GET /contact_methods/1/edit
  def edit
    @contact_method = ContactMethod.find(params[:id])
  end

  # POST /contact_methods
  # POST /contact_methods.json
  def create
    @contact_method = ContactMethod.new(params[:contact_method])

    respond_to do |format|
      if @contact_method.save
        format.html { redirect_to @contact_method, notice: 'Contact method was successfully created.' }
        format.json { render json: @contact_method, status: :created, location: @contact_method }
      else
        format.html { render action: "new" }
        format.json { render json: @contact_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contact_methods/1
  # PUT /contact_methods/1.json
  def update
    @contact_method = ContactMethod.find(params[:id])

    respond_to do |format|
      if @contact_method.update_attributes(params[:contact_method])
        format.html { redirect_to @contact_method, notice: 'Contact method was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_methods/1
  # DELETE /contact_methods/1.json
  def destroy
    @contact_method = ContactMethod.find(params[:id])
    @contact_method.destroy

    respond_to do |format|
      format.html { redirect_to contact_methods_url }
      format.json { head :no_content }
    end
  end
end
