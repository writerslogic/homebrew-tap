cask "writersproof" do
  version "1.0.11"
  sha256 "c3c201098665c887d0461eb0922fd97738ff6d30f4c7c5f39c96bc08897e5f6b"

  url "https://updates.writerslogic.com/WritersProof-#{version}.dmg"
  name "WritersProof"
  desc "Cryptographic authorship witnessing for writers and creators"
  homepage "https://writerslogic.com"

  depends_on macos: :sonoma
  depends_on formula: "writerslogic/tap/writersproof"

  app "WritersProof.app"

  zap trash: [
    "~/Library/Application Support/WritersProof",
    "~/Library/Application Support/CPOP",
    "~/.writersproof",
    "~/Library/Caches/com.writerslogic.witnessd",
    "~/Library/HTTPStorages/com.writerslogic.witnessd",
    "~/Library/Preferences/com.writerslogic.witnessd.plist",
    "~/Library/Saved Application State/com.writerslogic.witnessd.savedState",
  ],
  rmdir: [
    "~/Library/Application Support/WritersProof",
    "~/Library/Application Support/CPOP",
  ]
end
