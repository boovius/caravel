class Api::WidgetsController < ApplicationController
  def current
    @widgets = Widget.all
  end

  def show
    @widget = widget.find(params[:id])
  end

  def create
    widget = widget.new(widget_params)
    widget.features.build params[:features]

    if widget.save
      render json: widget
    else
      render json: {type: 'error', messages: widget.errors.messages}, status: :unprocessable_entity
    end
  end

  def update
    # Ensure current user is creator of widget
    unless current_user.id == params[:user][:id]
      render json: {type: 'error', messages: 'Unauthorized put attempt'}, status: :forbidden
      return
    end

    widget = widget.find(params[:widget][:id])

    widget.update_attributes(widget_params)

    end

    if widget.save
      render json: widget
    else
      render json: {type: 'error', messages: widget.errors.messages}, status: :unprocessable_entity
    end
  end

  private

  def widget_params
    params.require(:widget).permit(:title, :repo, :summary, :url, :stories, :user_id, features_attributes: [:id, :title, :points])
  end
end
