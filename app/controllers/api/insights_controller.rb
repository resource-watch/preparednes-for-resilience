class Api::InsightsController < ApiController

  before_action :set_insight, only: [:show, :update, :destroy]

  # GET /insights
  def index
    insights =
      if params[:env].present?
        environments = params[:env].split(',')

        ids = environments.map do |env|
          Insight.where(env => true)
        end.flatten.uniq.pluck(:id)

        Insight.where(id: ids)
      else
        Insight.production
      end

    if params.has_key?(:published)
      insights = insights.published(params[:published]) if params[:published] != 'all'
    else
      insights = insights.published
    end
    insights = insights.order(:updated_at).reverse
    render json: insights, each_serializer: Api::InsightSerializer, status: 200
  end

  # GET /insights/:slug
  def show
    if @insight
      render json: @insight, serializer: Api::InsightSerializer, status: 200
    else
      render json: {status: 404, error: 'Insight not found'}
    end
  end

  # POST /insights
  def create
    @insight = Insight.new(insight_params)
    render json: @insight, status: 201 if @insight.save
  end

  # PUT /insights/:id
  def update
    @insight.update(insight_params)
    render json: @insight
  end

  # DELETE /insights/:id
  def destroy
    @insight.destroy
    head :no_content
  end

  private

  def insight_params
    # whitelist params
    params.permit(:title, :slug, :template_type, :summary, :content, :image, :content_url, :embeddable, :partner_id, :attribution, :published)
  end

  def set_insight
    environments = params[:env].present? ? params[:env].split(',') : ['production']
    insight = params[:id].id? ? Insight.find_by(id: params[:id]) : Insight.find_by(slug: params[:id])

    matches = environments.map do |env|
      insight.public_send(env)
    end

    @insight = matches.include?(true) ? insight : nil
  end

end
