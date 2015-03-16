class CompaniesController < ApplicationController

  def new
    @category = Category.find(params[:category_id])
    @company = @category.companies.new
  end

  def create
    @category = Category.find(params[:category_id])
    @company = @category.companies.new(company_params)
    if @company.save
      flash[:notice] = "Company successfully added!"
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:category_id])
    @company = Company.find(params[:id])
  end

  def edit
    @category = Category.find(params[:category_id])
    @company = Company.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @company = Company.find(params[:id])
    if @company.update(company_params)
      flash[:notice] = "Company successfully updated."
      redirect_to category_company_path(@category, @company)
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    company = Company.find(params[:id])
    company.destroy
    flash[:notice] = "Company successfully deleted."
    redirect_to category_path(@category)
  end


private
  def company_params
    params.require(:company).permit(:name, :address, :website, :phone, :hours)
  end

end
