module CoreExtensions
  module Array
    module Result
      def publish_results
        self.each do|result|
          result.has_raced = true
          result.save
        end
      end
    end
  end
end
