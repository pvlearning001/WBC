import axios from 'axios';
import React, { Component } from 'react';

class TestGetItem01 extends Component {
    state = {
        message: ''
      };
    
    componentDidMount() {
        axios.get('/test01/api01')
            .then(result => this.setState({ message: result.data.itemName }));
    };

    render() {
        const mystyle01 = {
            color: "red",
        };

        return(
        <div>
            <hr />
            <h2>This is TestGetItem01</h2>
            <h3 style={mystyle01}>{ this.state.message }</h3>
        </div>
        )
  };
};
export default TestGetItem01;