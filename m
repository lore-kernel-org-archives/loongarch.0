Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AF32591F
	for <loongarch@lists.linux.dev>; Thu,  3 Aug 2023 19:18:40 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-76758b855edso114661085a.0
        for <loongarch@lists.linux.dev>; Thu, 03 Aug 2023 12:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691090319; x=1691695119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cn6LA5zi+jJ8uMg/k1zD8LVyDKk8sr2d1EdjLuZgbUk=;
        b=lVwCNrhvJUgz2qvTclStLwRiLou7BWCen3WdwmijmaUWDNcEMjcIJqsp0GjikxGNzH
         v6U1IxbkSeyJ+N/SCWp7yrI3QODMrQRzuzF6Ljo2aFG6IylWrUj02yDidWEyht5JXu85
         8spILvAnS76WEGH0WfzMHtvsfKiNxxa+6ymre4QYiLL/qDJgh1Eqn7xlOG5XMalGU3NB
         clNOVKvO0uPM7ICVauhRL2tskGLFY5AJDCyEKtJ4wzPEl/lzvxk69C7KZFfcGFyWMhRT
         Hyrz2AkBNMe2h2IdQwsIvdCFl3gKH76c9VtNhR/0Md5DjAAL/ctefxtKgFv0wzMR/D2u
         nq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691090319; x=1691695119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cn6LA5zi+jJ8uMg/k1zD8LVyDKk8sr2d1EdjLuZgbUk=;
        b=ZwlmBC7a/MmGoQCi5Bp902QssKomKNU3BuuSmPE3nMyZItDHyU6ZZLrtqk2HnLFwAb
         vUXeQ5RitLChLox4ULbB6E7rsTmOlyuXcAle3bRKm91BsyBNtEl84tn7MMMYSBt47NKV
         SynNMdwaU7gEC01d1LJdVcwLwoCZjTAIWq9Yb8G+9QLvPFrYi1SD5GSbeSMWbowifQ5d
         hHPCmesqz6KUl+0QRB8VQqR+G+ZyfZp2dJdHuWHAjxhiW0vxEauTLZFGOa2xL8bUUySW
         q6L5a/UbTh9zs4/N7Vy8B0xhB2LloSWDAuRc0yGdj9Ci/ePHKlucR7dS7DzDzLbUTMMG
         xkbA==
X-Gm-Message-State: ABy/qLZrEacJU2QsLCdhgWBbY6f773dFWriltDMz18ZDLh61ifJcLOo2
	h27JPKTOflHy0OfT06zjux4=
X-Google-Smtp-Source: APBJJlESw8lMtsxA24LFj9NOntuxQMkmaPyUBjtM3XmbQ2WMAmkT5wO2PSDyPabRhRa3p3o71LtNdw==
X-Received: by 2002:a05:620a:454b:b0:76c:a3bc:7fc2 with SMTP id u11-20020a05620a454b00b0076ca3bc7fc2mr21287793qkp.34.1691090319445;
        Thu, 03 Aug 2023 12:18:39 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id n20-20020a0ce494000000b0063762ab2f90sm108897qvl.83.2023.08.03.12.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 12:18:38 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev
Subject: [PATCH 4/4] arch/*/configs/*_defconfig cleanup: drop CONFIG_NFT_OBJREF
Date: Thu,  3 Aug 2023 15:18:18 -0400
Message-ID: <20230803191821.36793-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.41.0.327.gaa9166bcc0ba
In-Reply-To: <20230803191821.36793-1-twoerner@gmail.com>
References: <20230803191821.36793-1-twoerner@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop CONFIG_NFT_OBJREF as it was removed in commit d037abc2414b
("netfilter: nft_objref: make it builtin").

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 arch/arm/configs/omap2plus_defconfig       | 1 -
 arch/loongarch/configs/loongson3_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 98fbd16e17ce..b2f0862f4bd9 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -98,7 +98,6 @@ CONFIG_NFT_MASQ=m
 CONFIG_NFT_REDIR=m
 CONFIG_NFT_NAT=m
 CONFIG_NFT_TUNNEL=m
-CONFIG_NFT_OBJREF=m
 CONFIG_NFT_QUEUE=m
 CONFIG_NFT_QUOTA=m
 CONFIG_NFT_REJECT=m
diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index 04665c517c74..4700655b2bcb 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -137,7 +137,6 @@ CONFIG_NFT_MASQ=m
 CONFIG_NFT_REDIR=m
 CONFIG_NFT_NAT=m
 CONFIG_NFT_TUNNEL=m
-CONFIG_NFT_OBJREF=m
 CONFIG_NFT_QUEUE=m
 CONFIG_NFT_QUOTA=m
 CONFIG_NFT_REJECT=m
-- 
2.41.0.327.gaa9166bcc0ba

