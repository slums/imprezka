# ORG
Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :facebook, '131551150238460', '9868e66271e87bf5903999fbfa0513ca'
end  
