class WidgetsController < ApplicationController
  def new
    @widget = Widget.new
  end

  def create
    @widget = Widget.new(widget_params)
    if @widget.save
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