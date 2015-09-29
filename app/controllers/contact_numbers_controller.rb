class ContactNumbersController < ApplicationController
  # GET /contact_numbers
  # GET /contact_numbers.json
  def index
    @contact_numbers = ContactNumber.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contact_numbers }
    end
  end

  # GET /contact_numbers/1
  # GET /contact_numbers/1.json
  def show
    @contact_number = ContactNumber.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact_number }
    end
  end

  # GET /contact_numbers/new
  # GET /contact_numbers/new.json
  def new
    @contact_number = ContactNumber.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact_number }
    end
  end

  # GET /contact_numbers/1/edit
  def edit
    @contact_number = ContactNumber.find(params[:id])
  end

  # POST /contact_numbers
  # POST /contact_numbers.json
  def create
    @contact_number = ContactNumber.new(params[:contact_number])

    respond_to do |format|
      if @contact_number.save
        format.html { redirect_to @contact_number, notice: 'Contact number was successfully created.' }
        format.json { render json: @contact_number, status: :created, location: @contact_number }
      else
        format.html { render action: "new" }
        format.json { render json: @contact_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contact_numbers/1
  # PUT /contact_numbers/1.json
  def update
    @contact_number = ContactNumber.find(params[:id])

    respond_to do |format|
      if @contact_number.update_attributes(params[:contact_number])
        format.html { redirect_to @contact_number, notice: 'Contact number was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_numbers/1
  # DELETE /contact_numbers/1.json
  def destroy
    @contact_number = ContactNumber.find(params[:id])
    @contact_number.destroy

    respond_to do |format|
      format.html { redirect_to contact_numbers_url }
      format.json { head :no_content }
    end
  end
end
