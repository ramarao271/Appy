class ImageFilesController < ApplicationController
  before_action :set_image_file, only: [:show, :edit, :update, :destroy]
  before_filter :add_headers
  # GET /image_files
  # GET /image_files.json
  def index
    @image_files = ImageFile.all
     puts "api_key is "
    puts Rails.configuration.app.api_key
  end

  # GET /image_files/1
  # GET /image_files/1.json
  def show
  end

  # GET /image_files/new
  def new
    @image_file = ImageFile.new
  end

  # GET /image_files/1/edit
  def edit
  end

  # POST /image_files
  # POST /image_files.json
  def create
    @image_file = ImageFile.new(image_file_params)

    respond_to do |format|
      if @image_file.save
        format.html { redirect_to @image_file, notice: 'Image file was successfully created.' }
        format.json { render :show, status: :created, location: @image_file }
      else
        format.html { render :new }
        format.json { render json: @image_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_files/1
  # PATCH/PUT /image_files/1.json
  def update
    respond_to do |format|
      if @image_file.update(image_file_params)
        format.html { redirect_to @image_file, notice: 'Image file was successfully updated.' }
        format.json { render :show, status: :ok, location: @image_file }
      else
        format.html { render :edit }
        format.json { render json: @image_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_files/1
  # DELETE /image_files/1.json
  def destroy
    @image_file.destroy
    respond_to do |format|
      format.html { redirect_to image_files_url, notice: 'Image file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_file
      @image_file = ImageFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_file_params
      params.require(:image_file).permit(:path, :image_for, :cost, :pairs,:name,:product_type)
    end
        def add_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end

end
