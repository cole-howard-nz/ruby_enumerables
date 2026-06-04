require 'json'

module BasicSerialisable
  SERIALISER = JSON

  def serialise
    object = {}
    instance_variables.map do |variable|
      object[variable] = instance_variable_get variable
    end

    SERIALISER.dump object
  end

  def unserialise stream
    object = SERIALISER.parse stream
    object.keys.each do |key|
      instance_variable_set(key, object[key])
    end
  end
end
