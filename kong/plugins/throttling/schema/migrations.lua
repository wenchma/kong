local Migrations = {
  {
    name = "2015-02-11-134401_init_throttling",
    up = function(options, dao_factory)
      return dao_factory:execute_queries [[
        CREATE TABLE IF NOT EXISTS throttling_metrics(
          api_id uuid,
          identifier text,
          period text,
          period_date timestamp,
          value counter,
          PRIMARY KEY ((api_id, identifier, period_date, period))
        );
      ]]
    end,
    down = function(options, dao_factory)
      return dao_factory:execute_queries [[
        DROP TABLE throttling_metrics;
      ]]
    end
  }
}

return Migrations
