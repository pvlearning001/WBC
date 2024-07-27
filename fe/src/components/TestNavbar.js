import React, { Component } from 'react';
import { Link } from 'react-router-dom';

class TestNavbar extends Component {
    render() {
        return(
          <>      
            <Link to="/"><button>Home</button></Link>
            <Link to="/page01"><button>Link Page 01</button></Link>
            <Link to="/page02"><button>Link Page 02</button></Link>
            <Link to="/page03"><button>Link Page 03</button></Link>
          </>
        )
      };
    };
  export default TestNavbar;