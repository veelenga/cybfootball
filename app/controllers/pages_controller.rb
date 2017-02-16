class PagesController < ApplicationController
  before_action :set_page, only: [:edit, :update, :destroy]

  def show
    @page = Page.find_by_path params[:id]
    if @page.present?
      render :show
    else
      raise ActiveRecord::RecordNotFound, 'Record not found.'
    end
  end

  def new
    @page = Page.new
  end

  def edit
  end

  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to page_path, notice: 'Page was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to page_path, notice: 'Page was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Page was successfully destroyed.' }
    end
  end

  private
    def set_page
      @page = Page.find params[:id]
    end

    def page_params
      params.require(:page).permit(:path, :title, :content)
    end

    def page_path
      "/#{@page.path}"
    end
end
