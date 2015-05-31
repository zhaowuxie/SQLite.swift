import XCTest
import SQLiteCipher

class CipherTests: XCTestCase {

    let db = Database()

    override func setUp() {
        db.key("hello")
        db.execute("CREATE table foo (bar); INSERT INTO foo (bar) VALUES (1)")

        super.setUp()
    }

    func test_key() {
        XCTAssert(db.scalar("SELECT count(*) FROM foo") as! Int64 == 1)
    }

    func test_rekey() {
        db.rekey("world")
        XCTAssert(db.scalar("SELECT count(*) FROM foo") as! Int64 == 1)
    }

}