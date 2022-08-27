import os

const readme_path = "./README.md"
const new_line = "\n\n"

const title = "# Excersim Go Track 📮$new_line"
const desc = "### This repo is _my learning thread_ of the [Go Programming Language](https://go.dev) thanks to this [`Excercim Track`](https://exercism.org/tracks/go)$new_line"
const sep = "---$new_line"
const table_layout = "| No. | Title | Code |\n| --- | ----- | ---- |\n"
const footer = '> Auto Generated By [this Vlang file](./gen-readme.v)'

fn main() {
	result := os.execute("ls -d */")
	if result.exit_code != 0 || result.output.len == 0 {
		println("ls failed")
		return
	}
	all_exercism := result.output.split("\n")

	mut readme_file := ""
	readme_file += title
	readme_file += desc
	readme_file += sep
	readme_file += "My [exercism](https://exercism.org/profiles/Ilingu) **submissions**:$new_line"
	readme_file += table_layout

	for i, exercism in all_exercism {
		if exercism.trim_space().len == 0 { continue }
		name := exercism.trim_right("/")
		readme_file += "| ${i+1} | $name | [$exercism](./$exercism) |\n"
	}

	readme_file += "\n" + footer

	os.write_file(readme_path, readme_file) or {
		println("failed to write readme file")
		return
	}
}

/* to build run `v -prod -os linux .` in administrator cmd */
