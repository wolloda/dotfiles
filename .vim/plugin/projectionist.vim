let g:projectionist_heuristics = {
\ '*': {
\   '*.cpp': {
\     'alternate': [
\       '{}.hpp',
\       '{}.h',
\     ],
\     'type': 'source'
\   },
\   '*.c': {
\     'alternate': '{}.h',
\     'type': 'source'
\   },
\   '*.h': {
\     'alternate': [
\       '{}.c',
\       '{}.cpp',
\     ],
\     'type': 'header'
\   },
\   '*.hpp': {
\     'alternate': [
\       '{}.cpp',
\       '{}.c',
\     ],
\     'type': 'header'
\   },
\ }
\}
