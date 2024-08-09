import React, { useEffect } from 'react';
import ParentPage from './ParentPage';
import { initStorage } from "./jscode/utilities";

export default function App() {
  function runInitStorage(){
    initStorage();
  }

  useEffect(() => { runInitStorage();}, []);
  
  return(
      <ParentPage />
  )
}
