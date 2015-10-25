/* jshint node: true, esnext: true */

'use strict';

//require('./unit.js'); // really? well lets see how bad it is...

let Event = {
    beginDate: new Date(),
    endDate: new Date(),
    getBeginDate: function() {
    },
    getEndDate: function() {
    }
};

let LightOfDay = Object.create(Event);
LightOfDay.beginDate.setHours(7);
LightOfDay.beginDate.setMinutes(0);
LightOfDay.endDate.setHours(23);
LightOfDay.endDate.setMinutes(0);

let Pump1 = Object.create(Event);

console.log( LightOfDay.beginDate );