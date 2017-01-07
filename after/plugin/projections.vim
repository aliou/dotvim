" Projectionist configuration.
if !exists("g:projectionist_heuristics")
  let g:projectionist_heuristics = {}
endif

" Jekyll projects
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
      \      "type": "post"
      \    },
      \    "_drafts/*.md": {
      \      "type": "draft"
      \    },
      \    "_data/*.json": {
      \      "type": "data"
      \    },
      \    "_data/*.csv": {
      \      "type": "data"
      \    },
      \  }
