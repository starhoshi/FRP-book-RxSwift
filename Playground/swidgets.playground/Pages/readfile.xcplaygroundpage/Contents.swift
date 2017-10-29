func readfile(file: String, block: (() -> String) -> Void) {
    // let file = Bundle.main....(file)
    // let string = file.read()
    // file.close()
    // return string
}

readfile(file: "hoge.txt") { line in
    print(line)
}

/// Transaction

func run(block: () -> Void) {
    print("start transaction")
    block()
    print("finish transaction")
}

run {
    print("running")
}
