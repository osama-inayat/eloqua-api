module EloquaApiExceptions
  class BadRequestError < StandardError; end

  class UnAuthorizedError < StandardError; end

  class ForbiddenError < StandardError; end

  class NotFoundError < StandardError; end

  class ServerError < StandardError; end
end
