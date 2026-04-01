class TeamsSpotifySync < Formula
  desc "Auto-adjust Spotify volume during Microsoft Teams meetings"
  homepage "https://github.com/serubin/teams-spotify-sync"
  url "https://github.com/serubin/teams-spotify-sync/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "eb3719dbe004118d0c2e32c2b5ee5f78d8052b41669c0818ea6bfc9cfc063d8c"
  license "MIT"

  depends_on :macos
  depends_on "jq"

  def install
    bin.install "teams-spotify-sync"
  end

  def caveats
    <<~EOS
      To get started:
        teams-spotify-sync setup

      Required external tool (not managed by this formula):
        teams-monitor: dotnet tool install -g svrooij.teams-monitor

      To start automatically on login:
        teams-spotify-sync install

      To stop and remove:
        teams-spotify-sync uninstall
    EOS
  end

  test do
    assert_match "teams-spotify-sync v#{version}", shell_output("#{bin}/teams-spotify-sync version")
  end
end
