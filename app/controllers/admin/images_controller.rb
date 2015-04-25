class Admin::ImagesController < AdminController
  before_action :authenticate_user!

  def index
    @images = Image.paginate(page: params[:page])
  end

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

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def image_params
      params.require(:image).permit(:file, :key)
    end
end
