class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @tasks_not_done = Task.where(:done => false)
    @tasks_done = Task.where(:done => true)
    render('tasks/index.html.erb')
  end

  def new
    @task = Task.new
    render('tasks/new.html.erb')
  end

  def create
    @task = Task.new(:name => params[:name], :done => params[:done])
    if @task.save
      render('tasks/success.html.erb')
    else
      render('tasks/new.html.erb')
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(:done => params[:done])
      render('tasks/success.html.erb')
    else
      render('tasks/index.html.erb')
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    render('tasks/destroy.html.erb')
  end

end
