# Nit:
<A: true a 0.123 1234 asdf false>

# Json:
{"__kind": "obj", "__id": 0, "__class": "A", "b": true, "c": {"__kind": "char", "__val": "a"}, "f": 0.123, "i": 1234, "s": "asdf", "n": null, "array": {"__kind": "obj", "__id": 1, "__class": "Array", "__length": 3, "__items": [88, "hello", null]}, "iii": 6789, "sss": "redef"}

# Nit:
<B: <A: false b 123.123 2345 hjkl false> 1111 qwer>

# Json:
{"__kind": "obj", "__id": 0, "__class": "B", "b": false, "c": {"__kind": "char", "__val": "b"}, "f": 123.123, "i": 2345, "s": "hjkl", "n": null, "array": {"__kind": "obj", "__id": 1, "__class": "Array", "__length": 3, "__items": [88, "hello", null]}, "iii": 6789, "sss": "redef", "ii": 1111, "ss": "qwer"}

# Nit:
<C: <A: true a 0.123 1234 asdf false> <B: <A: false b 123.123 2345 hjkl false> 1111 qwer>>

# Json:
{"__kind": "obj", "__id": 0, "__class": "C", "a": {"__kind": "obj", "__id": 1, "__class": "A", "b": true, "c": {"__kind": "char", "__val": "a"}, "f": 0.123, "i": 1234, "s": "asdf", "n": null, "array": {"__kind": "obj", "__id": 2, "__class": "Array", "__length": 3, "__items": [88, "hello", null]}, "iii": 6789, "sss": "redef"}, "b": {"__kind": "obj", "__id": 3, "__class": "B", "b": false, "c": {"__kind": "char", "__val": "b"}, "f": 123.123, "i": 2345, "s": "hjkl", "n": null, "array": {"__kind": "ref", "__id": 2}, "iii": 6789, "sss": "redef", "ii": 1111, "ss": "qwer"}, "aa": {"__kind": "ref", "__id": 1}}

# Nit:
<D: <B: <A: false b 123.123 2345 new line ->
<- false> 1111 	f"

# Json:
{"__kind": "obj", "__id": 0, "__class": "D", "b": false, "c": {"__kind": "char", "__val": "b"}, "f": 123.123, "i": 2345, "s": "new line ->\n<-", "n": null, "array": {"__kind": "obj", "__id": 1, "__class": "Array", "__length": 3, "__items": [88, "hello", null]}, "iii": 6789, "sss": "redef", "ii": 1111, "ss": "\tf\"\r\\\/", "d": {"__kind": "ref", "__id": 0}}
