//: [Previous](@previous)

import Foundation
import AWSS3
import PlayingWithAWS

print("Storage")

do {
    let bucketList = try S3BucketList()
    let buckets = try bucketList.buckets()
    for bucket in buckets {
        print("Bucket: \(bucket)")
    }
}
catch {
    print("Error: \(error)")
}

//: [Next](@next)
