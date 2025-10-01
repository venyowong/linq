module linq

struct Data {
pub mut:
	key string
	value string
}

fn test_map() {
	mut m := map[string]string{}
	m["key1"] = "value1"
	m["key2"] = "value2"
	println(m)
	arr := map_to_array(m, fn (k string, v string) Data {
		return Data {
			key: k
			value: v
		}
	})
	println(arr)
	m = to_map(arr, fn (d Data) string {
		return d.key
	}, fn (d Data) string {
		return d.value
	})
	println(m)
}