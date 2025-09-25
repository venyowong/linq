module linq

import strings

pub fn except[T](arr1 []T, arr2 []T) []T {
    mut result := []T{}
    for x in arr1 {
        if x !in arr2 {
            result << x
        }
    }
    return result
}

pub fn first[T](arr []&T, predicate fn (item T) bool) ?&T {
	if arr.len == 0 {
		return none
	}
	for item in arr {
		if predicate(*item) {
			return unsafe {item}
		}
	}
	return none
}

pub fn intersect[T](arr1 []T, arr2 []T) []T {
    mut result := []T{}
    for x in arr1 {
        if x in arr2 {
            result << x
        }
    }
    return result
}

pub fn join(arr []string, separator string) string {
    mut sb := strings.new_builder(arr.len * 2)
    defer {
		unsafe { sb.free() }
	}
    for i, str in arr {
        sb.write_string(str)
		if i < arr.len - 1 {
			sb.write_string(separator)
		}
    }
    return sb.str()
}

pub fn map[T, U](arr []T, change fn(T) U) []U {
    mut result := []U{}
    for x in arr {
        result << change(x)
    }
    return result
}

/*
Heap sort
If compare return true, will get a sequence in ascending order
*/
pub fn order[T](mut arr []T, compare fn(T, T) bool) []T {
    for i := arr.len - 1; i >= 1; i -= 1 {
        for j := i / 2; j >= 0; j -= 1 {
            l := j * 2 + 1 // left
            r := (j + 1) * 2 // right
            mut g := j
            if l <= i && compare(arr[l], arr[g]) {
                g = l
            }
            if r <= i && compare(arr[r], arr[g]) {
                g = r
            }
            if g != j {
                value := arr[j]
                arr[j] = arr[g]
                arr[g] = value
            }
        }

        value := arr[0]
        arr[0] = arr[i]
        arr[i] = value
    }
    return arr
}

pub fn union[T](arr1 []T, arr2 []T) []T {
    mut result := arr1.clone()
    for x in arr2 {
        if x !in result {
            result << x
        }
    }
    return result
}