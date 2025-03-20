local config = {
	cmd = { "/home/arador/.local/share/nvim/mason/bin/jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),

	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "JavaSE-21",
						path = "/usr/lib/jvm/java-21-openjdk/",
					},
				},
			},
		},
	},
}
require("jdtls").start_or_attach(config)
