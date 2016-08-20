public final class Uppercased: Tag {
    public let name = "uppercased"

    public func run(
        stem: Stem,
        context: Context,
        tagTemplate: TagTemplate,
        arguments: [Argument]) throws -> Node? {
        guard arguments.count == 1 else { throw "\(self) only accepts single arguments" }
        switch arguments[0] {
        case let .constant(value: value):
            return .string(value.uppercased())
        case let .variable(path: _, value: value):
            if let string = value?.string?.uppercased() {
                return .string(string)
            }
            return nil
        }
    }
}