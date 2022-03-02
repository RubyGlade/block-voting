import React, { Fragment } from 'react'
// This is an ES6 module we're importing, it's a dependency
import ReactDom from 'react-dom'


// Now we're creating a component, and the rule is to capitalize function names, else there'll be an error.
// This is a stateless functional component. Always should return JSX object/s.

// Rules of JSX:
// Always return single component, maybe a div, section, Fragment, article
// use camelCase for HTML attributes
// use className instead of class
// close every element (even those which don't need a closing tag in normal HTML)
// formatting

function Greeting(){
  // You can include HTML codechunks in this as well
  return ( <div>
    <h4> I am Brad, and this is my first React component !!</h4>
  </div> ) ;
  // Since the 'return' has HTML tags, the output will be printed in the webpage
  // If it was a console.log(), it would have been in the console.
}

const Greeting2 = () => {
  return React.createElement('h1', {}, 'Hello World');
}

// In React, functions must return only one object. But, if we want to return multiple elements, we can bind them with a 
// React.Fragment, and then put all elements inside it

function Greeting3 () {
  return (
    <React.Fragment>
      <div>
        <h1>
          Hello World
        </h1>
        <ul>
          <li>
            <a href='#'> This is a random option </a>
          </li>
        </ul>
      </div>
      <div></div>
    </React.Fragment>
  )
}

// render() method renders components
ReactDom.render(<Greeting/>, document.getElementById('root'));
// ReactDom.render(<Greeting2/>, document.getElementById('root'));
ReactDom.render(<Greeting3/>, document.getElementById('root'));

// The catch in React is that we need to put closing tags for those elements which don't need closing tags in the index.js
// file, like the component above. For example, if we have an image as a component, we still need to close it as <img/>.

