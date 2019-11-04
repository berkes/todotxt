module Todotxt
  PRIORITY_REGEX = /^\(([A-Z])\) /.freeze
  PROJECT_REGEX  = /(\+\w+)/.freeze
  CONTEXT_REGEX  = /(@\w+)/.freeze
  DATE_REGEX     = /(\s+due:((\d{4}-)(\d{1,2}-)(\d{1,2})))/.freeze
  DONE_REGEX     = /^(\([A-Z]\) )?x /.freeze
end
