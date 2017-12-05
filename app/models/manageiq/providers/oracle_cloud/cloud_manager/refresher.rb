module ManageIQ::Providers::OracleCloud
  class CloudManager::Refresher < ManageIQ::Providers::BaseManager::Refresher
    include ::EmsRefresh::Refreshers::EmsRefresherMixin

    def parse_legacy_inventory(ems)
      ManageIQ::Providers::OracleCloud::CloudManager::RefreshParser.ems_inv_to_hashes(ems, refresher_options)
    end

    def save_inventory(ems, _targets, hashes)
      super
    end

    def post_process_refresh_classes
      [::Vm]
    end
  end
end
