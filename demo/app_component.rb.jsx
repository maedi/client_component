class AppComponent < ReactComponent {

  def server()
    @title = "Server-side value"
  end

  constructor(props) {
    super(props);

    this.state = {}
    this.state.results = [@title]
  }

  componentDidMount() {
    this.setState({results: ["Client-side value"] + this.state.results});
  }

  render() {
    return (
      <div className="container">
        {this.state.results}
      </div>
    )
  }

  export default hot(module)(App);

}
