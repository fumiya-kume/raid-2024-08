import Foundation

extension SIMD4 {
    
    var xyz: SIMD3<Scalar> {
        return self[SIMD3(0, 1, 2)]
    }
    
}
