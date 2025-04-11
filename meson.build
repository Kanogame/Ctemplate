project('template', 'c', version: '0.1', default_options: ['warning_level=3'])

c = run_command('tools/get-files.py', check: true)
sources = c.stdout().strip().split('\n')

cc = meson.get_compiler('c')
m_dep = cc.find_library('m', required: false)

klib_dep = subproject('klib').get_variable('klib_dep')

executable('template', sources, dependencies: [m_dep, klib_dep])