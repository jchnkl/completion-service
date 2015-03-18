## Word completion as a service

The service is currently implemented as a primitive rest api.
Example query: `http://example.com:1880/complete/master%20of%20the%20univ`

### Required packages

These packages are not on hackage, but are necessary for building. Install them
in a local sandbox with `cabal sandbox add-source /path/to/requisite`.

* [rest-service](https://github.com/jotrk/rest-service)
* [completion-engine](https://github.com/jotrk/completion-engine)
