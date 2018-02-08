/// 
Class Garmin.DeepSeeCube Extends %DeepSee.CubeDefinition [ DependsOn = Garmin.Track, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="Garmin" displayName="Garmin" disabled="false" abstract="false" sourceClass="Garmin.Track" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false">
  <dimension name="TrackDate" disabled="false" hasAll="false" allCaption="All TrackDate" allDisplayName="TrackDate" sourceProperty="TrackDate" type="data" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="TrackDate" disabled="false" sourceProperty="TrackDate" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
      <level name="TrackTime" disabled="false" sourceProperty="TrackTime" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="Good" disabled="false" hasAll="false" allCaption="All Good" allDisplayName="Good" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Good" disabled="false" sourceProperty="Good" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="TimeChange" disabled="false" hasAll="false" allCaption="All TimeChange" allDisplayName="TimeChange" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="TimeChange" disabled="false" sourceProperty="TimeChange" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <measure name="Distance" displayName="Distance Travelled" disabled="false" sourceProperty="Distance" aggregate="SUM" type="number" hidden="false" searchable="false">
  </measure>
  <measure name="Altitude" disabled="false" sourceProperty="Altitude" aggregate="SUM" type="number" hidden="false" searchable="false">
  </measure>
  <measure name="Latitude" disabled="false" sourceProperty="Latitude" aggregate="SUM" type="number" hidden="false" searchable="false">
  </measure>
  <measure name="Longitude" disabled="false" sourceProperty="Longitude" aggregate="SUM" type="number" hidden="false" searchable="false">
  </measure>
  <measure name="AltitudeChange" disabled="false" sourceProperty="AltitudeChange" aggregate="SUM" type="number" hidden="false" searchable="false">
  </measure>
  <measure name="DistanceChange" disabled="false" sourceProperty="DistanceChange" aggregate="SUM" type="number" hidden="false" searchable="false">
  </measure>
  <measure name="LatitudeChange" disabled="false" sourceProperty="LatitudeChange" aggregate="SUM" type="number" hidden="false" searchable="false">
  </measure>
  <measure name="LongitudeChange" disabled="false" sourceProperty="LongitudeChange" aggregate="SUM" type="number" hidden="false" searchable="false">
  </measure>
</cube>
}

Parameter DOMAIN;

}
