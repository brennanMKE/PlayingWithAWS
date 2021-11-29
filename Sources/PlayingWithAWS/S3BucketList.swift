import Foundation
import AWSS3

/// A class containing all the code that interacts with the AWS SDK for Swift.
public class S3BucketList {
    let s3: S3Client
    //let configuration: S3Client.S3ClientConfiguration?

    public init() throws {
        //self.configuration = nil
        self.s3 = try S3Client()
    }

    /// Initialize and return a new ``S3BucketList`` object, which is used to drive the AWS calls
    /// used for the example.
    ///
    /// - Parameters:
    ///     - config: An `S3ClientConfiguration` configuring the S3 client; optional.
    ///
    /// - Returns: A new ``S3BucketList`` object, ready to run the demo code.
    public init(config: S3Client.S3ClientConfiguration) {
        //self.configuration = config
        self.s3 = S3Client(config: config)
    }

    /// Return an array listing all the buckets the user has access to given the current configuration.
    ///
    /// - Returns: An array of strings, each giving the name of one bucket
    public func buckets() throws -> [String] {
        var bucketList: [String] = []
        var listBucketsInput: ListBucketsInput

        listBucketsInput = ListBucketsInput()
        s3.listBuckets(input: listBucketsInput) { (result) in
            switch(result) {
            case .success(let output):
                for bucket in output.buckets! {
                    bucketList.append(bucket.name ?? "<<unknown name>>")
                }
                break
            case .failure(let error):
                print("ERROR: ", dump(error, name: "Error fetching bucket list"))
            }
        }
        return bucketList
    }
}

