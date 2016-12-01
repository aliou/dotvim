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
      \   "app/uploaders/*_uploader.rb": {
      \     "command":  "uploader",
      \     "template": ["class %SUploader < CarrierWave::Uploader::Base", "end"],
      \     "test":     "spec/models/%s_uploader_spec.rb"
      \   },
      \   "app/services/*.rb": {
      \       "command":  "service",
      \       "template": "class %S\nend",
      \       "test":     "spec/services/%s_spec.rb"
      \   },
      \   "app/decorators/*_decorator.rb": {
      \     "command":  "decorator",
      \     "template": ["class {camelcase|capitalize|colons}Decorator"
      \                  . " < Draper::Decorator", "end"],
      \     "test": [
      \       "test/unit/%s_decorator_test.rb",
      \       "spec/decorators/%s_decorator_spec.rb"
      \     ],
      \    "affinity": "model"
      \   },
      \ }
