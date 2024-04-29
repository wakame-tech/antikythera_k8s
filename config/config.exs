# Copyright(c) 2015-2024 ACCESS CO., LTD. All rights reserved.

import Config, only: [config: 2, import_config: 1]

# Here we simply reuse `config.exs` file in the antikythera project (and override `:antikythera_instance_name`).
# See antikythera's `config.exs` file and also `Antikythera.MixConfig` module
# for detailed explanations on how to configure your antikythera instance project.

repo_parent_dir = Path.expand(Path.join([__DIR__, "..", ".."]))

deps_dir =
  case Path.basename(repo_parent_dir) do
    # this antikythera instance project is used by a gear
    "deps" -> repo_parent_dir
    # this antikythera instance project is the toplevel mix project
    _ -> Path.expand(Path.join([__DIR__, "..", "deps"]))
  end

antikythera_config_file = Path.join([deps_dir, "antikythera", "config", "config.exs"])

if File.regular?(antikythera_config_file) do
  import_config antikythera_config_file
end

config :antikythera,
  antikythera_instance_name: :antikythera_k8s,
  eal_impl_modules: [
    cluster_configuration: AntikytheraK8s.ClusterConfiguration,
    log_storage: AntikytheraEal.LogStorage.FileSystem,
    metrics_storage: AntikytheraEal.MetricsStorage.Memory,
    alert_mailer: AntikytheraEal.AlertMailer.MemoryInbox,
    asset_storage: AntikytheraEal.AssetStorage.NoOp
  ]
