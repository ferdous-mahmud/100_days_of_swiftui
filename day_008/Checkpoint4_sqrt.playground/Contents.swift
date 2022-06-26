import Foundation

enum sqrtError: Error {
    case out_of_bound, no_root
}

func sqrtt(_ num: Int) throws -> Int {
    if 1 > num || num > 10_000 {
        throw sqrtError.out_of_bound
    }
    
    for i in 2...100 {
        if i * i == num {
            return i
        }
    }
    
    throw sqrtError.no_root
}


do {
    let s = try sqrtt(25)
    print(s)
} catch {
    print(error)
}


print(sqrt(25))
