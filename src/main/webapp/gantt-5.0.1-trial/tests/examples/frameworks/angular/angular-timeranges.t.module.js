/**
 * Angular Timeranges demo test
 */
StartTest(t => {
    t.it('Rendering', t => {
        t.chain(
            { waitForSelector : '.b-gantt' },
            { waitForSelector : '.b-gantt-task' },
            { waitForSelector : '.b-splitter' },
            { waitForSelector : '.grid-timeranges' },
            { waitForSelector : '.b-button:contains(Add)' },
            { waitForSelector : '.b-checkbox:contains(Show Gantt header elements)' }
        );
    });

    t.it('Context Menu', t => {
        t.chain(
            { contextmenu : '.b-sch-header-timeaxis-cell:textEquals(Sun 06 Jan 2019)' },
            { waitForSelector : '.b-menu-text:textEquals(Show current timeline)' },
            { waitForSelector : '.b-menu-text:textEquals(Filter tasks)' },
            { waitForSelector : '.b-menu-text:textEquals(Zoom)' },
            { waitForSelector : '.b-menu-text:textEquals(Date range)' }
        );
    });

    t.it('Task Editor', t => {
        t.chain(
            { dblclick : '[data-task-id="11"]' },
            { waitForSelector : '.b-gantt-taskeditor' },
            { click : '[name="name"]' },
            { type : ' and MySQL[ENTER]' },
            { waitForSelector : '.b-grid-cell :textEquals(Install Apache and MySQL)' }
        );
    });

    t.it('Tooltips', t => {
        t.chain(
            { moveMouseTo : '[data-task-id="14"]' },
            { waitForSelector : '.b-gantt-task-title:textEquals(Configure ports)' },
            { moveMouseTo : '.b-checkbox:contains(Show Gantt header elements)' },
            { waitForSelector : '.b-tooltip-content:contains(Toggles the rendering)' }
        );
    });

    t.it('Interaction', t => {
        t.chain(
            { waitForSelector : '.b-grid-header label:textEquals(Critical milestone)', desc : 'Should have header elements' },
            { click : '.b-checkbox:contains(Show Gantt header elements)' },
            { waitForSelectorNotFound : '.b-grid-header label:textEquals(Critical milestone)', desc : 'Shouldn\'t have header elements' },
            { click : '.b-checkbox:contains(Show Gantt header elements)' },
            { click : '.b-button:contains(Add)' },
            { waitForSelector : '.b-grid-header label:textEquals(New range)' },
            { dblclick : '.b-grid-cell:textEquals(New range)' },
            { type : 'Holiday[ENTER]' },
            { waitForSelector : '.b-grid-header label:textEquals(Holiday)' }
        );
    });
});
