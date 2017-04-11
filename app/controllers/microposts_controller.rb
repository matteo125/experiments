class MicropostsController < ApplicationController
  before_action :set_micropost, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?, only: [:new, :edit, :update, :destroy]

  # GET /microposts
  # GET /microposts.json
  def index
    @microposts = Micropost.all
  end

  def show
  end

  def new
    @micropost = Micropost.new
  end

  def edit
  end

  def create
    # mettere un before_action. l'utente deve essere loggato per poter fare il post
    unless logged_in?
      redirect_to login_path, notice: 'Ti prego, fai un check per capire se sei loggato'
    else
      @micropost = Micropost.new(micropost_params)
      @micropost.user_id = current_user.id
      if @micropost.save
        redirect_to @micropost, notice: 'Micropost was successfully created.'
      else
        render :new
      end
    end
  end

  def update
    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html { redirect_to @micropost, notice: 'Micropost was successfully updated.' }
        format.json { render :show, status: :ok, location: @micropost }
      else
        format.html { render :edit }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @micropost.destroy
    respond_to do |format|
      format.html { redirect_to microposts_url, notice: 'Micropost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def micropost_params
      params.require(:micropost).permit(:title, :content, :user_id, :views)
    end
end
