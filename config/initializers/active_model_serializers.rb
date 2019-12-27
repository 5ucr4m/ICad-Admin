# frozen_string_literal: true

ActiveModelSerializers.config.adapter = ActiveModelSerializers::Adapter::Json
ActiveModelSerializers.config.key_transform = :camel_lower
