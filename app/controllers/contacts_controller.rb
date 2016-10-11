class ContactsController < ApplicationController
  before_action do
    if @current_user.nil?
      redirect_to sign_in_path, alert: "Please Sign In"
    end
  end

  def import
    Contact.import(params[:file])
    redirect_to root_path, notice: "Data Imported!"
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
      q = Contact.all
      q = q.search params[:query] if params[:query].present?
      @contacts = q.paginate(page: params[:page], per_page: 20)

      @contacts_for_CSV = Contact.order(:last_name)
        respond_to do |format|
         format.html
         format.xls  { send_data @contacts_for_CSV.to_csv(col_sep: "\t") }
         format.csv { send_data @contacts_for_CSV.to_csv }
       end
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
