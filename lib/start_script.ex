use Croma

defmodule AntikytheraK8s.StartScript do
  alias Antikythera.Env
  alias AntikytheraLocal.Cmd
  alias AntikytheraK8s.NodeName

  defun run(command :: v[String.t()], release_dir :: Path.t()) :: :ok do
    env = [
      {"ANTIKYTHERA_RUNTIME_ENV", "local"},
      {"MIX_ENV", "prod"},
      {"RELEASE_NODE", Atom.to_string(NodeName.get())},
      {"RELEASE_COOKIE", "local"}
    ]

    Cmd.exec_and_output_log!("sh", ["bin/#{Env.antikythera_instance_name()}", command],
      env: env,
      cd: release_dir
    )
  end
end
