local rundi = require('rundi')

rundi.setup({
  autocompile = {
    python = "python3 '%'",
    cpp = "g++ -std=c++14 -Wshadow -Wall -o %:t:r % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./%:t:r",
    c = "gcc -Wshadow -Wall -o %:t:r % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./%:t:r",
  },
})