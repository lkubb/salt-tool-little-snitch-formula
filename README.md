# Little Snitch Formula
Currently only installs Little Snitch.

## Usage
Applying `tool-snitch` will make sure Little Snitch is configured as specified.

## Configuration
### Pillar
#### General `tool` architecture
Since installing user environments is not the primary use case for saltstack, the architecture is currently a bit awkward. All `tool` formulas assume running as root. There are three scopes of configuration:
1. per-user `tool`-specific
  > e.g. generally force usage of XDG dirs in `tool` formulas for this user
2. per-user formula-specific
  > e.g. setup this tool with the following configuration values for this user
3. global formula-specific (All formulas will accept `defaults` for `users:username:formula` default values in this scope as well.)
  > e.g. setup system-wide configuration files like this

**3** goes into `tool:formula` (e.g. `tool:git`). Both user scopes (**1**+**2**) are mixed per user in `users`. `users` can be defined in `tool:users` and/or `tool:formula:users`, the latter taking precedence. (**1**) is namespaced directly under `username`, (**2**) is namespaced under `username: {formula: {}}`.

```yaml
tool:
######### user-scope 1+2 #########
  users:                         #
    username:                    #
      xdg: true                  #
      dotconfig: true            #
      formula:                   #
        config: value            #
####### user-scope 1+2 end #######
  formula:
    formulaspecificstuff:
      conf: val
    defaults:
      yetanotherconfig: somevalue
######### user-scope 1+2 #########
    users:                       #
      username:                  #
        xdg: false               #
        formula:                 #
          otherconfig: otherval  #
####### user-scope 1+2 end #######
```

#### User-specific
The following shows an example of `tool-snitch` pillar configuration. Namespace it to `tool:users` and/or `tool:snitch:users`.
```
 _______________
< many settings >
 ---------------
        \   ^__^
         \  (xx)\_______
            (__)\       )\/\
             U  ||----w |
                ||     ||
```

#### Formula-specific
```yaml
tool:
  snitch:
    license: |
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>d8e8fca2dc0</key>
        <data>
        PCFET0NUWVBFIHBsaXN0IFBVQkxJQyAiLS8vQXAK
        </data>
        <key>57a54c8e2</key>
        <dict>
          <key>owner</key>
          <string>user</string>
        </dict>
        <key>b5470458133</key>
        <data>
        PCFET0NUWVBFIHBsaXN0IFBVQkxJQyAiLS8vQXBwCg==
        </data>
      </dict>
      </plist>
```
This license is a made-up example, of course (verify: `echo 'PCFET0NUWVBFIHBsaXN0IFBVQkxJQyAiLS8vQXBwCg==' | base64 -d`). I'm currently hoping this is derived from your registration data only and therefore installable automatically.
Find `/Library/Application Support/Objective Development/Little Snitch/registration.xpl` after registering Little Snitch and paste its contents into the pillar.

## Todo
- manage little snitch rules with custom states (would need scripting enabled)
### figure out a way to automate licensing
- (found [this](https://community.jamf.com/t5/jamf-pro/deploy-little-snitch-license/m-p/145257) about `BundledLicenseKey.txt` in `/Library/Little Snitch`, but that does not work with LS5 for me)
- found `/Library/Application Support/Objective Development/Little Snitch/registration.xpl`. maybe that file is only dependent on serial/owner.
