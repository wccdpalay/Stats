module StatsHelper
  def get_stats_values(day)
    TIME_SLOTS.map  do |time|
      s = Stat.find_by_date_and_time(day, time)
      s ? s.total : 0
    end
  end

end
