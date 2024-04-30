defmodule Mix.Tasks.AntikytheraK8s.Stop do
  @shortdoc "Stops a locally running OTP release for an antikythera instance"

  use Mix.Task
  alias Antikythera.Env

  def run(_args) do
    :ok = AntikytheraK8s.RunningEnvironment.teardown()
    IO.puts("Successfully stopped #{Env.antikythera_instance_name()}.")
  end
end
