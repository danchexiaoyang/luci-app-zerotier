a = Map("zerotier", translate("ZeroTier"), translate("Zerotier是一个开源的、跨平台且易于使用的虚拟局域网"))
a:section(SimpleSection).template = "zerotier/zerotier_status"

t = a:section(NamedSection, "sample_config", "zerotier")
t.anonymous = true
t.addremove = false

e = t:option(Flag, "enabled", translate("启用"))
e.default = 0
e.rmempty = false

e = t:option(DynamicList, "join", translate('ZeroTier网络ID'))
e.password = true
e.rmempty = false

e = t:option(Flag, "nat", translate("自动NAT客户端"))
e.default = 0
e.rmempty = false

e = t:option(MultiValue, "access", translate("Zerotier访问控制"))
e.default = "lanfwzt ztfwwan ztfwlan"
e.rmempty = false
e:value("lanfwzt", translate("局域网访问Zerotier"))
e:value("wanfwzt", translate("广域网访问Zerotier"))
e:value("ztfwwan", translate("远程访问广域网"))
e:value("ztfwlan", translate("远程访问局域网"))
e.widget = "checkbox"

e = t:option(DummyValue, "opennewwindow", 
	translate("<input type=\"button\" class=\"cbi-button cbi-button-apply\" value=\"Zerotier.com\" onclick=\"window.open('https://my.zerotier.com/network')\" />"))
e.description = translate("创建或管理您的Zerotier网络，并授权可以访问的客户端")

return a
