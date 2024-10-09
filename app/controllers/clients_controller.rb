class ClientsController < ApplicationController
  include Pagy::Backend
  before_action :set_client, only: %i[ show edit update destroy ]

  # GET /clients or /clients.json
  def index
    # @clients = Client.all
    @pagy, @clients = pagy(Client.order(updated_at: :desc))
  end

  # GET /clients/1 or /clients/1.json
  def show
  end

  def search
    @pagy, @clients = pagy(Client.all)
    if params[:query_text].present?
      @pagy, @clients = pagy(Client.search_full_text(params[:query_text]).order(updated_at: :desc))
      # @pagy, @tweets =   pagy(Tweet.search_by_content("keyword").order(created_at: :asc))
    end
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to client_url(@client), notice: "Cliente creado" }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to client_url(@client), notice: "Cliente actualizado" }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    if @client.destroy
      respond_to do |format|
        format.html { redirect_to clients_url, notice: "Cliente eliminado" }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to client_url, notice: "No se puede eliminar el cliente porque tiene películas asociadas" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :age)
    end
end
