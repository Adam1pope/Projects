class StudentsController < ApplicationController
  def new
  	@dojo = Dojo.find(params[:dojo_id])
  	render "new"
  end

  def create
  	student = Student.create(first_name:params[:first_name], last_name:params[:last_name], email:params[:email], dojo: Dojo.find(params[:dojo_id]))
  	if student.valid?
  		flash[:success] = "Student has been added!"
  	    redirect_to "/dojos/#{params[:dojo_id]}/students/new"
  	else 
  		flash[:errors] = student.errors.full_messages
  		redirect_to "/dojos/#{params[:dojo_id]}/students/new" 
  	end	   
  end
 
  def show
  	@dojo = Dojo.find(params[:dojo_id])
  	@student = Student.find(params[:id])
  	@students = @dojo.students.all 
  end  

  def edit
  	@dojo = Dojo.find(params[:dojo_id])
  	@student = Student.find(params[:id])
    @all_dojos = Dojo.all
  end 	

  def update
  	@dojo = Dojo.find(params[:dojo_id])
  	student = Student.find(params[:id])

  	student.first_name = params[:first_name]
  	student.last_name = params[:last_name]
  	student.email = params[:email]
    student[:dojo_id] = params[:location]

  	student.save
  	redirect_to "/dojos/#{@dojo.id}"
  end

  def destroy
    dojo = Dojo.find(params[:dojo_id])
  	student = Student.find(params[:id])
  	student.destroy
  	redirect_to "/dojos/#{dojo.id}"
  end	



end
