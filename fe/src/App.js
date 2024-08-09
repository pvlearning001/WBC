import React, { useEffect } from 'react';
import ParentPage from './ParentPage';
import { initStorage } from "./jscode/utilities";

export default function App() {
  function runInitApp(){
    initStorage();
  }

  useEffect(() => { runInitApp();}, []);
  
  return(
      <ParentPage />
  )
}
