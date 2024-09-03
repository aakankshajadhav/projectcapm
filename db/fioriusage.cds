namespace app.fioriusage;

using {managed} from '@sap/cds/common';
entity Fiori_usage : managed {
    key client         : Integer        @(title: 'Client');
    key track_no       : UUID           @(title: 'Globally Unique Identifier');
        fiori_id       : String(50)     @(title: 'Fiori ID');
        tile           : String(100)    @(title: 'Tile');
        flp_user       : String(255)    @(title: 'UserName');
        fdate          : Date           @(title: 'Date');
        ftime          : Time           @(title: 'Time');
        catalog_id     : String(50)     @(title: 'Catlalog ID');
        catalog_name   : String(255)    @(title: 'Catlalog name');
        target         : String(200)    @(title: 'Target');
        semanticobject : String(40)     @(title: 'Semantic Object');
        action         : String(40)     @(title: 'Action');
        parameters     : String(200)    @(title: 'Parameters');
        page_id        : String(50)     @(title: 'Page ID');
        space_id       : String(50)     @(title: 'Space ID');
        page_title     : String(200)    @(title: 'Page Title');
        space_title    : String(200)    @(title: 'Space Title');
        time_visited   : Decimal(16, 0) @(title: 'Time Visited');
}
//to fetch data for last 90,180,360 days
view Fiori_usage_last90days as
    select from Fiori_usage {
        key client         as client,
            catalog_id     as CatlalogID,
            catalog_name   as Catlalogname,
            fiori_id       as FioriID,
            tile           as Title,
            flp_user       as UserName,
            fdate          as Date,
            ftime          as Time,
            target         as Target,
            semanticobject as SemanticObject,
            action         as Action,
            parameters     as Parameter,
            page_id        as PageID,
            space_id       as SpaceID,
            page_title     as PageTitle,
            space_title    as SpaceTitle,
            time_visited   as TimeVisited
    }
    where
        fdate >= ADD_DAYS(
            CURRENT_DATE, -90
        );

view Fiori_usage_last180days as
    select from Fiori_usage {
        key client         as client,
            catalog_id     as CatlalogID,
            catalog_name   as Catlalogname,
            fiori_id       as FioriID,
            tile           as Title,
            flp_user       as UserName,
            fdate          as Date,
            ftime          as Time,
            target         as Target,
            semanticobject as SemanticObject,
            action         as Action,
            parameters     as Parameter,
            page_id        as PageID,
            space_id       as SpaceID,
            page_title     as PageTitle,
            space_title    as SpaceTitle,
            time_visited   as TimeVisited
    }
    where
        fdate >= ADD_DAYS(
            CURRENT_DATE, -180
        );


view Fiori_usage_last360days as
    select from Fiori_usage {
        key client         as client,
            catalog_id     as CatlalogID,
            catalog_name   as Catlalogname,
            fiori_id       as FioriID,
            tile           as Title, 
            flp_user       as UserName,
            fdate          as Date,
            ftime          as Time,
            target         as Target,
            semanticobject as SemanticObject,
            action         as Action,
            parameters     as Parameter,
            page_id        as PageID,
            space_id       as SpaceID,
            page_title     as PageTitle,
            space_title    as SpaceTitle,
            time_visited   as TimeVisited
    }
    where
        fdate >= ADD_DAYS(
            CURRENT_DATE, -360
        );


//sum total time visited
view YC_Fiori_usage_time_visted as
    select from Fiori_usage {
       key client,
        catalog_id        as CatlalogID,
        catalog_name      as Catlalogname,
        semanticobject    as SemanticObject,
        action            as Action,
        sum(time_visited) as total_time_visited : Decimal(16, 0)
    }
    group by
        client,
        catalog_id,
        catalog_name,
        semanticobject,
        action
    order by
        total_time_visited desc;
     

//TOP 5 tile based on Timevisited for 90,180 and 360 days
view top_5_tiles_90 as
    select from Fiori_usage {
        tile,
        sum(time_visited) as total_time_visited : Decimal(16, 0)
    }
    where
        fdate >= ADD_DAYS(
            CURRENT_DATE, -90
        )
    group by
        tile
    order by
        total_time_visited desc
    limit 5;


view top_5_tiles_180 as
    select from Fiori_usage {
        tile,
        sum(time_visited) as total_time_visited : Decimal(16, 0)
    }
    where
        fdate >= ADD_DAYS(
            CURRENT_DATE, -180
        )
    group by
        tile
    order by
        total_time_visited desc
    limit 5;


view top_5_tiles_360 as
    select from Fiori_usage {
        tile,
        sum(time_visited) as total_time_visited : Decimal(16, 0)
    }
    where
        fdate >= ADD_DAYS(
            CURRENT_DATE, -360
        )
    group by
        tile
    order by
        total_time_visited desc
    limit 5;


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//least visited  fiori  app use
view least_Visited_fiori_app as
    select from Fiori_usage {
        tile,
        flp_user,
        sum(time_visited) as total_time_visited : Decimal(16, 0)
    }
    where
        fdate >= ADD_DAYS(
            CURRENT_DATE, -180
        )
    group by
            tile,
        flp_user
    order by
        total_time_visited asc
    limit 5;


view least_Visited_fiori_app_90days as
    select from Fiori_usage {
        tile,
        flp_user,
        sum(time_visited) as total_time_visited : Decimal(16, 0)
    }
    where
        fdate >= ADD_DAYS(
            CURRENT_DATE, -90
        )
    group by
        tile,
        flp_user
    order by
        total_time_visited asc
    limit 5;

view least_Visited_fiori_app_360days as
    select from Fiori_usage {
        tile,
        flp_user,
        sum(time_visited) as total_time_visited : Decimal(16,0)
    }
    where
        fdate >= ADD_DAYS(
            CURRENT_DATE, -360
        )
    group by
        tile,
        flp_user
    order by
        total_time_visited asc
    limit 5;

    



//top 5 tile  -180 days
    view fiori_top5_tiles as
     select from Fiori_usage {
        tile,
        client,
        semanticobject,
        action,
        fdate,
        COUNT( * ) as AppHitCount : Integer
    }
    where
        fdate >= ADD_DAYS(
            CURRENT_DATE, -360
        )
    group by
        tile,
        client,
        semanticobject,
        action,
        fdate
    order by
        AppHitCount asc
    limit 5;


    view fiori_top5_tiles as
     select from Fiori_usage {
        tile,
        client,
        semanticobject,
        action,
        fdate,
        COUNT( * ) as AppHitCount : Integer
    }
    where
        fdate >= ADD_DAYS(
            CURRENT_DATE, -360
        )
    group by
        tile,
        client,
        semanticobject,
        action,
        fdate
    order by
        AppHitCount asc
    limit 5;
