enabled_site_setting :hide_user_stats_enabled

after_initialize do
  module HideUserStatsExtension
    # Remove topic_count from serialization
    def topic_count
      nil
    end
    
    # Remove post_count from serialization
    def post_count
      nil
    end
    
    # Prevent topic_count from being included in JSON
    def include_topic_count?
      false
    end
    
    # Prevent post_count from being included in JSON
    def include_post_count?
      false
    end
  end
  
  # Apply to user card (shown in popups)
  UserCardSerializer.class_eval do
    prepend HideUserStatsExtension
  end
  
  # Apply to full user profile page
  UserSerializer.class_eval do
    prepend HideUserStatsExtension
  end
  
  # Apply to user summary
  UserSummarySerializer.class_eval do
    prepend HideUserStatsExtension
  end
end