

class LinkedList<T: Equatable> {
    
    let data: T
    var next :LinkedList<T>?
    var first :LinkedList<T>?
    var last :LinkedList<T>?
    
    init(data: T) {
        self.data = data
    }
    
    
    func insert(data :T) {
        if first == nil {
            first = LinkedList<T>(data: data)
            last = first
            last?.next = nil
        } else {
            last?.next = LinkedList<T>(data: data)
            last = last?.next
        }
    }
    
    func remove(data: T) {
        guard first != nil, last != nil else{
            return
        }
        
        var temp = first
        while (temp != last?.next) {
            if temp?.next?.data == data {
                temp?.next = temp?.next?.next
                return
            }
            temp = temp?.next
        }
    }
    
    func printList() {
        print("Printing list")
        var temp = first
        while (temp != last?.next) {
            print("\(temp!.data)")
            temp = temp?.next
            }
        
        }
}


extension LinkedList: Equatable {
    public static func ==(lhs: LinkedList, rhs: LinkedList) -> Bool {
        return lhs.data == rhs.data
    }
}


var deepList = LinkedList<Int>(data: 10)

deepList.insert(data: 1)
deepList.insert(data: 2)
deepList.insert(data: 3)
deepList.insert(data: 4)

deepList.printList()


deepList.remove(data: 5)
deepList.printList()

deepList.remove(data: 3)
deepList.printList()



deepList.insert(data: 5)
deepList.printList()

















