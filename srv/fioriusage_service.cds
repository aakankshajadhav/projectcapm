using app.fioriusage as my from '../db/fioriusage';

service fiori {
  @odata.draft.enabled
  entity Fiori_Analytics          as projection on my.Fiori_usage;
  //cdsview entity
  entity Last_90days              as projection on my.Fiori_usage_last90days;
  entity Last_180days             as projection on my.Fiori_usage_last180days;
  entity Last_360days             as projection on my.Fiori_usage_last360days;
  //entity Total_time_Visited       as projection on my.YC_Fiori_usage_time_visted;
  
  //entity Top5_tile        as projection on my.YC_Fiori_usage_top_5_tiles;
  entity Top5_Tiles_90days        as projection on my.top_5_tiles_90;
  entity Top5_Tiles_180days       as projection on my.top_5_tiles_180;
  entity Top5_Tiles_360days       as projection on my.top_5_tiles_360;
  entity least_Visited_fiori_apps as projection on my.least_Visited_fiori_app;  
}

 @odata.draft.enabled
annotate my.Fiori_usage with @(UI: {
  CreateHidden       : false,
  UpdateHidden       : false,
  DeleteHidden       : false,
  HeaderInfo         : {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : 'Fiori Statistics',
    TypeNamePlural: 'Fiori Statistics',
    Description   : {Value: 'Fiori Statistics'}
  },
  LineItem           : [
    {Value: track_no},
    {Value: client},
    {Value: fiori_id},
    {Value: tile},
    {Value: flp_user},
    {Value: fdate},
    {Value: ftime},
    {Value: catalog_name},
    {Value: catalog_id},
    {Value: target},
    {Value: semanticobject},
    {Value: action},
    {Value: parameters},
    {Value: page_id},
    {Value: space_id},
    {Value: page_title},
    {Value: space_title},
    {Value: time_visited}
  ],


  Facets             : [{
    $Type : 'UI.CollectionFacet',
    Label : 'Fiori Statistics Page details',
    Facets: [{
      $Type : 'UI.ReferenceFacet',
      Target: '@UI.FieldGroup#Details',
    }],
  }

  ],
  FieldGroup #Details: {Data: [
    {Value: catalog_name},
    {Value: catalog_id},
    {Value: fiori_id},
    {Value: tile},
    {Value: flp_user},
    {Value: fdate},
    {Value: ftime},
    {Value: catalog_name},
    {Value: catalog_id},
    {Value: target},
    {Value: semanticobject},
    {Value: action},
    {Value: parameters},
    {Value: page_id},
    {Value: space_id},
    {Value: page_title},
    {Value: space_title},
    {Value: time_visited}
  ]},
});


// annotate fiori.Fiori_Analytics with
//  @(UI:{
//  Chart #donut       :{
//   $Type           : 'UI.ChartDefinitionType',
//   ChartType          : #Donut,
//   Description        : 'Donut Chart',
//   Dimensions           :  ['tile'],
//   Measures           : ['flp_user'],
//   DimensionAttributes:[{dimension:'tile',role:#Category}],
//   MeasureAttributes  : [{measure:'flp_user', roles : #Axis_1 }]
//      }]
//   Dimensions         : [catalog_id],
//   DimensionAttributes: [{
//     $Type    : 'UI.ChartDimensionAttributeType',
//     Dimension: catalog_id,
//     Role     : #Category
//   }]
//   },
//    PresentationVariant #donutPreVar        : {
//         $Type             : 'UI.PresentationVariantType',
//         Visualizations    : ['@UI.Chart#donut'],
//         MaxItems          : 2,
//         IncludeGrandTotal : true,
//         SortOrder         : [{
//             $Type      : 'Common.SortOrderType',
//             Descending : true,
//             Property   : catalog_name
//         }]
//     },

//     DataPoint #catalog_name:{

//      $Type                  : 'UI.DataPointType',
//         Value                  :catalog_name,
//         Title                  : 'Hit Count by Catlog Name',
//         CriticalityCalculation : {
//             $Type                   : 'UI.CriticalityCalculationType',
//             ImprovementDirection    : #Maximize,
//             DeviationRangeHighValue : 1000000,
//             DeviationRangeLowValue  : 3000000
//         },
//         TrendCalculation       : {
//             $Type                : 'UI.TrendCalculationType',
//             ReferenceValue       : 1000,
//             UpDifference         : 10,
//             StrongUpDifference   : 100,
//             DownDifference       : -10,
//             StrongDownDifference : -100
//         },
//     },
//     Identification : [{
//         $Type : 'UI.DataField',
//         Value : catalog_name
//     }]
// });


// annotate fiori.Fiori_Analytics with UI.Chart;
