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
            var theme: FakeAnyUITheme<AppTheme>!
            
            beforeEach {
                theme = FakeAnyUITheme<AppTheme>()
                
                subject = createViewController(ViewController.self, storyboardName: "Main", storyboardIdentifier: "ViewController")
                subject.inject(theme: theme)
                testViewController(subject)
            }
            
            it("should initialize the UI") {
                let nameLabel = self.getView(ViewID.nameLabel, UILabel.self)
                expect(theme).to(haveReceived(.applyToLabel, with: [AppTheme.LabelStyle.inputField] as [AppTheme.LabelStyle], nameLabel))
            }
        }
        
    }
}
