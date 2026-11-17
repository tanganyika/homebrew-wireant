cask "wireant" do
  version "0.8.0"
  sha256 "dc7a2b9aff686d1096da892153087b20828bd14f849c5e34c81d3d5c6183b97f"

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
