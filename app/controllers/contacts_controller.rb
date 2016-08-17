class ContactsController < ApplicationController
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
      @contacts = Contact.all
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
      params.require(:contact).permit()
    end

  end
