let g:rails_projections = {
      \   "config/routes.rb": {
      \     "command":  "routes"
      \   },
      \   "app/serializers/*_serializer.rb": {
      \     "command":  "serializer",
      \     "affinity": "model",
      \     "test":     "spec/serializers/%s_spec.rb",
      \     "related":  "app/models/%s.rb",
      \     "template": "class %SSerializer < ActiveModel::Serializer\nend"
      \   },
      \   "app/services/*.rb": {
      \       "command":  "service",
      \       "template": "class %S\nend",
      \       "test":     "spec/services/%s_spec.rb"
      \   },
      \  "app/controllers/*_controller.rb": {
      \     "test": [
      \       "spec/requests/{}_spec.rb",
      \       "spec/controllers/{}_controller_spec.rb",
      \       "test/controllers/{}_controller_test.rb"
      \     ],
      \     "alternate": [
      \       "spec/requests/{}_spec.rb",
      \       "spec/controllers/{}_controller_spec.rb",
      \       "test/controllers/{}_controller_test.rb"
      \     ],
      \   },
      \   "spec/requests/*_spec.rb": {
      \     "command": "request",
      \     "alternate": "app/controllers/{}_controller.rb",
      \     "template": "require 'rails_helper'\n\n" .
      \       "RSpec.describe '{}' do\nend",
      \   },
      \   "db/data/*.rb": {
      \     "command": "data"
      \   },
      \ }
