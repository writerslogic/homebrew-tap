cask "writersproof" do
  version "1.0.5-1514-g1f7877db"
  sha256 "6316c7c3a54a4f7dff4ebed91e84856dca9458e38708c106504fbd0f440836d9"

  url "https://updates.writerslogic.com/WritersProof-#{version}.dmg"
  name "WritersProof"
  desc "Cryptographic authorship witnessing for writers and creators"
  homepage "https://writerslogic.com"

  depends_on macos: ">= :sonoma"

  app "WritersProof.app"

  zap trash: [
    "~/Library/Application Support/WritersProof",
    "~/Library/Application Support/CPOP",
    "~/Library/Caches/com.writerslogic.witnessd",
    "~/Library/Preferences/com.writerslogic.witnessd.plist",
  ]
end
