# ApplicationTheme

Use protocol to apply themes to UI elements.

## Why?

I have a very complex, multi-module, application which requires a separation of "themes" per module. This pattern provides me with a way to define the tyeps of styles that can be applied for a given module (or application) and then apply those styles to elements in the app or module layer.

## Example

This example shows how you can apply styles to `IBOutlet` properties at the time they are created.

```swift
class ViewController: UIViewController {

    // ...

    @IBOutlet weak var submitButton: UIButton! {
        didSet {
            submitButton.identifier = ViewID.submitButton
            theme.apply(.primary, toButton: submitButton)
            // ^^ apply the `.primary` style to the `submitButton`
        }
    }

    @IBOutlet weak var logTextView: UITextView! {
        didSet {
            logTextView.identifier = ViewID.logTextView
            theme.apply(.regular15, .bold(text: "bold"), toTextView: logTextView)
            // ^^ apply one or more styles to the `logTextView`.
        }
    }

    private var theme = UIThemeApplier<AppTheme>()

    func inject(theme: AnyUITheme<AppTheme>) {
        self.theme.concrete = theme
        // ^^ setting the `concrete` instance here reconciles any themes that attempted to be applied before `concrete` was provided.
    }

    // ...
}

```

This example shows you how to conform to the `UIStyle` and `UITheme` protocols.

```swift
class AppTheme: UIStyle {
    enum ButtonStyle {
        case primary
        case secondary
        case tertiary
    }

    // ... you'll have to ensure all `*Style`s are provided.
}

// You don't have to do this, but it certainly makes it more clear as to the relationship between the `UIStyle` and `UITheme`. You could just as easily rename `AppTheme: UIStyle` to `AppStyle`, make this a class (instead of an extension), and have the alias be `AppStyle`.
extension AppTheme: UITheme {

    typealias Style = AppTheme

    func apply(_ styles: [ButtonStyle], toButton button: UIButton) {
        for style in styles {
            switch style {
            case .primary:
                print("primary")
            case .secondary:
                print("secondary")
            case .tertiary:
                print("tertiary")
            }
        }
    }

    // ...
}

```

## TODO
