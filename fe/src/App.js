import axios from 'axios';
import React, { Component } from 'react';
import './App.css';

class App extends Component {
  state = {
    message: '',
    news: []
  };

  componentDidMount() {
    axios.get('/test01/api01')
         .then(result => this.setState({ message: result.data.itemName }));

    axios.get('/test01/api02')
         .then(result => this.setState({ news: result.data }));
    
  };

  render() {
    return(
      <div className="App">
        <header className="App-header">          
          
          <h1>{ this.state.message }</h1>
          <ul>
            {this.state.news.map(item => (
              <li key={item.id}>
                <h2>{item.itemName}</h2>
              </li>
            ))}
          </ul>
        </header>
      </div>
    )
  };
};

export default App;
