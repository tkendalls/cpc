class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :set_customer, only: [:new, :edit, :create]

  # GET /contacts
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  def show
  end

  # GET /contacts/new
  def new
    if @customer
      @contact = @customer.contacts.build
    else
      @contact = Contact.new
    end
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  def create
    if @customer
      @contact = @customer.contacts.new(contact_params)
    else
      @contact = Contact.new(contact_params)
    end

    if @contact.save
      redirect_to @contact, notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @customer
      @contact = @customer.contacts.find(params[:contact_id])
    end

    if @contact.update(contact_params)
      redirect_to @contact, notice: 'Contact was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
    redirect_to contacts_url, notice: 'Contact was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def set_customer
      @customer = Customer.find params[:customer_id] if params[:customer_id]
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:contact).permit(%i(first_name last_name phone email title customer_id))
    end
end
