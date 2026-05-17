WITH combined AS (
  SELECT
    a.adset_name AS adset_name,
    date(f.ad_date) AS ad_date,
    COALESCE(f.impressions,0) AS impressions
  FROM public.facebook_ads_basic_daily f
  LEFT JOIN public.facebook_adset a
    ON f.adset_id = a.adset_id

  UNION ALL

  SELECT
    COALESCE(ad.adset_name, ad.campaign_name) AS adset_name,
    date(ad.ad_date) AS ad_date,
    COALESCE(ad.impressions,0) AS impressions
  FROM public.google_ads_basic_daily ad
),

filtered AS (
  SELECT
    adset_name,
    ad_date
  FROM combined
  WHERE impressions > 0
  GROUP BY adset_name, ad_date 
),

grouped AS (
  SELECT
    adset_name,
    ad_date,
    (ad_date - (ROW_NUMBER() OVER (PARTITION BY adset_name ORDER BY ad_date) * INTERVAL '1 day'))::DATE AS grp 
  FROM filtered
),

streak_lengths AS (
  SELECT
    adset_name,
    MIN(ad_date) AS streak_start,
    MAX(ad_date) AS streak_end,
    (MAX(ad_date) - MIN(ad_date)) + 1 AS streak_length
  FROM grouped
  GROUP BY adset_name, grp
)

SELECT
  adset_name,
  streak_start,
  streak_end,
  streak_length
FROM streak_lengths
ORDER BY streak_length DESC, streak_end DESC
LIMIT 1;