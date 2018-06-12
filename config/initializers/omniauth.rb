Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :google_oauth2 , "914328221062-eaenmvihjdnh0gl6et7d3s8uon5022io.apps.googleusercontent.com","ls6LV3mHIvPIEsbSp1QqsHro"
  provider :instagram , "d5a01cbf7f2e46669d0cc5a3592bdde7","87d13ddc45684881be86d140ce51ec46",scope: ['public_content']
end