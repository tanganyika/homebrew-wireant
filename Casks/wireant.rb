cask "wireant" do
  version "0.9.0"
  sha256 "3ca7f373ddeabd8d6116e2b173902e960eeb9ee5e22527c103b6f07fe37eedab"

  url "https://github.com/tanganyika/wireant/releases/download/v#{version}/wireant-#{version}-macos-universal.dmg"
  name "wireant"
  desc "Wire antenna modelling with MININEC, wiremom and NEC-2 engines"
  homepage "https://github.com/tanganyika/wireant"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "wireant.app"

  # the app is signed ad hoc, not notarised: without this macOS refuses to open it
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/wireant.app"]
  end

  zap trash: "~/Library/Application Support/wireant"
end
