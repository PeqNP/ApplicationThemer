import Foundation
import Nimble
import Quick
import Spry_Nimble

@testable import ApplicationTheme

private typealias ViewID = ViewController.ViewID

class ViewControllerSpec: QuickSpec {
    override func spec() {
        
        describe("given a ViewController") {
            var subject: ViewController!
            var themer: FakeApplicationThemer!
            
            beforeEach {
                themer = FakeApplicationThemer()
                
                subject = createViewController(ViewController.self, storyboardName: "Main", storyboardIdentifier: "ViewController")
                subject.inject(themer: themer)
            }
            
            it("should initialize the UI") {
                let nameLabel = self.getView(ViewID.nameLabel, UILabel.self)
                expect(themer).to(haveReceived(.applyToLabel, with: LabelTheme.inputField, nameLabel))
            }
        }
        
    }
}
