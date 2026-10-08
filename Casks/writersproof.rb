cask "writersproof" do
  version "1.0.21"
  sha256 "accdb612dfc2123e41c4d5aac08a9f2e74d5b0502c0d33bc22374fa47ca1f05e"

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
