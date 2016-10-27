require "csv"

class PagesController < ApplicationController
  def index
    @data = CSV.open("#{Rails.root}/public/crime.csv",
                      :headers => true,
                      :converters => :all,
                      :header_converters => lambda { |h| h.downcase.gsub(' ', '_') }
                    ).map do |x|
                      @crime = x.to_h
                      # byebug
                      # @crime.date =
                      Crime.new({
                        incident_report_number: @crime["incident_report_number"],
                        crime_type: @crime["incident_report_number"],
                        date: Date.strptime(@crime["date"], "%m/%d/%y"),
                        time: @crime["time"],
                        location_type: @crime["location_type"],
                        address: @crime["address"],
                        longitude: @crime["longitude"],
                        latitude: @crime["latitude"],
                        neighborhood: @crime["neighborhood"]
                      })
                    end
    # Crime.create(@data)
    Crime.import @data
  end
end
