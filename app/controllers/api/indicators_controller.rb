class Api::IndicatorsController < ApiController

  before_action :set_indicator, only: [:show, :update, :destroy]

  # GET /indicators
  def index
    indicators = Indicator.all
    if params.has_key?(:published)
      indicators = indicators.where(published: params[:published]) unless params[:published].eql? 'all'
    else
      indicators = indicators.where(published: 'TRUE')
    end
    render json: indicators, each_serializer: Api::IndicatorSerializer, status: 200
  end

  # GET /indicators/:id
  def show
    if @indicator
      render json: @indicator, serializer: Api::IndicatorSerializer, status: 200
    else
      render json: {status: 404, error: 'Indicator not found'}
    end
  end

  # POST /indicators
  def create
    @indicator = Indicator.new(indicator_params)
    render json: @indicator, status: 201 if @indicator.save
  end

  # PUT /indicators/:id
  def update
    @indicator.update(indicator_params)
    render json: @indicator
  end

  # DELETE /indicators/:id
  def destroy
    @indicator.destroy
    head :no_content
  end

  private

    def indicator_params
      # whitelist params
      params.permit(:title, :summary, :content, :published, widget_ids: [])
    end

    def set_indicator
      @indicator = Indicator.find(params[:id])
    end

end
