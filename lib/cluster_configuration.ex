use Croma
alias Croma.Result, as: R

defmodule AntikytheraK8s.ClusterConfiguration do
  @behaviour AntikytheraEal.ClusterConfiguration.Behaviour

  @impl true
  defun running_hosts() :: R.t(%{String.t() => boolean}) do
    hosts = [
      "antikythera-k8s-1.local",
      "antikythera-k8s-2.local",
      "antikythera-k8s-3.local"
    ]

    hosts_with_status = Enum.map(hosts, fn host -> {host, true} end) |> Map.new()

    {:ok, hosts_with_status}
  end

  @impl true
  defun(zone_of_this_host() :: String.t(), do: "zone")

  @impl true
  defun(health_check_grace_period_in_seconds() :: non_neg_integer, do: 30)
end
