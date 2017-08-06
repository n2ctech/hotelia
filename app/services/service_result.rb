class ServiceResult
  attr_reader :success, :data, :errors

  def initialize success:, data: nil, errors: []
    @success = success
    @data = data
    @errors = errors
  end

  def success?
    success
  end

  def failure?
    !success?
  end

  def has_data?
    data.present?
  end

  def has_errors?
    errors.present?
  end

  def error_messages
    errors.map(&:to_s)
  end
end
