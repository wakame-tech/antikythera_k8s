use Croma

defmodule AntikytheraK8s.NodeName do
  defun get() :: atom do
    {host, 0} = System.cmd("hostname", ["-i"])
    ip_addr = String.trim_trailing(host)
    # credo:disable-for-next-line Credo.Check.Warning.UnsafeToAtom
    String.to_atom("antikythera@" <> ip_addr)
  end
end
