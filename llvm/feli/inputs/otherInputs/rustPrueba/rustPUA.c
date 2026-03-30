use std::env;

fn cond0(var0: i32) -> bool {
    var0 > 0
}

fn cond1(var0: i32) -> bool {
    is_even(var0)
}

fn is_even(var0: i32) -> bool {
    var0 % 2 == 0
}

fn a_computation(var0: i32) -> i32 {
    var0 * 2
}

fn cond(var0: i32) -> bool {
    var0 < 0
}

fn heavy_r_computation(var0: i32, var1: i32) -> i32 {
    var0 + var1
}

fn changed_r_computation(var0: i32, var1: i32) -> i32 {
    var0 - var1
}

fn log_message(_message: &str) {
    // println!("LOG: {}", message);
}

fn log_value(_value: i32) {
    // println!("LOG: {}", value);
}

fn main() {
    let args: Vec<String> = env::args().collect();
    let p: i32 = args.get(1).and_then(|s| s.parse().ok()).unwrap_or(0);
    let mut r: i32 = 10;
    let mut a: i32 = 0;

    if cond0(p) {
        log_message("Error0");
    } else {
        if cond1(p) {
            a = a_computation(p);
            if cond(a) {
                r = heavy_r_computation(p, a);
            } else {
                r = changed_r_computation(p, a);
            }
        } else {
            log_message("Error");
        }

        log_value(r);
    }

    std::process::exit(r);
}
