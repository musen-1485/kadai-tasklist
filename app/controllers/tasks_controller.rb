class TasksController < ApplicationController
    before_action :require_user_logged_in, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    # before_action :set_task, only: [:show, :edit, :update, :destroy]
    before_action :correct_user, only: [:show, :update, :destroy]
    
    def index
        @pagy, @tasks = pagy(current_user.tasks.order(id: :desc), items:3)
    end

    def new
        @task = Task.new
    end
    
    def show
      
    end

    def create
        @task = current_user.tasks.build(task_params)
        if @task.save
            flash[:success] = "Task が正常に作成されました"
            redirect_to root_url
        else
            flash.now[:danger] = "Task が作成されませんでした"
            render :new
        end
    end

  def update
     
     if @task.update(task_params)
         flash[:success] = 'Task は正常に更新されました'
         redirect_to @task
     else
         flash.now[:danger] = 'Task は更新されませんでした'
         render :edit
     end
  end
  
  def destroy
      @task.destroy
      
      flash[:success] = 'Task は正常に削除されました'
      redirect_to tasks_url
  end
  
  def edit
  @task = Task.find(params[:id])
  end
  
  private
  
#   def set_task
#       @task = Task.find(params[:id])
#   end
  #Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status, :user_id)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
  unless @task
      redirect_to root_url
  end
  end
end
