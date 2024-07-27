import axios from 'axios';
import React, { Component } from 'react';

class TestGetItemList01 extends Component {
    state = {
      news: []
    };
  
    componentDidMount() {
      axios.get('/test01/api02')
           .then(result => this.setState({ news: result.data }));
      
    };
  
    render() {
      return(
        <div>
            <hr />
            <h2>This is TestGetItemList01</h2>
            <ul>
              {this.state.news.map(item => (
                <li key={item.id}>
                  <h2>{item.itemName}</h2>
                </li>
              ))}
            </ul>
        </div>
      )
    };
  };
  
  export default TestGetItemList01;