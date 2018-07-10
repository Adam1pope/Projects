class DojosController < ApplicationController
  def index
  	@dojos = Dojo.all
  end

  def new
  	render "new"
  end
  
  def create
  	dojo = Dojo.create(branch:params[:branch],street:params[:street], city:params[:city], state:params[:state] )
  	if dojo.valid?
  		flash[:success]= "#{dojo.branch} was successfully created!"
  		redirect_to "/dojos"
  	else
  	    flash[:errors] = dojo.errors.full_messages
  	    redirect_to "/dojos/new"
  	end    	

  end 

  def show
  	@dojo = Dojo.find(params[:id])
  	@students = @dojo.students.all 

  end

  def edit
  	@dojo = Dojo.find(params[:id])
  end

  def update
  	dojo = Dojo.find(params[:id])
  	dojo.branch = params[:branch]
  	dojo.street = params[:street]
  	dojo.city = params[:city]
  	dojo.state = params[:state]
  	dojo.save
  	redirect_to "/dojos/#{dojo.id}"
  end	

  def destroy
  	dojo = Dojo.find(params[:id])
  	dojo.destroy
  	redirect_to "/dojos"
  end	

end
