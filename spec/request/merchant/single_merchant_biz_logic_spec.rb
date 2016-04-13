require "rails_helper"

RSpec.describe "Single merchant logic endpoint" do

  it "returns total revenue for that merchant" do
    get "/api/v1/merchants/:id/revenue"

    #find that merchant. get all invoices for that merchant associated with transactions where result is success.
    #get all the invoice items for those invoices and calculate the quantity times price, sum the total.

  end
end
# GET /api/v1/merchants/:id/revenue returns the total revenue for that merchant across all transactions
# GET /api/v1/merchants/:id/revenue?date=x returns the total revenue for that merchant for a specific invoice date x
# GET /api/v1/merchants/:id/favorite_customer returns the customer who has conducted the most total number of successful transactions.
# GET /api/v1/merchants/:id/customers_with_pending_invoices returns a collection of customers which have pending (unpaid) invoices
# NOTE: Failed charges should never be counted in revenue totals or statistics.
#
# NOTE: All revenues should be reported as a float with two decimal places.
