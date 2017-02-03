describe Match do
  describe Match::SpaceshipEnsure do
    
    before do
      expect(Spaceship).to receive(:login).and_return(nil)
      allow(Spaceship).to receive(:client).and_return("client")
      expect(Spaceship).to receive(:select_team).and_return(nil)
    end
    it "initialize" do
    
      credentials = CredentialsManager::AccountManager.new(user: "helmut@januschka.com", password: "1234")
      expect(CredentialsManager::AccountManager).to receive(:new).and_return(credentials)
      spaceship = Match::SpaceshipEnsure.new("helmut@januschka.com")
    
    end  
    it "should print note about missing PW" do
      credentials = CredentialsManager::AccountManager.new(user: "helmut@januschka.com", password: "")
      expect(CredentialsManager::AccountManager).to receive(:new).and_return(credentials)
      expect(FastlaneCore::UI).to receive(:important).with("You can also run `match` in readonly mode to not require any access to the")
      allow(FastlaneCore::UI).to receive(:important)
      spaceship = Match::SpaceshipEnsure.new("helmut@januschka.com")
     
    end
    it "bundle_identifier_exists" do
      credentials = CredentialsManager::AccountManager.new(user: "helmut@januschka.com", password: "1234")
      expect(CredentialsManager::AccountManager).to receive(:new).and_return(credentials)
      allow(Spaceship).to receive(:login).and_return(nil)
      allow(Spaceship).to receive(:client).and_return("client")
      spaceship = Match::SpaceshipEnsure.new("helmut@januschka.com")
      spaceship.bundle_identifier_exists(username: "helmut@januschka.com", app_identifier: "demo.app")
    end
  end
end
