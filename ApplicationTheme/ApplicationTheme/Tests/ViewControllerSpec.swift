import Foundation
import Nimble
import Quick
import Spry
import Spry_Nimble

@testable import ApplicationTheme

private typealias ViewID = ViewController.ViewID

class ViewControllerSpec: QuickSpec {
    override func spec() {
        
        describe("given a ViewController") {
            var subject: ViewController!
            var themer: FakeUIThemer!
            
            beforeEach {
                themer = FakeUIThemer()
                
                subject = createViewController(ViewController.self, storyboardName: "Main", storyboardIdentifier: "ViewController")
                subject.inject(themer: themer)
                testViewController(subject)
            }
            
            it("should initialize the UI") {
                let nameLabel = self.getView(ViewID.nameLabel, UILabel.self)
                expect(themer).to(haveReceived(.applyToLabel, with: [LabelStyle.inputField] as [LabelStyle], nameLabel))
            }
        }
        
    }
}
