cask "writersproof" do
  version "1.4.0"
  sha256 "4be9c13921d0b57f382d45b34bca1f379cd20c82e7067fde2f805669f51265a2"

  url "https://updates.writerslogic.com/WritersProof-#{version}.dmg"
  name "WritersProof"
  desc "Cryptographic authorship witnessing for writers and creators"
  homepage "https://writerslogic.com"

  depends_on macos: ">= :sonoma"
  depends_on formula: "writerslogic/tap/writersproof-cli"

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
