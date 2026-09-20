class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  def new
    @tasks = Task.new
  end
  def show
    @tasks = Task.find(params[:id])
  end
  def create
    # on crée notre varaible d'instance
    @tasks = Task.new(task_params)
    # on crée les messages si la sauvegarde réussit ou pas
    # le .save de la condition permet également de sauvegarder la tache créée
    if @tasks.save
      redirect_to @tasks, notice: "tache créé avec succés"
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    # on recherche la tache à partir de son identifiant
    @tasks = Task.find(params[:id])
  end
  def update
  @tasks = Task.find(params[:id])
  @tasks.update(task_params)
  redirect_to tasks_path
  end
  def destroy
    @tasks = Task.find(params[:id])
    @tasks.destroy
    redirect_to tasks_path, status: :see_other
  end


# on crée une méthode privée pour s'assurer que l'utilisateur rentre uniquement les données dont nous avons besoin et ne puisse rien injecter d'autre.
private
# uniquement les champs autorisés
def task_params
  params.require(:task).permit(:title, :details)
end
end
