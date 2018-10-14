#https://elixirschool.com/pt/lessons/advanced/concurrency/


self
#PID<0.84.0>
send self, {:ok, "hello"}
# {:ok, "hello"}
receive do
	{:ok, msg} -> IO.puts(msg)
end
#hello
#:ok
send self, {:ok, "hello"}
#{:ok, "hello"}
send self, {:ok, "hello"}
#{:ok, "hello"}
send self, {:ok, "hello"}
#{:ok, "hello"}
send self, {:ok, "hello"}
#{:ok, "hello"}
send self, {:ok, "hello"}
#{:ok, "hello"}
receive do
	{:ok, msg} -> IO.puts(msg)
end
#hello
#:ok
flush
#{:ok, "hello"}
#{:ok, "hello"}
#{:ok, "hello"}
#{:ok, "hello"}
#:ok
receive do
	{:ok, msg} -> IO.puts(msg)
end
#BREAK: (a)bort (c)ontinue (p)roc info (i)nfo (l)oaded
 #      (v)ersion (k)ill (D)b-tables (d)istribution
defmodule Phils do
	def listen do
		receive do
			{:ok, msg} -> IO.puts(msg)
		end
	end
end
#{:module, Phils,
 #<<70, 79, 82, 49, 0, 0, 3, 216, 66, 69, 65, 77, 65, 116, 85, 56, 0, 0, 0, 103,
  # 0, 0, 0, 11, 12, 69, 108, 105, 120, 105, 114, 46, 80, 104, 105, 108, 115, 8,
  # 95, 95, 105, 110, 102, 111, 95, 95, 9, ...>>, {:listen, 0}}
pid = spawn(Phils, :listen, [])
#PID<0.107.0>
self
#PID<0.84.0>
send pid, {:ok, "hello"}
#hello
#{:ok, "hello"}
send pid, {:ok, "hello"}
#{:ok, "hello"}
Process.alive? pid
#false
Process.alive? self
#true
defmodule Phils do
	def listen do
		receive do
			{:ok, msg} -> IO.puts(msg)
		end
	listen
	end
end
#warning: redefining module Phils (current version defined in memory)
 # iex:10
#
#{:module, Phils,
# <<70, 79, 82, 49, 0, 0, 3, 252, 66, 69, 65, 77, 65, 116, 85, 56, 0, 0, 0, 103,
 #  0, 0, 0, 11, 12, 69, 108, 105, 120, 105, 114, 46, 80, 104, 105, 108, 115, 8,
  # 95, 95, 105, 110, 102, 111, 95, 95, 9, ...>>, {:listen, 0}}
pid = spawn(Phils, :listen, [])
#PID<0.126.0>
Process.alive? pid
#true
iex(13)> send pid, {:ok, "hello"}
#hello
#{:ok, "hello"}
iex(14)> send pid, {:ok, "hello"}
#hello
#{:ok, "hello"}
send pid, {:ok, "hello"}
#hello
#{:ok, "hello"}
send pid, {:error, "ac"}
#{:error, "ac"}
Process.alive? pid
#true
send pid, {:ok, "hello"}
#hello
#{:ok, "hello"}
send pid, {:ok, "aaaa"}
#aaaa
#{:ok, "aaaa"}
defmodule Ale do
	def loop do
		receive do
			{:ok, msg, pid} ->
			IO.puts("received: #{inspect(msg)}")
			send pid, {:ack, "olar", self}
			mari -> IO.puts("não sei o que fazer com #{inspect(mari)}")
		end
	loop
	end
end
#{:module, Ale,
# <<70, 79, 82, 49, 0, 0, 5, 248, 66, 69, 65, 77, 65, 116, 85, 56, 0, 0, 0, 149,
 #  0, 0, 0, 18, 10, 69, 108, 105, 120, 105, 114, 46, 65, 108, 101, 8, 95, 95,
 #  105, 110, 102, 111, 95, 95, 9, 102, 117, ...>>, {:loop, 0}}
pid2 = spawn(Ale, :loop, [])
#PID<0.153.0>
send pid2, {:ok, "tudo bem", self}
#received: "tudo bem"
#{:ok, "tudo bem", #PID<0.84.0>}
defmodule Sunsi do
	def loop2(pid_inicial) do
		send pid_inicial, {:ok, "tudo bem", self}
		receive do
			{:ack, "olar", pid}
			-> IO.puts("recebi olar de #{inspect(pid)}")
		end
	end
end
#{:module, Sunsi,
 #<<70, 79, 82, 49, 0, 0, 5, 132, 66, 69, 65, 77, 65, 116, 85, 56, 0, 0, 0, 152,
  # 0, 0, 0, 18, 12, 69, 108, 105, 120, 105, 114, 46, 83, 117, 110, 115, 105, 8,
   #95, 95, 105, 110, 102, 111, 95, 95, 9, ...>>, {:loop2, 1}}
pid3 = spawn(Sunsi, :loop2, [pid2])
#received: "tudo bem"
#PID<0.169.0>
#recebi olar de #PID<0.153.0>
send pi2, "cade"
#** (CompileError) iex:27: undefined function pi2/0
 #   (stdlib) lists.erl:1354: :lists.mapfoldl/3
send pid2, "cade"
#não sei o que fazer com "cade"
#"cade"