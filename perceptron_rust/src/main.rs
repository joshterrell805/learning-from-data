#![feature(libc)]

extern crate libc;

use libc::{c_double, c_float, c_int, c_void, size_t};

#[link(name="openblas", kind="dylib")] 
extern {
  fn cblas_sdot(n : c_int, x: *const c_float, inc_x: c_int, y: *const c_float,
      inc_y: c_int) -> c_float;
}

fn main() {
  let x = vec![1.0f32, -2.0, 3.0, 4.0];
  let y = vec![1.0f32, 1.0, 1.0, 1.0];

  let d: f32 = unsafe {
    cblas_sdot(4, x[..].as_ptr(), 1, y[..].as_ptr(), 1)
  };
  println!("{:?}", &d);
}
