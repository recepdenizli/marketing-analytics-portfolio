WITH facebook_cte AS (
  SELECT
    DATE(ad_date) AS ad_date,
    COALESCE(value, 0) AS conversion_value,
    COALESCE(spend, 0) AS spend
  FROM public.facebook_ads_basic_daily
),
google_cte AS (
  SELECT
    DATE(ad_date) AS ad_date,
    COALESCE(value, 0) AS conversion_value,
    COALESCE(spend, 0) AS spend
  FROM public.google_ads_basic_daily
),
combined AS (
  SELECT * FROM facebook_cte
  UNION ALL
  SELECT * FROM google_cte
),
daily_totals AS (
  SELECT
    ad_date,
    SUM(conversion_value) AS total_conversion_value,
    SUM(spend) AS total_spend
  FROM combined
  GROUP BY ad_date
)
SELECT
  ad_date AS date,
  total_conversion_value::float / NULLIF(total_spend::float,0) AS romi,
  total_conversion_value::float AS total_conversion_value,
  total_spend::float AS total_spend
FROM daily_totals
WHERE total_spend > 0
ORDER BY romi DESC
LIMIT 5;