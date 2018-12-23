if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => ENV['ap-northeast-1'],     # 例: 'ap-northeast-1'
      :aws_access_key_id     => ENV['AKIAJGR3IQ6KP2DDNFDQ'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['st5818129']
  end
end