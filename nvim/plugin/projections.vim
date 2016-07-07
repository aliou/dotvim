if !exists("g:projectionist_heuristics")
    let g:projectionist_heuristics = {}
endif

" Elixir / Phoenix projections.
" TODO: Find a way to change the project name. (Dynamic ?)
" TODO: Add templates.
let g:projectionist_heuristics['mix.exs'] = {
      \   "mix.exs": {
      \     "type": "lib",
      \     "alternate": "mix.lock"
      \   },
      \   "web/web.ex": {
      \     "type": "web"
      \   },
      \   "lib/*.ex": {
      \     "type": "lib",
      \     "alternate": "test/lib/{}_test.exs",
      \     "template": [
      \       "defmodule {camelcase} do",
      \       "  @moduledoc \"\"\"",
      \       "  \"\"\"",
      \       "",
      \       "end"
      \     ]
      \   },
      \   "mix.lock": {
      \     "alternate": "mix.exs"
      \   },
      \   "web/models/*.ex": {
      \     "type": "model",
      \     "alternate": "test/models/{}_test.exs",
      \     "template": [
      \       "defmodule ProjectName.{camelcase} do",
      \       "  @moduledoc \"\"\"",
      \       "  \"\"\"",
      \       "",
      \       "  use ProjectName.Web, :model",
      \       "end"
      \     ]
      \   },
      \   "web/controllers/*_controller.ex": {
      \     "type": "controller",
      \     "alternate": "test/controllers/{}_controller_test.exs",
      \     "template": [
      \       "defmodule ProjectName.{camelcase}Controller do",
      \       "  @moduledoc \"\"\"",
      \       "  \"\"\"",
      \       "",
      \       "  use ProjectName.Web, :controller",
      \       "end"
      \     ]
      \   },
      \   "web/channels/*_channel.ex": {
      \     "type": "channel",
      \     "alternate": "test/channels/{}_test.exs",
      \     "template": [
      \     "defmodule ProjectName.{camelcase}Channel do",
      \     "  @moduledoc \"\"\"",
      \     "  \"\"\"",
      \     "",
      \     "  use ProjectName.Web, :channel",
      \     "",
      \     "  def join(\"{plural}:\" <> subtopic, _parms, socket) do",
      \     "    {open}:ok, assigns(socket, :subtopic, subtopic){close}",
      \     "  end",
      \     "end"
      \     ]
      \   },
      \   "web/encoders/*.ex": {
      \     "type": "encoder",
      \     "alternate": "test/encoders/{}_test.exs"
      \   },
      \   "web/plugs/*.ex": {
      \     "type": "plug",
      \     "alternate": "test/plug/{}_test.exs"
      \   },
      \   "web/views/*_view.ex": {
      \     "type": "view",
      \     "alternate": "test/views/{}_test.exs",
      \     "template": [
      \       "defmodule ProjectName.{camelcase}View do",
      \       "  @moduledoc \"\"\"",
      \       "  \"\"\"",
      \       "",
      \       "  use ProjectName.Web, :view",
      \       "end"
      \     ]
      \   },
      \   "web/router.ex": {
      \     "type": "router"
      \   },
      \   "test/test_helper.exs": {
      \     "type": "test"
      \   },
      \   "test/controllers/*_test.exs": {
      \     "alternate": "web/controllers/{}.ex",
      \     "template": [
      \       "defmodule ProjectName.{camelcase}ControllerTest do",
      \       "  use ProjectName.ConnCase",
      \       "",
      \       "end"
      \     ]
      \   },
      \   "test/models/*_test.exs": {
      \     "alternate": "web/models/{}.ex"
      \   },
      \   "test/lib/*_test.exs": {
      \     "alternate": "lib/{}.ex"
      \   },
      \   "test/*_test.exs": {
      \     "command": "test",
      \     "dispatch": "mix test {file}"
      \   },
      \
      \   "priv/repo/migrations/*.exs": {
      \     "type": "migration"
      \   },
      \   "priv/repo/seeds.exs": {
      \     "type": "seed"
      \   },
      \
      \   "web/static/js/*.js": {
      \     "type": "js",
      \     "template": [
      \       "let {capitalize} = {open}",
      \       "{close}",
      \       "export default {capitalize}"
      \     ]
      \   },
      \   "web/static/css/*.css": {
      \     "type": "css"
      \   },
      \
      \   "*": {
      \     "make": "mix test",
      \     "console": "iex -S mix phoenix.server",
      \     "start": "mix phoenix.server"
      \   }
      \ }

" Jekyll project.
let g:projectionist_heuristics['_config.yml'] = {
      \    "_config.yml": {
      \      "type": "config"
      \    },
      \    "_layouts/*.html": {
      \      "type": "layout"
      \    },
      \    "_includes/*.html": {
      \      "type": "include"
      \    },
      \    "_posts/*.md": {
      \      "type": "post",
      \      "template": [
      \        "---",
      \        "layout: post",
      \        "title: ",
      \        "---"
      \      ],
      \      "console": "pry",
      \      "dispatch": "pry"
      \    },
      \    "_drafts/*.md": {
      \      "type": "draft",
      \      "template": [
      \        "---",
      \        "layout: post",
      \        "title: ",
      \        "---"
      \      ]
      \    },
      \  }
