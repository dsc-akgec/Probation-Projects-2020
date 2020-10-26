import React from 'react';
import RecentEvent from './RecentEvent';
import PreviousEvents from './PreviousEvents';

const Event = () => {
    return(
        <React.Fragment>
            <RecentEvent/>
            <PreviousEvents/>
        </React.Fragment>
    );
}

export default Event;