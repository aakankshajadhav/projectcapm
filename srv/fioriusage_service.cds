using app.fioriusage as my from '../db/fioriusage';

service fiori {
@odata.draft.enabled
  // entity fiori_usage as projection on fioriusage.Fiori_usage;
  entity Fiori_Analytics as projection on my.Fiori_usage;
  // entity Srv_Fiori_usage as projection on my.YC_Fiori_usage;
}
annotate my.Fiori_usage with @(UI: {
  CreateHidden       : false,
  UpdateHidden       : false,
  DeleteHidden       : false,
  HeaderInfo         : {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : 'Fiori OverView',
    TypeNamePlural: 'Fiori OverView',
    Description   : {Value: 'Fiori OverView'}

  },
  LineItem           : [
   
   
    {Value:track_no},
    {Value:client},
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
    Label : 'OverView Page details',
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
  ]


  },
});

// annotate fiori.Fiori_Analytics with @(UI:{
//   Chart #donut : {
//   $Type           : 'UI.ChartDefinitionType',
//   ChartType          : #Donut,
//   Description        : 'Donut Chart',
//   Measures           : [catalog_name],
//   MeasureAttributes  : [{
//     $Type: 'UI.ChartMeasureAttributeType',
//     Measure:catalog_name,
//     Role : #Axis1,
//      DataPoint : '@UI.DataPoint#catalog_name'
    
//   }],
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






    
















