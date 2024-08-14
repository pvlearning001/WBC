
import React from 'react';
import '../assets/css/page.css';

export default function AnnouncementAttachmentComponent(props) { 
    return (
    <button className="btn btn-primary" onClick={() => props.handleClick(props.id)}>
        props.text
    </button> 
    )
  }


