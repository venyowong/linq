module main

import linq

fn test_array() {
	mut arr := [1, 6, 3, 5]
	println(linq.order[int](mut arr, fn (x int, y int) bool { return x > y} ))
}
