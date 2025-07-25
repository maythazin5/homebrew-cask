cask "geekbench-ai" do
  version "1.4.0"
  sha256 "517cc4b4da6088d8815709c1ccb6698faa57b3ac0de50efda240c11e03cb1930"

  url "https://cdn.geekbench.com/GeekbenchAI-#{version}-Mac.zip"
  name "Geekbench AI"
  desc "Cross-platform AI benchmark to evaluate AI workload performance"
  homepage "https://www.geekbench.com/ai/"

  # The Sparkle feed does not list items within a channel element, so it's
  # necessary to parse it using the `xml` strategy.
  livecheck do
    url "https://www.primatelabs.com/appcast/geekbenchai.xml"
    strategy :xml do |xml|
      xml.get_elements("//item/enclosure").map { |item| item.attributes["shortVersionString"] }
    end
  end

  depends_on macos: ">= :ventura"

  app "Geekbench AI.app"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.primatelabs.macos.geekbenchml.sfl*",
    "~/Library/Caches/com.primatelabs.macos.geekbenchml",
    "~/Library/HTTPStorages/com.primatelabs.macos.geekbenchml",
    "~/Library/Preferences/com.primatelabs.macos.geekbenchml.plist",
    "~/Library/Saved Application State/com.primatelabs.macos.geekbenchml.savedState",
  ]
end
