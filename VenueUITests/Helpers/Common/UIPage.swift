import XCTest
import Nimble

// MARK: - UIPage

protocol UIPage {

    associatedtype UIElementType: UIElement

    /// Parent uitest instance
    var uiTest: BaseTest { get }
}

// MARK: - Internal

extension UIPage {

    // MARK: - Accessors

    var navigationBars: XCUIElementQuery {
        findAll(.navigationBar)
    }

    var sliders: XCUIElementQuery {
        findAll(.slider)
    }

    var switches: XCUIElementQuery {
        findAll(.switch)
    }

    var segments: XCUIElementQuery {
        findAll(.segmentedControl)
    }

    var textViews: XCUIElementQuery {
        findAll(.textView)
    }

    var textFields: XCUIElementQuery {
        findAll(.textField)
    }

    var scrollViews: XCUIElementQuery {
        findAll(.scrollView)
    }

    var labels: XCUIElementQuery {
        findAll(.staticText)
    }

    var alerts: XCUIElementQuery {
        findAll(.alert)
    }

    var others: XCUIElementQuery {
        findAll(.other)
    }

    var buttons: XCUIElementQuery {
        findAll(.button)
    }

    var tables: XCUIElementQuery {
        findAll(.table)
    }

    var collections: XCUIElementQuery {
        findAll(.collectionView)
    }

    var images: XCUIElementQuery {
        findAll(.image)
    }

    var cells: XCUIElementQuery {
        findAll(.cell)
    }

    var pickers: XCUIElementQuery {
        findAll(.picker)
    }

    var activityIndicators: XCUIElementQuery {
        findAll(.activityIndicator)
    }

    func activityIndicator(_ element: UIElementType) -> XCUIElement {
        activityIndicators[element.accessibilityIdentifier]
    }

    func navigationBar(_ element: UIElementType) -> XCUIElement {
        navigationBars[element.accessibilityIdentifier]
    }

    func slider(_ element: UIElementType) -> XCUIElement {
        sliders[element.accessibilityIdentifier]
    }

    func `switch`(_ element: UIElementType) -> XCUIElement {
        switches[element.accessibilityIdentifier]
    }

    func segment(_ element: UIElementType) -> XCUIElement {
        segments[element.accessibilityIdentifier]
    }

    func textView(_ element: UIElementType) -> XCUIElement {
        textViews[element.accessibilityIdentifier]
    }

    func textField(_ element: UIElementType) -> XCUIElement {
        textFields[element.accessibilityIdentifier]
    }

    func label(_ element: UIElementType) -> XCUIElement {
        labels[element.accessibilityIdentifier]
    }

    func scrollView(_ element: UIElementType) -> XCUIElement {
        scrollViews[element.accessibilityIdentifier]
    }

    func alert(_ element: UIElementType) -> XCUIElement {
        alerts[element.accessibilityIdentifier]
    }

    func other(_ element: UIElementType) -> XCUIElement {
        others[element.accessibilityIdentifier]
    }

    func button(_ element: UIElementType) -> XCUIElement {
        buttons[element.accessibilityIdentifier]
    }

    func table(_ element: UIElementType) -> XCUIElement {
        tables[element.accessibilityIdentifier]
    }

    func collection(_ element: UIElementType) -> XCUIElement {
        collections[element.accessibilityIdentifier]
    }

    func image(_ element: UIElementType) -> XCUIElement {
        images[element.accessibilityIdentifier]
    }

    func cell(_ element: UIElementType) -> XCUIElement {
        cells[element.accessibilityIdentifier]
    }

    func navigationBars(_ element: UIElementType) -> XCUIElementQuery {
        navigationBars.matching(identifier: element.accessibilityIdentifier)
    }

    func sliders(_ element: UIElementType) -> XCUIElementQuery {
        sliders.matching(identifier: element.accessibilityIdentifier)
    }

    func `switches`(_ element: UIElementType) -> XCUIElementQuery {
        switches.matching(identifier: element.accessibilityIdentifier)
    }

    func segments(_ element: UIElementType) -> XCUIElementQuery {
        segments.matching(identifier: element.accessibilityIdentifier)
    }

    func textViews(_ element: UIElementType) -> XCUIElementQuery {
        textViews.matching(identifier: element.accessibilityIdentifier)
    }

    func textFields(_ element: UIElementType) -> XCUIElementQuery {
        textFields.matching(identifier: element.accessibilityIdentifier)
    }

    func labels(_ element: UIElementType) -> XCUIElementQuery {
        labels.matching(identifier: element.accessibilityIdentifier)
    }

    func alerts(_ element: UIElementType) -> XCUIElementQuery {
        alerts.matching(identifier: element.accessibilityIdentifier)
    }

    func others(_ element: UIElementType) -> XCUIElementQuery {
        others.matching(identifier: element.accessibilityIdentifier)
    }

    func buttons(_ element: UIElementType) -> XCUIElementQuery {
        buttons.matching(identifier: element.accessibilityIdentifier)
    }

    func tables(_ element: UIElementType) -> XCUIElementQuery {
        tables.matching(identifier: element.accessibilityIdentifier)
    }

    func collections(_ element: UIElementType) -> XCUIElementQuery {
        collections.matching(identifier: element.accessibilityIdentifier)
    }

    func images(_ element: UIElementType) -> XCUIElementQuery {
        images.matching(identifier: element.accessibilityIdentifier)
    }

    func cells(_ element: UIElementType) -> XCUIElementQuery {
        cells.matching(identifier: element.accessibilityIdentifier)
    }

    func picker(_ element: UIElementType) -> XCUIElement {
        pickers[element.accessibilityIdentifier]
    }

    func waitForElementToAppear(_ element: XCUIElement, timeout: Double = 5, necessary: Bool = true, file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "exists == true")
        let expectation = uiTest.expectation(for: existsPredicate, evaluatedWith: element)
        _ = XCTWaiter.wait(for: [expectation], timeout: timeout)
        expectation.fulfill()
        XCTAssertEqual(element.exists, true)
    }

    // MARK: - Common

    func findAll(_ type: XCUIElement.ElementType) -> XCUIElementQuery {
        app.descendants(matching: type)
    }

    var app: XCUIApplication {
        XCUIApplication()
    }
}
