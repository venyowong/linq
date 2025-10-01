module linq

pub fn map_to_array[T, U, W](m map[T]U, convert fn (T, U) W) []W {
	mut result := []W{}
	for key in m.keys() {
		value := m[key]
		result << convert(key, value)
	}
	return result
}