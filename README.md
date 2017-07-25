# Barachy

Barachy is a backend Static File Loader, Handler and Backuper, written in Crystal, For **MASSIVE** Idea

:smile: : Hi Barachy, I need your static file

:shipit: : Ok,, loading first file ,,,, ummm, i think it's has been down, Change to second file. . . .,, Loaded

:smile: : WHoaaaaa, thanks Barachy


## Installation

to use barachy, make sure you have Crystal installed in your machine, [How to Install it ?](http://45.76.185.142/read/install-crystal-language-on-ubuntu)

```
git clone https://github.com/codenoid/barachy
cd barachy
shards install
crystal build src/barachy.cr
```

## Usage

1. You must have db file (text plain) for barachy app, the db looks like

```
http://localhost/tentor.js,http://localhost/jquery.js 500 maxspeed.js text/javascript
http://localhost/cmn/bootstrap.css,http://localhost/bootstrap.css 500 style.css text/css
```

* `http://localhost/tentor.js,http://localhost/jquery.js` is list of your static file who will be loaded for /maxspeed.js url
* `500` is your timeout for loading static file, ex, if first file use more than 500ms, then next to second file.
* `maxspeed.js` is your Barachy url
* `text/javascript` is your content type

2. Run the Barachy Server
```
$ ./barachy --path static.txt --port 3000
```

## Development

- [ ] Logo
- [ ] Detect file format / mime
- [ ] Contributors
- [ ] non text plain DB

## Contributing

1. Fork it ( https://github.com/codenoid/barachy/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [codenoid](https://github.com/codenoid) Rubi Jihantoro - creator, maintainer
- [bararchy](https://github.com/bararchy) Who inspiring the App Name
