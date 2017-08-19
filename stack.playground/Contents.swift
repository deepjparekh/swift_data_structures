
enum StackError: Error {
    case StackUnderFlowError
    case StackOverFlowError
}

struct Stack<T> {
    private var contents: [T]
    var capacity: Int
    
    init(withCapacity capacity: Int = 5){
        contents = [T]()
        self.capacity = capacity
    }
    
    mutating func push(data: T) throws {
        if contents.count == capacity {
            throw StackError.StackOverFlowError
        }
        contents.append(data)
    }
    
    mutating func pop() throws -> T {
        if contents.isEmpty {
            throw StackError.StackUnderFlowError
        }
        return contents.removeLast()
    }
    
    func print() {
        for element in contents {
            debugPrint(element)
        }
    }
}

// Usage 
var myStack = Stack<Int>()

do {
    try myStack.push(data: 1)
    try myStack.push(data: 2)
    try myStack.push(data: 3)
} catch StackError.StackOverFlowError {
    print("Stack Over Flow Error")
} catch {
    fatalError()
}

myStack.print()

do {
    try print(myStack.pop())
    try print(myStack.pop())
    try print(myStack.pop())
    try print(myStack.pop())
} catch StackError.StackUnderFlowError {
    print("Stack Under Flow Error")
} catch {
    fatalError()
}


myStack.print()