import Spectre

public let testFailure: ((ContextType) -> Void) = {
  $0.it("throws an error") {

    var didFail = false

    do {
      throw failure("it's broken")
    } catch {
      didFail = true
    }

    if !didFail {
      // We cannot trust fail inside fails tests.
      fatalError("Test failed")
    }
  }
}
