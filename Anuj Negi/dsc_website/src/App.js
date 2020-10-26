import React from "react";
import "./App.css";
import { BrowserRouter } from "react-router-dom";

import Layout from "./components/Layout/Layout";

class App extends React.Component {
  state = {
    loading: true,
  };

  componentDidMount() {
    const el = document.querySelector(".loader-container");
    if (el) {
      el.remove();
      this.setState({ loading: false });
    }
  }

  render() {
    if (this.state.loading) {
      return null;
    }
    return (
      <BrowserRouter>
        <Layout />
      </BrowserRouter>
    );
  }
}

export default App;
