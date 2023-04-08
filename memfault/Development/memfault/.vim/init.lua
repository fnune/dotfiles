local dap_python = require('dap-python')

dap_python.setup('~/.mambaforge/envs/memfault/bin/python')
dap_python.test_runner = 'pytest'
