#
# Cookbook Name:: commandp
# Recipe:: default
#

include_recipe "mac_os_x"

## 自動登入 commandp
mac_os_x_userdefaults "自動登入 #{node['user']}" do
  domain "/Library/Preferences/com.apple.loginwindow"
  key "autoLoginUser"
  value "#{node['user']}"
  sudo true
end

mac_os_x_userdefaults "系統偏好設定 / 安全性與隱私, 取消喚醒輸入密碼" do
  domain "com.apple.screensaver"
  key "askForPassword"
  value "0"
  type "int"
end
