mod perceptron;
#[link(name="gsl", kind="dylib")]
#[link(name="gslcblas", kind="dylib")]

extern {
  fn gsl_sf_bessel_J0(a: f64) -> f64;
}

fn main() {
  let x = 5.0;
  let y = unsafe {
    gsl_sf_bessel_J0(x)
  };
  println!("x: {}, y: {}", &x, &y);
}
