# Pg2Demo

This repo is a demo of pg2 for synchronization of related processes across the cluster

## Demo

1. `mix deps.get`
2. `mix compile`
3. Run the following in 2 consoles

```
elixir --name 2@127.0.0.1 -S mix run --no-halt
elixir --name 3@127.0.0.1 -S mix run --no-halt
```

4. In a 4th console, run `iex --name 1@127.0.0.1 -S mix`
5. In the 4th console, play with commands like:

```
Pg2Demo.connect()
Node.list() # [:"2@127.0.0.1", :"3@127.0.0.1"]

Pg2Demo.update()
# Sending update on {:sync_demo, Pg2Demo.Synchronization} to #PID<14511.108.0>
# Sending update on {:sync_demo, Pg2Demo.Synchronization} to #PID<14592.122.0>

# target prints: Received update on {:sync_demo, Pg2Demo.Synchronization} with test
```
