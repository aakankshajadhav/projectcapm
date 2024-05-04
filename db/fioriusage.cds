namespace app.fioriusage;
entity Fiori_usage {
    key client         : Integer        @(title: 'Client');
    key track_no       : UUID           @(title: 'Globally Unique Identifier');
        fiori_id       : String(50)     @(title: 'FioriID');
        tile           : String(100)    @(title: 'Title');
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

// view YC_Fiori_usage as select from Fiori_usage as fusage
// {
//     fusage.client as Client,
//     fusage.catalog_id as CatlalogID,
//     fusage.catalog_name  as Catlalogname,
//     fusage.fiori_id as FioriID ,
//     fusage.tile as Title,
//      fusage.flp_user  as   UserName,
//      fusage.fdate as  Date,
//      fusage.ftime as Time,
//      fusage.target as Target,
//       fusage.semanticobject  as  SemanticObject,
//      fusage.action         as   Action,
//      fusage.parameters  as Parameter,
//      fusage.page_id   as   PageID,
//      fusage.space_id  as   SpaceID,
//      fusage.page_title   as      PageTitle,
//       fusage.space_title as   SpaceTitle,
//       fusage.time_visited  as TimeVisited
// };
