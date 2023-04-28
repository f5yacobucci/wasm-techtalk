wit_bindgen::generate!("math");

struct MathGuest;

impl Math for MathGuest {
    fn add(lhs: i32, rhs: i32) -> i32 {
        lhs + rhs
    }
    fn sub(lhs: i32, rhs: i32) -> i32 {
        lhs - rhs
    }
    fn square(root: i32) -> i32 {
        root * root
    }
}

export_math!(MathGuest);
