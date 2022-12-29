class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode(payload, "secret")
    end

    def decode_token
        #Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozfQ.geFux4D4EXZv6yqNLibgPTe4msXLd0RXVQoeAkKyWDw
        auth_header = request.headers["Authorization"]

       if auth_header
            token = auth_header.split(" ")[1]
            begin
                JWT.decode(token, "secret", true, algorithm: "HS256")
            rescue JWT::DecodeError
                nil
            end
        end
    end
end
