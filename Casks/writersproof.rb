cask "writersproof" do
  version "1.0.12"
  sha256 "ef095bed93b76ff75583036528855e3e2a3d10e4b5ce3e4662bb0fff53e06b78"

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
