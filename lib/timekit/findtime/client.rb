module Timekit
  class Findtime
    # Client class for the findtime resource
    class Client < Timekit::Client
      def path
        Timekit::FINDTIME_API_PATH
      end

      def query(
        emails = nil,
        user_ids = nil,
        calendar_ids = nil,
        filters = {},
        filtercollection_id = nil,
        start = nil,
        future = '2 days',
        length = '1 hour',
        sort = 'asc',
        ignore_all_day_events = false,
        all_solutions = false
      )
        params = {}

        # All args are optional, so we can examine each arg and
        # set it as a key in the params hash if a value exists for the arg
        method(__method__).parameters.map do |_, name|
          value = binding.local_variable_get(name)
          params[name.to_sym] = value if [true, false].include?(value) ||
                                         !value.nil?
        end

        raise 'Entity id required to find time'\
          ' (email,user id,calendar id)' unless
          params[:emails] || params[:user_ids] || params[:calendar_ids]

        post('', params)
      end

      def bulk_query(queries)
      end
    end
  end
end
