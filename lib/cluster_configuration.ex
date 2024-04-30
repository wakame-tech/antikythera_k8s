use Croma
alias Croma.Result, as: R

defmodule AntikytheraK8s.ClusterConfiguration do
  @behaviour AntikytheraEal.ClusterConfiguration.Behaviour

  defun get_pod_ip_and_statuses(label_app :: String.t()) :: Map.t(String.t(), boolean()) do
    {res, 0} =
      System.cmd("kubectl", [
        "get",
        "pods",
        "-o",
        "json"
      ])

    Jason.decode!(res)
    |> Map.get("items")
    |> Enum.filter(fn item ->
      item["kind"] == "Pod" && item["metadata"]["labels"]["app"] == label_app
    end)
    |> Enum.map(fn item -> {item["status"]["podIP"], item["status"]["phase"] == "Running"} end)
    |> Map.new()
  end

  @impl true
  defun running_hosts() :: R.t(%{String.t() => boolean}) do
    hosts_with_status = get_pod_ip_and_statuses("antikythera-k8s")

    # hosts_with_status = %{
    #   "antikythera-k8s-1.local" => true,
    #   "antikythera-k8s-2.local" => true,
    #   "antikythera-k8s-3.local" => true
    # }

    {:ok, hosts_with_status}
  end

  @impl true
  defun(zone_of_this_host() :: String.t(), do: "zone")

  @impl true
  defun(health_check_grace_period_in_seconds() :: non_neg_integer, do: 30)
end
