import React, {Component} from 'react'
import {AppBar, IconButton, FontIcon} from 'material-ui';
import NavigationMoreVert from 'material-ui/svg-icons/navigation/more-vert';

export default class AppBarComponent extends Component {
  constructor(props) {
    super(props)
  }
  render() {
    return (
      <AppBar
        title="Title"
        iconElementLeft={<IconButton><NavigationMoreVert /></IconButton>}
        iconElementRight={<FontIcon className="fa fa-twitter"></FontIcon>}
      />
    )
  }
}