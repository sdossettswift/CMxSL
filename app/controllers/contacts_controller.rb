class ContactsController < ApplicationController
  before_action do
    if @current_user.nil?
      redirect_to sign_in_path, alert: "Please Sign In"
    end
  end

  def new
      @contact = Contact.new
    end

    def create
      @contact=Contact.create(contact_params)
      if @contact.save
        redirect_to dashboard_path, notice: "Contact Successfully Added"
      else
        render :new
      end
    end

    def index
      @contacts = Contact.all.paginate(page: params[:page], per_page: 20)
    end

    def show
      @contact = Contact.find_by id: params[:id]
    end

    def edit
      @contact = Contact.find_by id: params[:id]
    end

    def update
      @contact = Contact.find_by id: params[:id]
      if @contact.update(contact_params)
        redirect_to dashboard_path, notice: "Contact Details Successfully Updated"
      else
        render :edit
      end
    end

    def delete
        @contact = Contact.find_by id: params[:id]
        @contact.destroy
        redirect_to dashboard_path, notice: 'Contact Details Removed'
    end

    private

    def contact_params
      params.require(:contact).permit(:last_name, :first_name, :email, :phone, :company, :address1, :address2, :city, :state, :zip,:notes, :status, :interest, :list_id, :list, :title )
    end

  end
