directory 'c:\win_patches' do
  action :create
end

remote_file 'c:\win_patches\windows8.1-kb4056898-v2-x64_754f420c1d505f4666437d06ac97175109631bf2.msu' do
  source 'http://download.windowsupdate.com/c/msdownload/update/software/secu/2018/01/windows8.1-kb4056898-v2-x64_754f420c1d505f4666437d06ac97175109631bf2.msu'
end

msu_package 'Install Windows2012r2 KB4056898 Meltdown Patch' do
  source 'c:\win_patches\windows8.1-kb4056898-v2-x64_754f420c1d505f4666437d06ac97175109631bf2.msu'
  action :install
end

registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' do
  values [{
    name: 'FeatureSettingsOverride',
    type: :dword,
    data: 0
  }]
  action :create
end

registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' do
  values [{
    name: 'FeatureSettingsOverrideMask',
    type: :dword,
    data: 3
  }]
  action :create
end

registry_key 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization' do
  values [{
    name: 'MinVmVersionForCpuBasedMitigations',
    type: :string,
    data: '1.0'
  }]
  action :create
end
