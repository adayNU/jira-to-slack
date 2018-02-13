# jira-to-slack

A simple gem to convert JIRA markdown into Slack markdown. You can find the gem [here](https://rubygems.org/gems/jira-to-slack).

### Usage

There is only one method, `convert` which accepts a string (which should be JIRA markdown) and returns a string (which will be Slack mardown).

```ruby
JiraToSlack.convert("-This line is totally crossed out-")
=> "~This line is totally crossed out~"
```

I'm sure there are *more* cases I've missed, but hey, maybe I'll get around to working on this a bit more, *again*.
