class foo {
  file {
    "/tmp/hello":
      content => "Hello world\n";
  }
}

class bar {
  include foo

  File <| title == "/tmp/hello" |> {
    content => "override!\n"
  }
}

include bar
