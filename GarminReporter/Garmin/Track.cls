Class Garmin.Track Extends %Persistent [ StorageStrategy = GarminTrack ]
{

Property TrackDate As %Date;

Property TrackTime As %Time;

Property Latitude As %Float;

Property Longitude As %Float;

Property Distance As %Float;

Property Altitude As %Float;

Property TimeChange As %Integer;

Property LatitudeChange As %Float;

Property LongitudeChange As %Float;

Property DistanceChange As %Float;

Property AltitudeChange As %Float;

Property Good As %String;

Storage GarminTrack
{
<SQLMap name="Track">
<Data name="Altitude">
<Delimiter>"~"</Delimiter>
<Piece>4</Piece>
</Data>
<Data name="AltitudeChange">
<Delimiter>"~"</Delimiter>
<Piece>10</Piece>
</Data>
<Data name="Distance">
<Delimiter>"~"</Delimiter>
<Piece>5</Piece>
</Data>
<Data name="DistanceChange">
<Delimiter>"~"</Delimiter>
<Piece>9</Piece>
</Data>
<Data name="Good">
<Delimiter>"~"</Delimiter>
<Piece>1</Piece>
</Data>
<Data name="Latitude">
<Delimiter>"~"</Delimiter>
<Piece>2</Piece>
</Data>
<Data name="LatitudeChange">
<Delimiter>"~"</Delimiter>
<Piece>7</Piece>
</Data>
<Data name="Longitude">
<Delimiter>"~"</Delimiter>
<Piece>3</Piece>
</Data>
<Data name="LongitudeChange">
<Delimiter>"~"</Delimiter>
<Piece>8</Piece>
</Data>
<Data name="TimeChange">
<Delimiter>"~"</Delimiter>
<Piece>6</Piece>
</Data>
<Global>^track</Global>
<Subscript name="1">
<Expression>{TrackDate}</Expression>
</Subscript>
<Subscript name="2">
<Expression>{TrackTime}</Expression>
</Subscript>
<Type>data</Type>
</SQLMap>
<StreamLocation>^Garmin.TrackS</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

Index RowID On (TrackDate, TrackTime) [ IdKey, Unique ];

}
