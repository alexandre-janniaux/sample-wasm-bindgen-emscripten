use wasm_bindgen::prelude::*;

#[wasm_bindgen]
extern "C" {
    fn alert(s: &str);
}


use std::os::raw::c_char;

#[no_mangle]
pub extern "C"
fn greet(name: *const c_char ) {
    unsafe {
        let name = std::ffi::CStr::from_ptr(name);
        alert(&format!("Hello, {}!", String::from_utf8_lossy(name.to_bytes())))
    }
}
