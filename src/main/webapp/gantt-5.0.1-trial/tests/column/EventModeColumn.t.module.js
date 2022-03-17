import { EventModeColumn } from '../../build/gantt.module.js?457330';

StartTest((t) => {
    let gantt;

    t.beforeEach((t) => {
        gantt && gantt.destroy();
    });

    t.it('Should be possible to edit event mode', (t) => {
        gantt = t.getGantt({
            appendTo : document.body,
            columns  : [
                { type : EventModeColumn.type, width : 80 }
            ]
        });

        t.chain(
            { waitForEvent : [gantt.project, 'load'] },
            { waitForRowsVisible : gantt },

            { click : '[data-index=2] [data-column=manuallyScheduled] .b-checkbox' },

            (next) => {
                t.is(gantt.taskStore.getAt(2).manuallyScheduled, true, 'Event mode changed');
                next();
            },

            { click : '[data-index=2] [data-column=manuallyScheduled] .b-checkbox' },

            () => {
                t.is(gantt.taskStore.getAt(2).manuallyScheduled, false, 'Event mode changed back');
            }
        );
    });
});