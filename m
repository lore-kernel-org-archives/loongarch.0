Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EC623B6
	for <loongarch@lists.linux.dev>; Thu, 16 Jun 2022 11:27:30 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id z9so597112wmf.3
        for <loongarch@lists.linux.dev>; Thu, 16 Jun 2022 04:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=JkeC51MkdeoDLQpco0jL3hyff259M5xJNeJbQwUlUVg=;
        b=lXg6biEZE3d1hxasWZJFOwYkiTOvtsurOEEP9Z5Fvlzu/7D6okfkzizdSf3F2MacyC
         kuTwTQpoQFOnIhqkRt+4rp7Z4sLEYE4iQuVgKluvjrVIS6L9d3kYo82nYmbuOlqWP1H8
         BTGlU3zxqu3WzlH8oUwlpHndIR1s0FxMDS+kU1Z/1QAUHh9Ltdpz575pIL8txaMf4LFG
         4mv+ak+8n5pZyVz+raXsdBhHPtq82gjmWcMSq8n2VySTT2cl2Il7MgLNenSbbak6N4KP
         dWiFjMtGjHdSeG6epzsVs8tOHmCqxdnU294kq/1nK1V4J8DrQOUQveFpKSMoH0Nrw6Bi
         fCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=JkeC51MkdeoDLQpco0jL3hyff259M5xJNeJbQwUlUVg=;
        b=xc/95W4pOqMrAanasPDsgaUhICn1zXCTYyUofjjAfJ3C4td4uuoiM8MxFQojZfjIS0
         RXg+C0wqIoLSrGlbUxGEb0GR2NZjPlEopPFtcoLRtwy3usgFJp+R7jYaQRpIpeZ+34Lb
         Jh3FrmCl7iTmm75CO07nQW3fKs/JE/pXjEfRbYd+F+fI8jq/eaxkB9QmKnSwcs5Y7lYo
         0AjYJooo2Ia3PW3tRL/CJ2Ic6sE6MeIOLZCo+KN5KG8HPqsVlRjxK24z8jKJsMy8uoso
         UTfgBGCebRot+Ce4LlnFtnT3+WBEC2nJgd5GsoRUDYuwanx2yLGu+Tjdmprfv6LmZ1aY
         ARYw==
X-Gm-Message-State: AOAM532dDkWW/VdrOB1bx/AbmnE+l6SnZnPTdp3Zera0AKeisjG6OCWO
	boAORhytDQaQjG4r5l7j8RlaouZESqFfHJAa/NYtFiiCMTpuH+HH
X-Google-Smtp-Source: ABdhPJz2UHQdYGGLyIpPWdTwSkAQFK2SVS9v9wlE90qmsfE3LrfARPjeImHHClCmDez5Lo5OAUsXzkc7NyaofXHR12A=
X-Received: by 2002:a05:600c:2307:b0:39c:6ce3:2a06 with SMTP id
 7-20020a05600c230700b0039c6ce32a06mr15195261wmo.113.1655378848634; Thu, 16
 Jun 2022 04:27:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shyam Kumar <skachukattu@contractor.linuxfoundation.org>
Date: Thu, 16 Jun 2022 16:57:17 +0530
Message-ID: <CAH=dH9_3vP9zjtwBbOUkkLAPxxJ3kpkH9gpUcT3-Vii7d=frzA@mail.gmail.com>
Subject: Test Mail
To: loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello:

 This is a test message to test successful delivery and start the
 archive for the list. Please ignore


-- 
Regards
Shyam Kumar
The Linux Foundation Core Projects
