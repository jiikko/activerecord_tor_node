require 'open-uri'

class TorNode < ActiveRecord::Base
  JSON_URLS = [
    'http://hqpeak.com/torexitlist/free/?format=json',
  ]

  class << self
    def fetch_tor_nodes_ip!
      ActiveRecord::Base.transaction do
        TorNode.delete_all
        return if parse_json_url
        unless success?
          # なんらかに通知する
          raise('rollback!')
        end
      end
    end

    def is_tor?(ip)
      TorNode.exists?(ip: ip)
    end

    private

    def parse_json_url
      JSON_URLS.each do |url|
        file =
          with_rescue do
            open(url)
          end
        next unless file

        result =
          with_rescue do
            JSON.load(file).each do |ip|
              TorNode.create!(ip: ip)
            end
            true
          end
        break if result
      end
      return success?
    end

    def success?
      TorNode.exists?
    end

    def with_rescue
      yield
    rescue => e
      puts e.inspect
      return false
    end
  end
end
