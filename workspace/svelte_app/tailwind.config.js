const production = !process.env.ROLLUP_WATCH; // 追記①


module.exports = {
  mode: 'jit',
  purge: {
    content: [
      './src/**/*.svelte',
      './src/**/*.html',
    ],
    enabled: production, // disable purge in dev
  },
  content: [],
  theme: {
    extend: {},
  },
  plugins: [],
}
