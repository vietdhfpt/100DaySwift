import UIKit

DispatchQueue.main.async {
    print("operation 1")
    DispatchQueue.main.async {
        print("operation 1.1")
    }
}

DispatchQueue.main.async {
    print("operation 2")
}


func run(queue: DispatchQueue, times: Int) {
    (0..<times).forEach { i in
        queue.async {
            print("\(i) operation 1")
            queue.async {
                print("\(i) operation 1.1")
            }
        }

        queue.async {
            print("\(i) operation 2")
        }
    }
}
run(queue: .main, times: 3)

let queue = DispatchQueue(label: "com.run", attributes: .concurrent)
run(queue: queue, times: 3)


let myQueue = DispatchQueue(label: "com.gcd.myQueue", attributes: .concurrent)
let semaphore = DispatchSemaphore(value: 1)
for i in (0...14) {
  myQueue.async {
     let songNumber = i + 1
     semaphore.wait()
     print("Downloading song", songNumber)
     sleep(2) // Download take ~2 sec each
     print("Downloaded song", songNumber)
     semaphore.signal()
  }
}


