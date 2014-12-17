class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]

  def index
    @bills = Bill.all
    @unpaid_bills = @bills.sort
  end

  def show
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(bill_params)
    if @bill.save
      redirect_to bill_path(@bill.id), notice: 'Bill has been added'
    else
      render :new, alert: 'Error creating bill'
    end
  end

  def edit
  end

  def update
    if @bill.update_attributes(bill_params)
      redirect_to bill_path(@bill.id), notice: 'Bill has been updated'
    else
      render :edit, alert: 'Error updating bill'
    end
  end

  def destroy
    @bill.destroy
    redirect_to bills_path, alert: 'Bill has been deleted'
  end

  private

  # def find_unpaid_bills
  #   @unpaid_bills = @bills.each { |bill| bill.paid == false }
  # end

  def set_bill
    @bill = Bill.find(params[:id])
  end

  def bill_params
    params.require(:bill).permit(:title, :amount, :due_at, :paid)
  end
end
