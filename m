Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5A1396
	for <loongarch@lists.linux.dev>; Thu, 17 Aug 2023 02:59:59 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6471e071996so20392216d6.0
        for <loongarch@lists.linux.dev>; Wed, 16 Aug 2023 19:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692241199; x=1692845999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjoDDEyxVBWaQtzkWkdga/Zvs3GJHHOlEnHErr/kjWs=;
        b=Lu7Fi3loMtfHwYQlIndd8s4c97XWa+qSGHVzGWylM/WJo2xthm62+VioAKyDY0IGBH
         BaTwP2cfyzZu3k6lGSd6BpAHyxUXLmC3N6zdcZGghI5P+ZAB17kBhj2ua97IM244IMjx
         RYfrZ8PBBmWLoe5zs4A034vEx5iOI6Nv/4XupEqSuDiZ8BMNpfTC3h7HyxCcAN32IaHL
         VmVDNvGyI14LIfL3C9W4aL+asUMnyZcQ9TjzVKLFGaxAWsNlGGXSe2l8VGf9mTzf1+Yq
         ExR/xABGYpt+XvCS1mSMrbTD16yhPaomKGZs0LcnbUqrzZo4FczXs2BjwFxwzYxUU7S5
         gN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692241199; x=1692845999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WjoDDEyxVBWaQtzkWkdga/Zvs3GJHHOlEnHErr/kjWs=;
        b=i4J2Y4TkAyMXYlAaUocNsvR8fyW6DxfXsAjVi+M9YRo2jKGoAhVJyHJENdJysYHBdy
         uI05E62nCWhe705ORSQQUSg7aDH3+Ce9w/u9rRaKTS5mZ4W8uXHHGUadd/T3SXjWE1sT
         SNI6cusQv8XMC3fsVsye9+JelYI5J+kdIJ4B9saLq83nn8GjbOabhM7So1Fx8sxcy5wP
         CB4/aUKL9aoXe7EOTStvlR6p/Rby+KpcSYHTok2krjNFeaOQOsTrRRhHISuQh4aMbhcw
         KqhTZJS+2YZFUqsPhDFSXa8vAfAQ7xI5zF6n/vZkQuzzFMCEJqNnvu0mkx+xIN5ExDjA
         rUKg==
X-Gm-Message-State: AOJu0Yze7hqduuU/CQlCU8W3iYKEapy+NBZw7q7s6pLGXrb5eLL6L2ea
	cQdr/v0dVkmXm90yzWkjVb8=
X-Google-Smtp-Source: AGHT+IGhZ/HBbA0JLp662iG7DoeLVwbqfYr89wyB+wy0wQ06xPNcpBzGU9UCkaLwgQGQewTc8rniNA==
X-Received: by 2002:a0c:9719:0:b0:647:1feb:327a with SMTP id k25-20020a0c9719000000b006471feb327amr4177889qvd.59.1692241198643;
        Wed, 16 Aug 2023 19:59:58 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id c16-20020a0cf2d0000000b0063d0159e1f6sm5260184qvm.109.2023.08.16.19.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:59:58 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/4] arch/mips/configs/*_defconfig cleanup
Date: Wed, 16 Aug 2023 22:59:38 -0400
Message-ID: <20230817025942.3209-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.41.0.327.gaa9166bcc0ba
In-Reply-To: <20230817025942.3209-1-twoerner@gmail.com>
References: <20230817025942.3209-1-twoerner@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop CONFIG_IP_NF_TARGET_CLUSTERIP from any remaining mips defconfigs as it
was removed in commit 57f8e00d8a82 ("usb: 71 musb: Drop old unused am35x
glue layer").

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 arch/mips/configs/ip22_defconfig        | 1 -
 arch/mips/configs/malta_defconfig       | 1 -
 arch/mips/configs/malta_kvm_defconfig   | 1 -
 arch/mips/configs/maltaup_xpa_defconfig | 1 -
 arch/mips/configs/rm200_defconfig       | 1 -
 5 files changed, 5 deletions(-)

diff --git a/arch/mips/configs/ip22_defconfig b/arch/mips/configs/ip22_defconfig
index 44821f497261..dc49b09d492b 100644
--- a/arch/mips/configs/ip22_defconfig
+++ b/arch/mips/configs/ip22_defconfig
@@ -127,7 +127,6 @@ CONFIG_IP_NF_MATCH_TTL=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
diff --git a/arch/mips/configs/malta_defconfig b/arch/mips/configs/malta_defconfig
index 743209047792..ae1a7793e810 100644
--- a/arch/mips/configs/malta_defconfig
+++ b/arch/mips/configs/malta_defconfig
@@ -127,7 +127,6 @@ CONFIG_IP_NF_MATCH_TTL=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
diff --git a/arch/mips/configs/malta_kvm_defconfig b/arch/mips/configs/malta_kvm_defconfig
index dd2b9c181f32..c07e30f63d8b 100644
--- a/arch/mips/configs/malta_kvm_defconfig
+++ b/arch/mips/configs/malta_kvm_defconfig
@@ -131,7 +131,6 @@ CONFIG_IP_NF_MATCH_TTL=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
diff --git a/arch/mips/configs/maltaup_xpa_defconfig b/arch/mips/configs/maltaup_xpa_defconfig
index 97c2d7f530b3..0a5701020d3f 100644
--- a/arch/mips/configs/maltaup_xpa_defconfig
+++ b/arch/mips/configs/maltaup_xpa_defconfig
@@ -128,7 +128,6 @@ CONFIG_IP_NF_MATCH_TTL=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
diff --git a/arch/mips/configs/rm200_defconfig b/arch/mips/configs/rm200_defconfig
index e0e312dd968a..5c5e2186210c 100644
--- a/arch/mips/configs/rm200_defconfig
+++ b/arch/mips/configs/rm200_defconfig
@@ -90,7 +90,6 @@ CONFIG_IP_NF_MATCH_TTL=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
-- 
2.41.0.327.gaa9166bcc0ba

