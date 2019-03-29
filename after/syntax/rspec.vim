syntax match point '\.' nextgroup=rspec_focused_keywords
syntax match rspec_focused_keywords "f\(describe\|context\|it\)"

syntax match rspec_comma ', *' nextgroup=rspec_focused
syntax match rspec_focused "focus: *true"
syntax match rspec_focused ":focus"

highlight link rspec_focused Error
highlight link rspec_focused_keywords Error
