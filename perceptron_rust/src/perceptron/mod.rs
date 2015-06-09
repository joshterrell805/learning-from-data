extern crate rblas;
use self::rblas::*;

pub fn asdf (i: usize) -> usize {
  let v = vec![1.0f32, 2.0, 3.0];
  let w = vec![2.0f32, 4.0, 6.0];
  let x: f32 = Dot::dot(&v, &w);
  println!("{:?}", &v);
  println!("{:?}", &w);
  println!("{:?}", &x);
  i
}
