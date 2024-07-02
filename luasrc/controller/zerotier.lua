module("luci.controller.zerotier", package.seeall)

function index()
  if not nixio.fs.access("/etc/config/zerotier") then
    return
  end

  entry({"admin", "vpn"}, firstchild(), "VPN", 45).dependent = false
  entry({"admin", "vpn", "zerotier"}, firstchild(), _("ZeroTier")).dependent = false

  entry({"admin", "vpn", "zerotier", "general"}, cbi("zerotier/settings"), _("基本设置"), 1)
  entry({"admin", "vpn", "zerotier", "log"}, form("zerotier/info"), _("接口信息"), 2)
  entry({"admin", "vpn", "zerotier", "manual"}, cbi("zerotier/manual"), _("手动配置"), 3)

  entry({"admin", "vpn", "zerotier", "status"}, call("act_status"))
end

function act_status()
  local e = {}
  e.running = luci.sys.call("pgrep /usr/bin/zerotier-one >/dev/null") == 0
  luci.http.prepare_content("application/json")
  luci.http.write_json(e)
end
