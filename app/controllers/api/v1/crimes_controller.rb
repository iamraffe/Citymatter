class Api::V1::CrimesController < ApplicationController
  def index
    @crimes = Crime.page(params[:page]).per(2)
    render json: {
                    crimes: @crimes,  pagination: { 
                                          per_page: 2,
                                          total_pages: @crimes.total_pages,
                                          total_objects: @crimes.total_count,
                                          links: [
                                            previous: @crimes.current_page == 1 ? nil : "/api/v1/crimes?page=#{@crimes.current_page-1}",
                                            current: @crimes.current_page,
                                            next: @crimes.last_page? ? nil : "/api/v1/crimes?page=#{@crimes.current_page+1}"
                                          ]
                                        }
                                      }
                                          
  end
  
  def categories
    Crime.group(:category).count.map{|key, value| {category: key, count: value} }
  end

  def neighborhood
    Crime.group(:neighborhood).count.map{|key, value| {neighborhood: key, count: value} }
  end
end
