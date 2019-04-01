class UniqsController < ApplicationController
  before_action :set_uniq, only: [:show, :edit, :update, :destroy]

  # GET /uniqs
  # GET /uniqs.json
  def index
    redirect_to new_uniq_path
  end

  # GET /uniqs/1
  # GET /uniqs/1.json
  def show
  end

  # GET /uniqs/new
  def new
    @uniq = Uniq.new
    Uniq.create(request: "first", result: "first") unless Uniq.last.present?
    @last_uniq = Uniq.last
    @how_old = (Time.now - @last_uniq.created_at).to_i
    @how_old = 9999 if @how_old.nil?
    @before_count = @last_uniq.before_count
    @after_count = @last_uniq.after_count
  end

  # GET /uniqs/1/edit
  def edit
  end

  # POST /uniqs
  # POST /uniqs.json
  def create
    @uniq = Uniq.new(uniq_params)
    @how_old = 9999 if @how_old.nil?
    if @uniq.request.present?
      arr = @uniq.request.split(',')
      @uniq.before_count = arr.count
      arr.map! { |e| e.delete!(' ') if e.include? '-'; e }
      res_arr = arr.uniq.sort
      @uniq.after_count = res_arr.count
      @uniq.result = res_arr.join(', ')
    end

    respond_to do |format|
      if @uniq.save
        format.html { redirect_to new_uniq_path, notice: 'Uniq was successfully created.' }
        format.json { render :show, status: :created, location: @uniq }
      else
        format.html { render :new }
        format.json { render json: @uniq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uniqs/1
  # PATCH/PUT /uniqs/1.json
  def update
    respond_to do |format|
      if @uniq.update(uniq_params)
        format.html { redirect_to @uniq, notice: 'Uniq was successfully updated.' }
        format.json { render :show, status: :ok, location: @uniq }
      else
        format.html { render :edit }
        format.json { render json: @uniq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uniqs/1
  # DELETE /uniqs/1.json
  def destroy
    @uniq.destroy
    respond_to do |format|
      format.html { redirect_to uniqs_url, notice: 'Uniq was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_uniq
      @uniq = Uniq.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uniq_params
      params.require(:uniq).permit(:request)
    end
end
