cask 'daisydisk' do
  if MacOS.version <= :mavericks
    version '3.0.3.1'
    sha256 'fe2aa86f2ea8a1f0c4791857a5b7991ecad295b5b969849bb7b15a890ab54b86'
    url "https://www.daisydiskapp.com/downloads/DaisyDisk_#{version.dots_to_underscores}.zip"
  else
    version '4.8'
    sha256 'f70cacb60dccf465219dc551086a0672d3db6b003c42302bdfff11319c08cd4a'
    url 'https://www.daisydiskapp.com/downloads/DaisyDisk.zip'
    appcast 'https://daisydiskapp.com/downloads/appcastReleaseNotes.php?appEdition=Standard&osVersion=10.13'
  end

  name 'DaisyDisk'
  homepage 'https://daisydiskapp.com/'

  auto_updates true

  app 'DaisyDisk.app'

  uninstall delete:    '/Library/PrivilegedHelperTools/com.daisydiskapp.DaisyDiskAdminHelper',
            launchctl: 'com.daisydiskapp.DaisyDiskAdminHelper'

  zap trash: [
               '~/Library/Application Support/DaisyDisk',
               '~/Library/Caches/com.daisydiskapp.DaisyDiskStandAlone',
               '~/Library/Preferences/com.daisydiskapp.DaisyDiskStandAlone.plist',
             ]
end
