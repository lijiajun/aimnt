package com.ai.mnt.service.priv;

import java.util.Map;

public interface PersonalInfoService {

    public Map<String, Object> updatePersonalPasswd(String passwd, String passwdNew,
            String passwdNew2);

}
