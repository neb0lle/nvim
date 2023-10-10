local rundi = require('rundi')

rundi.setup({
  autocompile = {
    cpp = "clang++ -std=c++14 -Wshadow -Wall -o %:t:r % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./%:t:r",
  },
})