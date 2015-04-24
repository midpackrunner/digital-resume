module Admin
  class ImagesController < ApplicationController

    def new
      @image = Image.new
    end

    def create
      @image = Image.new(image_params)

      if @image.save
        redirect_to @image, notice: 'Image was successfully uploaded'
      else
        render :new
      end
    end

    private
      def image_params
        params.require(:image).permit(:file, :key)
      end
  end
end