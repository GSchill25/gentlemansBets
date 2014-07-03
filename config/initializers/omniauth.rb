Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'qdDc5pq5rD9BxzeoNuXRcyyJr', 'uiFF2DXSObh6XBB3eTA3q4DQ0KcoY6KLaJD78E7zKRxmMitmtr'
  provider :facebook, '719077141484735', 'be243929e22ddcffa6f6abe37ae440be'
end