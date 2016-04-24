# radvd-cookbook

This cookbook installs radvd to configure IPv6 route advertisement

## Supported Platforms

Debian 8

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['radvd']['interface']</tt></td>
    <td>String</td>
    <td>Interface to advertise on</td>
    <td><tt>eth0</tt></td>
  </tr>
  <tr>
    <td><tt>['radvd']['interface_options']</tt></td>
    <td>Hash</td>
    <td>Key/value pairs of interface options</td>
    <td><tt>{"AdvSendAdvert": "on"}</tt></td>
  </tr>
  <tr>
    <td><tt>['radvd']['prefixes']</tt></td>
    <td>Hash</td>
    <td>Key/value pairs. Key is the prefix, value is a hash of options</td>
    <td><tt>{}</tt></td>
  </tr>
</table>

## Usage

### radvd::default

Include `radvd` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[radvd::default]"
  ]
}
```

## Authors

Bryan Alves (<bryanalves@gmail.com>)
