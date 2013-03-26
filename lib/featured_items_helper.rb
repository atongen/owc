module FeaturedItemsHelper
  def featured_info(item)
    return "None" if item.model.blank? or item.model_id == 0
    model = namespaced_model(item.model)
    return "None" if model.nil?
    data = model.where(:id => item.model_id).first
    return "None" if data.nil?

    data.title
  end

  def namespaced_model(model)
    case model
    when "Event"
      ::Refinery::Events::Event
    when "WaitingFamily"
      ::Refinery::WaitingFamilies::WaitingFamily
    when "WaitingKid"
      ::Refinery::WaitingKids::WaitingKid
    else
      puts "Invalid model: #{model}"
      nil
    end
  end

  def model_choices
    [
      ['None', ''],
      ['Events', 'Event'],
      ['Waiting Family', 'WaitingFamily'],
      ['Waiting Kid', 'WaitingKid'],
    ]
  end
end
