class FaqsController < ApplicationController
  before_action :set_faq, only: [:edit, :update, :destroy]

  def index
    @faqs = Faq.all.order(:order)
  end

  def new
    @faq = Faq.new
  end

  def edit
  end

  def create
    @faq = Faq.new(faq_params)

    respond_to do |format|
      if @faq.save
        format.html { redirect_to faqs_url, notice: t('controllers.faq.create') }
      else
        format.html { render :new }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @faq.update(faq_params)
        format.html { redirect_to faqs_url, notice: t('controllers.faq.update') }
      else
        format.html { render :edit }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @faq.destroy
    respond_to do |format|
      format.html { redirect_to faqs_url, notice: t('controllers.faq.destroy') }
      format.json { head :no_content }
    end
  end

  private
    def set_faq
      @faq = Faq.find(params[:id])
    end

    def faq_params
      params.require(:faq).permit(:question, :answer, :order)
    end
end
