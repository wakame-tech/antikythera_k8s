defmodule Mix.Tasks.AntikytheraK8s.Start do
  @shortdoc "Builds an OTP release for an antikythera instance and runs it with the specified gears"

  use Mix.Task
  alias Antikythera.Env

  def run(gear_repo_dirs) do
    if !Enum.empty?(AntikytheraK8s.RunningEnvironment.currently_running_os_process_ids()) do
      raise "#{Env.antikythera_instance_name()} already started"
    end

    AntikytheraK8s.RunningEnvironment.setup(gear_repo_dirs)
    IO.puts("Successfully started #{Env.antikythera_instance_name()}.")
  end
end
