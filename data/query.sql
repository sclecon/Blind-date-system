-- 纬度：31.182592  store_locy 经度：121.431744  store_locx
 
SELECT
	*,
	(
	2 * 6378.137 * ASIN(
	SQRT(
	POW( SIN( PI( ) * ( 121.431744- store_locx ) / 360 ), 2 ) + COS( PI( ) * 31.182592 / 180 ) * COS( store_locy * PI( ) / 180 ) * POW( SIN( PI( ) * ( 31.182592- store_locy ) / 360 ), 2 ) 
	) 
	) 
	) AS distance 
FROM
	t_merchant_store 
ORDER BY
	distance ASC