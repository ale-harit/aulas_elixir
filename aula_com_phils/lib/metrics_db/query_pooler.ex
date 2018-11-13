# iex -S mix

defmodule MetricsDB.QueryPooler do
	def loop(count) do
		Process.send_after(self, {:call, count}, 2000)
		receive do
			{:call, 5} ->
				raise "ahhhh" 
			{:call, num} -> 
				IO.puts("calling #{num}")
				Process.sleep(5000)
			_ -> IO.puts("ignoring")
		end
		loop(count + 1)
	end
end