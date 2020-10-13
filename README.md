# betabot-example-plugin

```
<gyng> ~install https://raw.githubusercontent.com/gyng/betabot-example-plugin/master/manifest.json save
<betabot> 🎉 Plugin pong installed.
<betabot> Reloaded.
<betabot> Configuration saved.

<gyng> ~pong
<betabot> peng
```

This is an example plugin for [betabot](https://github.com/gyng/betabot/).

The name (in `manifest.json`), filename and classname have to follow conventions.

|||
|-|-|
|name|pong|
|filename|pong.rb|
|classname|Pong|

You will also have to fill out the keys in `manifest.json`.

## Install

```
~install https://raw.githubusercontent.com/gyng/betabot-example-plugin/master/manifest.json save
```

## Update

```
~update pong
```

## Use

```
<user> ~pong
<betabot> peng
```

## Test

```
bundle install
bundle exec rspec
```
