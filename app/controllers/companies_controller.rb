class CompaniesController < ApplicationController

  def index
    # find all Company rows
    # render companies/index view
    @companies = Company.all
  end

  def show
    # find a Company
    @company = Company.find_by({"id" => params["id"]})
    @contacts = Contact.where({"company_id" => @company["id"]})
    # render companies/show view with details about Company
    # render : template => "companies/show"
  end

  def new
    # render view with new Company form
    @company = Company.new

  end
  
  def create
    # start with a new Company
    @company = Company.new

    # assign user-entered form data to Company's columns
    @company["name"] = params["company"]["name"]
    @company["city"] = params["company"]["city"]
    @company["state"] = params["company"]["state"]

    # save Company row
    @company.save

    # redirect user
    redirect_to "/companies"
  end

  # def edit
  #   # find a Company
  #   # render view with edit Company form
  # end
  
  # def update
  #   # find a Company
  #   # assign user-entered form data to Company's columns
  #   # save Company row
  #   # redirect user
  # end
  
  # def destroy
  #   # find a Company
  #   # destroy Company row
  #   # redirect user
  # end
  
end
