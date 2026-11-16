cask "wireant" do
  version "0.7.0"
  sha256 "248df1a0711885e9167a52ab713743578e0f71dd0c1caab694f4229aee087f8f"

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
