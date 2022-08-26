Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01C223C0
	for <loongarch@lists.linux.dev>; Fri, 26 Aug 2022 07:29:11 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id i8-20020a17090a65c800b001fd602afda2so890263pjs.4
        for <loongarch@lists.linux.dev>; Fri, 26 Aug 2022 00:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=RPtdfP3TWiMLZ8jtcBgtF0VJ97dIkZ/0sNyHyGpDEEo=;
        b=m6OEY0BwHV5eh2mGSBWql4StaNMD0ikXJPFMdzVrPQIMttUjmR0ZmeDBLr6HV4KPQd
         FmFFdY1TvLYJoA5lTqL92/auo04aEcP8PwHFTbjmQBSMSOrbkjB9WbqICbFt/5LTJ6u/
         9B7ixqRieKHwCjVq+a3XdEdAm7krWW6IcTM+Ws8hOSRFgUzSEyzXOLHmK6aC5wlSOQqt
         k6iqmYWoE1byQ4RA6Qn4mKp7IWIPued+7NFccXEbl/SMo085oZ4PatypwqFhFkZx9zPm
         g0I4oHJ+K6lIHeqBwkksNFMSlia3laNZ9lSiFocrP+yyjkzItpZoRuHKoOMyFd0aUPk/
         rrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=RPtdfP3TWiMLZ8jtcBgtF0VJ97dIkZ/0sNyHyGpDEEo=;
        b=ckQUBj4+LO4fRuKQCORn76zMG49jsWUBGgV6qKMIx5qaJWxxtEi3M4WkVrknk4+xHa
         XzuaT6wV8VY/QKg+sdarbmu3npApaSYC38DR9KcaXRGvheYzqtrKSnOkOKzEzOQ9oTmj
         a5ZQr/WDbCYLfkbCk8zNEhhqNgdj2UQOZGW+1aJQ5VsKRIESgLqjwPHFvOWcUZnFoyoa
         kLUrQo5+vZIKXmTgK4iz1hKFIIUihRIhfsNYiIufuuVCh1cuaVYnHu7Xu08LR05bf763
         zr6KebHK5Nkzr9CPwwn1wPQ9dt7Gt42wHb6V/jKufhzVjzwSMlSEkI/z1ODx89C9hY69
         NSXg==
X-Gm-Message-State: ACgBeo3/26buqzd2ImEg2lYsFKYu2CAH32e++hOSnHoQU15qFrntrOJ0
	VspPeYje0EatX5+orXSv9iE=
X-Google-Smtp-Source: AA6agR6vvbys8JGgPWpZFZe9Pi9xOPupapJeS55OINinoc2xFM6JDhSEv1QMz34gPwjp710ZnQlpGg==
X-Received: by 2002:a17:902:e194:b0:172:bc18:39a8 with SMTP id y20-20020a170902e19400b00172bc1839a8mr2554319pla.24.1661498951145;
        Fri, 26 Aug 2022 00:29:11 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id z16-20020a170903019000b00172f1d0825esm822356plg.113.2022.08.26.00.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 00:29:10 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	jiaxun.yang@flygoat.com,
	loongarch@lists.linux.dev,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] LoongArch: mm: Remove the unneeded result variable
Date: Fri, 26 Aug 2022 07:29:03 +0000
Message-Id: <20220826072903.253230-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: ye xingchen <ye.xingchen@zte.com.cn>

Return the value pa_to_nid() directly instead of storing it in another
redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 arch/loongarch/mm/init.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index 7094a68c9b83..f05149aa6a37 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -134,10 +134,7 @@ int arch_add_memory(int nid, u64 start, u64 size, struct mhp_params *params)
 #ifdef CONFIG_NUMA
 int memory_add_physaddr_to_nid(u64 start)
 {
-	int nid;
-
-	nid = pa_to_nid(start);
-	return nid;
+	return pa_to_nid(start);
 }
 EXPORT_SYMBOL_GPL(memory_add_physaddr_to_nid);
 #endif
-- 
2.25.1
