import React, { Component } from 'react';

export class Home extends Component {
  static displayName = Home.name;

  constructor(props) {
    super(props);
    this.state = { username: '', password: '' };
  }
  
  foo = "bar"


  handleChange = (event) => {
    this.setState({[event.target.name]: event.target.value});
    this.foo = event.target.value;
    this.state.new = event.target.name;
  }

  handleSubmit = (event) => {
    event.preventDefault();
    console.log({"user": this.state.username, "pw": this.state.password});
    console.log(`FOO IS ${this.foo}`)
    console.log(`STATE IS ${this.state.new}`)

    // alert("You are submitting " + this.state.username);
    this.checkCookie()
  }


  mySubmitHandler = (event) => {
    event.preventDefault();
    alert("You are submitting " + this.state.username);
  }
  myChangeHandler = (event) => {
    this.setState({username: event.target.value});
  }


  setCookie = (cname, cvalue, exdays) => {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
  }

  getCookie = (cname) => {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
      var c = ca[i];
      while (c.charAt(0) == ' ') {
        c = c.substring(1);
      }
      if (c.indexOf(name) == 0) {
        return c.substring(name.length, c.length);
      }
    }
    return "";
  }

  checkCookie = () => {
    var username = this.getCookie("username");
    if (username != "") {
      alert("Welcome again " + username);
    } else {
      username = prompt("Please enter your name:", "");
      if (username != "" && username != null) {
        this.setCookie("username", username, 365);
      }
    }
  }

  render () {
    return (
      
      <div>
        <script>

        </script>

        <label>
          Username
          <input name="username" onChange={this.handleChange} />
        </label>
        <br />
        <label>
          Password
          <input name="password" onChange={this.handleChange} />
        </label>
        <br />
        <button onClick={this.handleSubmit}>Submit</button>


        <form onSubmit={this.mySubmitHandler}>
          <h1>Hello {this.state.username}</h1>
          <p>Enter your name, and submit:</p>
          <input
            type='text'
            onChange={this.myChangeHandler}
          />
          <input
            type='submit'
          />
        </form>
        
        <h1>Hello world!</h1>
        <ul>
          <li><a href='https://get.asp.net/'>ASP.NET Core</a> and <a href='https://msdn.microsoft.com/en-us/library/67ef8sbd.aspx'>C#</a> for cross-platform server-side code</li>
          <li><a href='https://facebook.github.io/react/'>React</a> for client-side code</li>
          <li><a href='http://getbootstrap.com/'>Bootstrap</a> for layout and styling</li>
        </ul>
        <p>To help you get started, we have also set up:</p>
        <ul>
          <li><strong>Client-side navigation</strong>. For example, click <em>Counter</em> then <em>Back</em> to return here.</li>
          <li><strong>Development server integration</strong>. In development mode, the development server from <code>create-react-app</code> runs in the background automatically, so your client-side resources are dynamically built on demand and the page refreshes when you modify any file.</li>
          <li><strong>Efficient production builds</strong>. In production mode, development-time features are disabled, and your <code>dotnet publish</code> configuration produces minified, efficiently bundled JavaScript files.</li>
        </ul>
        <p>The <code>ClientApp</code> subdirectory is a standard React application based on the <code>create-react-app</code> template. If you open a command prompt in that directory, you can run <code>npm</code> commands such as <code>npm test</code> or <code>npm install</code>.</p>
      </div>
    );
  }
}
