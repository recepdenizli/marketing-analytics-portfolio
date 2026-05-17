WITH facebook_cte AS (
  SELECT
    f.ad_date::date AS ad_date,
    'facebook' AS media_source,
    COALESCE(SUM(f.spend),0) AS daily_spend
  FROM public.facebook_ads_basic_daily f
  LEFT JOIN public.facebook_adset a ON f.adset_id = a.adset_id
  LEFT JOIN public.facebook_campaign c ON f.campaign_id = c.campaign_id
  GROUP BY f.ad_date
),
google_cte AS (
  SELECT
    g.ad_date::date AS ad_date,
    'google' AS media_source,
    COALESCE(SUM(g.spend),0) AS daily_spend
  FROM public.google_ads_basic_daily g
  GROUP BY g.ad_date
),
combined AS (
  SELECT * FROM facebook_cte
  UNION ALL
  SELECT * FROM google_cte
)
SELECT
  ad_date,
  media_source,
  ROUND(AVG(daily_spend),2) AS avg_spend,
  ROUND(MAX(daily_spend),2) AS max_spend,
  ROUND(MIN(daily_spend),2) AS min_spend
FROM combined
GROUP BY ad_date, media_source
ORDER BY ad_date, media_source;