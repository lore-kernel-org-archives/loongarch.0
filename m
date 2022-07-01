Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CF41C3A
	for <loongarch@lists.linux.dev>; Fri,  1 Jul 2022 14:49:50 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id bo5so2681145pfb.4
        for <loongarch@lists.linux.dev>; Fri, 01 Jul 2022 07:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8BCU8tBwV7dKAMv2Q/+gFcUqrZxq5rWryWL5G4eU2og=;
        b=JZoMZBtPSWOfni4WXIdW0sBq/fo9s07HVGREtlQjpLh1UNmRzQ5AS26LCn7mH8r51T
         AZT36Owc9hS7rIx2qZPkDtFe2WlNHkHGo1IHcjK54JY4ZeDrIdtTYvOxHTZU88o75EvU
         6/WSWrsChD63sPRCtEs1KNnbLCb/gMvhdXr0bGmtpVKnVSggdtxGNeWq5hkbpqt3U+cQ
         dD+F7UOHXKB12XbBmwRMe1Lp+XA3l6maJv5UXoHlDxrbqmiVv26H+OtJCmbSiZMxZakX
         PD6c7WLWxx2N1EIGkdgvF0gOh2WEGxdl3ttGZJqHQAmUg+Yg9rpXgE7xeu1YJ1ulGUbh
         Ecew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=8BCU8tBwV7dKAMv2Q/+gFcUqrZxq5rWryWL5G4eU2og=;
        b=5xb4EbAD1RXO2OPNGsBHn3yhlPQ1wn0p0uIJZq/rsayUaRA129V3VSkrq9o+Duk7X0
         irDm6YwUDWSpC7g2F2BF+chnCGx9nN2s17GbrkOAy/qxEIHzPHEkLRIXq/gptLtnWsVZ
         HKafaZTvPUXGCFXq8A7jXcSqrq//2ucIP2LH7DfGLXzOKjWbp+HQsCr6NLcvmhIL+C4e
         45N62AmSmA9iVEEZgHaAaJidce1Osm0j4Z7orpWl52V/je//bwNsctCl4dzjNOrRB5H3
         E2Jg24AKpNQ5qKKJSDPzqHp0Lqij4PhUoLz55Wzv2HcybE2aihVWngvseN9LjGdJv8df
         7EfQ==
X-Gm-Message-State: AJIora8hTFrYD5MtiGfXL8RtPnJ04WGZBHvcVTTBJqCeRLk2+JM/hnGR
	N0O96r4YBPa69CryiRuF96A=
X-Google-Smtp-Source: AGRyM1va10ykgy0jlmrGOYnU4/U5uHmwRoYtfc/m2piSKKUV3DAhYHAvq5L9Sudz3HuAcIuPcN5M8g==
X-Received: by 2002:a05:6a00:24cc:b0:50d:58bf:5104 with SMTP id d12-20020a056a0024cc00b0050d58bf5104mr20429691pfv.36.1656686989915;
        Fri, 01 Jul 2022 07:49:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bo7-20020a056a000e8700b0052515a79b78sm15517450pfb.189.2022.07.01.07.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 07:49:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Guo Ren <guoren@kernel.org>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/3] LoongArch: Fix build errors
Date: Fri,  1 Jul 2022 07:49:43 -0700
Message-Id: <20220701144946.2528972-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A number of build errors is seen when trying to build loongarch:allnoconfig
or loongarch:tinyconfig. This patch series tries to fix the observed
errors. 

----------------------------------------------------------------
Guenter Roeck (3):
      LoongArch: page.h: Add missing include file
      LoongArch: Do not include file from toolchain
      LoongArch: Always select EFI

 arch/loongarch/Kconfig                 |  6 ++----
 arch/loongarch/include/asm/loongarch.h | 23 +++++++++++------------
 arch/loongarch/include/asm/page.h      |  1 +
 3 files changed, 14 insertions(+), 16 deletions(-)
