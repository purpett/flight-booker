class FlightsController < ApplicationController

  def index
    @airports = Airport.all.map { |a| [a.name, a.id] }
    @dates = Date.today.upto(Date.today + 60).to_a.map {|d| [d.strftime("%d/%m/%Y"), d]}
    if params[:origin]
      @flights = Flight.where(origin_id: params[:origin], destination_id: params[:destination], flight_date: params[:date])
    end
  end
end