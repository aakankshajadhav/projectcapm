using app.fioriusage as sv from '../srv/fioriusage_service';
// @OData.publish: true
annotate sv.Fiori_usage with @(UI: {Chart: {
    $Type              : 'UI.ChartDefinitionType',
    ChartType          : #Donut,
    Title              : 'Tiles usage view',
    Dimensions         : ['tile'],
    Measures           : [fdate],
    DimensionAttributes: [{
        Dimension: 'tile',
        Role     : #Category
    }],
    MeasureAttributes  : [{
        Measure: 'fdate',
        Role   : #Axis1,
    }]
}, 
 PresentationVariant #donutPreVar        : {
        $Type             : 'UI.PresentationVariantType',
        Visualizations    : ['@UI.Chart'],
        MaxItems          : 2,
        IncludeGrandTotal : true,
        SortOrder         : [{
            $Type      : 'Common.SortOrderType',
            Descending : true,
            Property   : fdate
        }]
 }
});



// annotate sv.Fiori_usage with @(UI: {
//   CreateHidden       : false,
//   UpdateHidden       : false,
//   DeleteHidden       : false,
//   HeaderInfo         : {
//     $Type         : 'UI.HeaderInfoType',
//     TypeName      : 'Fiori Statistics',
//     TypeNamePlural: 'Fiori Statistics',
//     Description   : {Value: 'Fiori Statistics'}
//   },
//   LineItem           : [
//     {Value: track_no},
//     {Value: client},
//     {Value: fiori_id},
//     {Value: tile},
//     {Value: flp_user},
//     {Value: fdate},
//     {Value: ftime},
//     {Value: catalog_name},
//     {Value: catalog_id},
//     {Value: target},
//     {Value: semanticobject},
//     {Value: action},
//     {Value: parameters},
//     {Value: page_id},
//     {Value: space_id},
//     {Value: page_title},
//     {Value: space_title},
//     {Value: time_visited}
//   ],


//   Facets             : [{
//     $Type : 'UI.CollectionFacet',
//     Label : 'Fiori Statistics Page details',
//     Facets: [{
//       $Type : 'UI.ReferenceFacet',
//       Target: '@UI.FieldGroup#Details',
//     }],
//   }

//   ],
//   FieldGroup #Details: {Data: [
//     {Value: catalog_name},
//     {Value: catalog_id},
//     {Value: fiori_id},
//     {Value: tile},
//     {Value: flp_user},
//     {Value: fdate},
//     {Value: ftime},
//     {Value: catalog_name},
//     {Value: catalog_id},
//     {Value: target},
//     {Value: semanticobject},
//     {Value: action},
//     {Value: parameters},
//     {Value: page_id},
//     {Value: space_id},
//     {Value: page_title},
//     {Value: space_title},
//     {Value: time_visited}
//   ]},
// });