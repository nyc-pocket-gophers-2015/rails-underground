class WidgetsController < ApplicationController
  def new
    @widget = Widget.new
  end

  def index
    @widgets = Widget.all
  end

  def create
    @widget = Widget.new(widget_params)
    if @widget.save
      flash[:notice] = "Widget was successfully created."
      redirect_to widgets_path
    else
      render :new
    end
  end

  private

  def widget_params
    params.require(:widget).permit(:name)
  end

end