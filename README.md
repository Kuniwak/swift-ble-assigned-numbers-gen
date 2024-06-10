Bluetooth Low Energy Assigned Numbers Generator for Swift
---------------------------------------------------------

This is a simple script that generates a Swift file with all the Bluetooth Low Energy Assigned Numbers.
Generated script is available on [Kuniwak/swift-ble-assigned-numbers](https://github.com/Kuniwak/swift-ble-assigned-numbers).


Usage
-----

```console
$ ./Scripts/generate-assigned-numbers > path/to/generated.swift
```


How to Update
-------------

```console
$ pushd ./Resources/bluetooth-SIG-publis
$ git pull
$ popd
$ git add ./Resources/bluetooth-SIG-publis
$ git commit -m "Update"
$ git push
```


License
-------

[MIT License](./LICENSE)