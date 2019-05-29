# The includer of this module has to respond following 2 methods
#   - :encryption_data_key
#   - :encryption_data_key=
# Because this module uses those.

module KmsKey
  def data_key
    if self.encrypted_data_key
      kms_response.plaintext
    else
      resp = kms_generate_data_key
      self.encrypted_data_key = resp.ciphertext_blob
      resp.plaintext
    end
  end

  private
  def kms_client
    @kms_client ||= Aws::KMS::Client.new(region: aws_region)
  end

  def kms_response
    @kms_response ||= kms_client.decrypt(ciphertext_blob: self.encrypted_data_key)
  end

  # a data_key has 2 attributes
  #   - ciphertext_blob: encrypted key
  #   - plaintext: plain text key
  def kms_generate_data_key
    @kms_response = kms_client.generate_data_key(
      key_id:   kms_cmk_id,
      key_spec: 'AES_256',
    )
  end

  def kms_cmk_id
    Rails.application.config.x.settings['kms_cmk_id']
  end

  def aws_region
    Rails.application.config.x.settings['aws_region']
  end
end
