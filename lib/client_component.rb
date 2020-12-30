class ClientComponent

  ##
  # Each component defines server-side code.
  #
  # @language [Javascript]
  ##
  def server
    # Implementation is optional.
  end

  ##
  # Each component defines client-side code.
  #
  # @language [Javascript]
  ##
  def client
    raise NotImplementedError
  end

  ##
  # Each component renders client-side code.
  ##
  def render_in
    # TODO.
  end

  ##
  # Require a client component.
  ##
  def self.require(path, namespace = self)

    # Split client-side and server-side code.
    server_code = %<>
    client_code = ''
    client_line = false

    File.foreach(path) do |line|

      # Enter client code.
      if line.strip == "def client()"
        client_line = true
        next
      end
      # Exit client code.
      if line.strip == "end" && client_line == true
        client_line = false
        next
      end

      # Scrape client code.
      if client_line
        client_code << line
      # Load server code.
      else
        server_code << line
      end

    end

    p server_code

    # Load server code.
    eval(server_code)

    # TODO: Compile client code.

  end

end
