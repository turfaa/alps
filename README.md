# [alps]

[![GoDoc](https://godoc.org/git.sr.ht/~migadu/alps?status.svg)](https://godoc.org/git.sr.ht/~migadu/alps)
[![builds.sr.ht status](https://builds.sr.ht/~migadu/alps/commits.svg)](https://builds.sr.ht/~migadu/alps/commits?)

A simple and extensible webmail.

## Notes from Turfa

This repository is a fork of the [Migadu's alps project in sourcehut](https://git.sr.ht/~migadu/alps).
The original version is kept in the [upstream branch](https://github.com/turfaa/alps/tree/upstream).

Here is the list of changes made in this repository:

1. **Docker image build**.

   The image is published as `ghcr.io/turfaa/alps`.

1. **Versioning**.

   Until the upstream publishes versioned releases,
   we will create v0.0.z version tags on every change.

1. **Populating names when replying to emails**.

   In upstream, when replying to emails, the `To` field
   will only be filled by the sender's email (e.g.: `github@turfa.id`).

   Now, the `To` field will be filled by the sender's name and email (e.g.: `"Turfa" <github@turfa.id>`).

   Update: this change has been [pushed to upstream](https://git.sr.ht/~migadu/alps/commit/2494da2bd98802a1e71dfe1712e59c577ef07d1f).

### Running the Docker Image

To run the published docker image:

    docker run -it -p 1323:1323 ghcr.io/turfaa/alps:latest migadu.com

The server will then be run with:
- Migadu's email servers.
- The `alps` theme.

The server will be accessible through http://localhost:1323/.

If you want to run with the `sourcehut` theme at port 8088:

    docker run -it -p 8088:1323 ghcr.io/turfaa/alps:latest -theme=sourcehut migadu.com

Advanced users should know how to do what they want ;)

## Usage

Assuming SRV DNS records are properly set up (see [RFC 6186]):

    go run ./cmd/alps example.org

To manually specify upstream servers:

    go run ./cmd/alps imaps://mail.example.org:993 smtps://mail.example.org:465

Add `-theme alps` to use the alps theme. See `docs/cli.md` for more
information.

When developing themes and plugins, the script `contrib/hotreload.sh` can be
used to automatically reload alps on file changes.

## Contributing

Send patches on the [mailing list], report bugs on the [issue tracker].

## License

MIT

[alps]: https://sr.ht/~migadu/alps
[RFC 6186]: https://tools.ietf.org/html/rfc6186
[Go plugin helpers]: https://godoc.org/git.sr.ht/~migadu/alps#GoPlugin
[mailing list]: https://lists.sr.ht/~migadu/alps-devel
[issue tracker]: https://todo.sr.ht/~migadu/alps
