Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67914C87
	for <loongarch@lists.linux.dev>; Fri,  7 Oct 2022 20:19:42 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id e10-20020a05600c4e4a00b003b4eff4ab2cso5180040wmq.4
        for <loongarch@lists.linux.dev>; Fri, 07 Oct 2022 13:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dXdIo0hRN02ZPJAwNm3u1mGY1VCoQSfJnTxD1fX9Jng=;
        b=f4Dhz3KLnMyG1se0ROB0KLgh/z01THj8Db76AcdmjTnC2uK4IxwijDA+rhdQlvWrFo
         as2soL2VbAqCJACX/OIdD3SJGs56K3UHlbZGHvlgj9KIXkrO1marHERh0EocA2AUfV+w
         JCjmtbQ4n42G8Y1ep2nhz/wZHf/X0vXMFGwTDmt6z1WajH3TjboaHhi04qyIx+hUxP58
         zeocfn0T4TgS/fqrThbDUPC/yYPKzlu9DmxvYjP6CHK6f4gA6DP/oBv/LbN9k9xQKf4n
         eLm4xTyfhdeNtKdq2w3+USV2pr+qcqW3yTduNEguZ2eeA6BxecATQ7zQ5AB6RTmJrG2p
         A91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dXdIo0hRN02ZPJAwNm3u1mGY1VCoQSfJnTxD1fX9Jng=;
        b=RuX0vY79PolQa25edOPWNxtYAzslfVSPsrpqggCrll/NuNiwXug+/tAqdZevyiL92v
         P4eogSmXvWJ2zPZ+8s3+MSXCCZtoApCCDz23NwXsalztxgnEDnrd5tQQV0UxQLZw5ISV
         S6HxKXlRX/8IEl5YN17LYJ/AWaS3746C41LL0AdH/xnafwxJEUn3E6Q8ZkoqsnH3UcAO
         WMSUMcF55S78NwCR1T1UCLj+Ab0U1gHGiYnOl/WEhwDkG07ZUgT3ML6O57Us0NX970xg
         7qs1EIm0iNQW/ExlHx3i1Beiu+mIRqHqFkDX9kSRHzEHGnJTCp3tMHSyljHhZthmhxr/
         fZmg==
X-Gm-Message-State: ACrzQf2/nORrWEkHHjxZe58OklGhHV8V7eREy0wC31QCxyql4TlVwkly
	KLU1KFJ/GDgP3sYFtMGqI7w=
X-Google-Smtp-Source: AMsMyM42GLUq87Hjpke22vTC+iqQFCJd2ggf7uv2NyWFz9XDILyVkcOiMkcSbVw0aj92CgistYZpLw==
X-Received: by 2002:a1c:3847:0:b0:3c3:8082:a0 with SMTP id f68-20020a1c3847000000b003c3808200a0mr2653304wma.67.1665173981093;
        Fri, 07 Oct 2022 13:19:41 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id d16-20020adf9c90000000b0022dd3aab6bfsm2680205wre.57.2022.10.07.13.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 13:19:40 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: Kconfig: Fix spelling mistake "delibrately" -> "deliberately"
Date: Fri,  7 Oct 2022 21:19:39 +0100
Message-Id: <20221007201939.2755407-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a commented section. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 arch/loongarch/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 898263224bbc..903096bd87f8 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -171,7 +171,7 @@ config STACKTRACE_SUPPORT
 	bool
 	default y
 
-# MACH_LOONGSON32 and MACH_LOONGSON64 are delibrately carried over from the
+# MACH_LOONGSON32 and MACH_LOONGSON64 are deliberately carried over from the
 # MIPS Loongson code, to preserve Loongson-specific code paths in drivers that
 # are shared between architectures, and specifically expecting the symbols.
 config MACH_LOONGSON32
-- 
2.37.3

