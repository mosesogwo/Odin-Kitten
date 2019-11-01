class KittensController < ApplicationController

  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = 'Kitten created'
      redirect_to 'kittens_path'
    else
      flash.now[:danger] = 'Kitten creation failed!'
      render 'new'
    end
  end

  def edit
    @kitten = Kitten.find(params[:id]) 
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      flash[:success] = 'Kitten updated'
      redirect_to 'kittens_path'
    else
      flash.now[:danger] = 'Kitten update failed!'
      render 'edit'
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:success] = 'Kitten destroyed!'
    redirect_to kittens_path
  end
end
