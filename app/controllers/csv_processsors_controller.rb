class CsvProcesssorsController < ApplicationController
  def index
    @user = User.all
  end
  def new
    @user = User.new
  end
  def create
    hash = {}
    begin
      sanitize_params.each do |i|
        hash.key?(i[1]).blank?   ? (hash[i[1]] = 1) : (hash[i[1]] += 1)
      end
      hash.delete_if {|_, v| v == 1 }
      response = hash.merge(success: {status: 200, response: "success"})
    rescue Exception => e
      response = e.message
    end
   respond_to do |format|
     format.html {
       hash.each do | user_name, count |
        user = User.find_or_create_by(first_name: user_name)
        user.update_columns(count: user.count + count)
       end
        redirect_to action: :index
        flash[:notice] = "Blank file uploaded or file do not have proper header value like first_name...." if hash.blank?
     }
     format.json { render json: response}
   end
  end
  private
  def sanitize_params
    unless params["user"].blank?
      s_params = File.read(params["user"]["value"].tempfile).split("\n").map {|a| a.split(",")}
      s_params = Array.new unless s_params.first.join.match(/first.name/i)
    else
      s_params =  params[:value].is_a?(Array) ? params[:value] : eval(params[:value])
    end
    s_params.shift if !s_params.blank?
    s_params
  end
end
