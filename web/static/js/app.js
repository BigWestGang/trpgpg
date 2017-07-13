import "phoenix_html"
import socket from "./socket"
import React, {Component} from "react"
import ReactDOM from "react-dom"
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import AppBarComponent from './AppBarComponent';
import injectTapEventPlugin from 'react-tap-event-plugin';

injectTapEventPlugin();

class App extends Component {
  constructor(props) {
    super(props)
  }
  render() {
    return (
      <MuiThemeProvider>
        <AppBarComponent />
      </MuiThemeProvider>
    )
  }
}

ReactDOM.render(
  <App />,
  document.getElementById('main')
)