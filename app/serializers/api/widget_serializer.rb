class Api::WidgetSerializer < ActiveModel::Serializer

  attributes :id, :title, :summary, :slug, :content, :data_url, :widget_config, :widget_type, :attribution, :published
  def widget_config
     JSON.parse (object.widget_config)
  end

  belongs_to :partner, serializer: Api::PartnerSerializer
end
