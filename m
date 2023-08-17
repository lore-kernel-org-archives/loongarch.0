Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4A812B8E
	for <loongarch@lists.linux.dev>; Thu, 17 Aug 2023 11:50:24 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-40e268fe7ddso44485141cf.3
        for <loongarch@lists.linux.dev>; Thu, 17 Aug 2023 04:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692273023; x=1692877823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9lCWWjQi5kUWQlvBUeWc9Nf3lu8DPVL2qmfP5rbSH8=;
        b=B318olWAbT4vuUsbtKYjkoZiRsrsxPFHyrZi3TtEFEtKW9h3HQ8f6p1ZRi50SrnyCG
         C+D/x4gkGvmid46CM4iXEfUFE/yZ3ytdCcH2N6gOXu9JZt+aFx2UTxLKt4xfP2VdVVI8
         9KxUpxSEK/gl17voSaMvhohVkORyM75jnOhS6ZqlAdHN8jCbQ46aMLX6QNlopN9nlm5v
         B8fDbFD99P3xAkGmWSEP5pwRciF8F/RY59tT57mvUlskrhHRrzWLLdIqcq1fp+i8Z3kO
         U6rIOCAZeq4vLtZrsIy+OCSK5It0dkOBIEwEcUtjRUUjwn3n1IgunVaOVGRFTcGvBwEs
         xkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692273023; x=1692877823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9lCWWjQi5kUWQlvBUeWc9Nf3lu8DPVL2qmfP5rbSH8=;
        b=l4t3qO+OWZixQX/4OBzx2tQmwzPOxMIWttzkmztE1U4MBP2xb1Be6u5cbK7WKY7xM4
         HehdIgeEpb6RwsNMw0nVXI4rOG1wFsqMV5UDF8H+pvt4FqK6P5JSAzdDIHxbW6kiw0Ap
         Xifl6vEdyJr/HSNgTQ8QwvNadtVr+b5VptUYI6O5NUuRPXhAsnnSuEeDE5dWF7AeQvdh
         3dFR55CSik6hy1ahxLu9FXlcnFJK7U3Gop1qbCU2aaGaFvgvfOfmM0vbTrZ8LH/Z0uz2
         U9kOeqYJ1lUl8O+8RSuFgBpNbVeiENRr+cG25vCI37axQubt0KK0Wfg+fMcOg1M2Tpvo
         +HGQ==
X-Gm-Message-State: AOJu0YxhJIk0doPf2IPt9BHNMPOhDZLLTab1pVtMUaE/gNc3eTe8fsEM
	ErBNfJ2+5ukE2bcoWPT85mKxbOqYnNs=
X-Google-Smtp-Source: AGHT+IGwqjtGvtLsdAOqh0kLYJ3VIFiib/773UCebXn1X0RAhfGf45yDH3EG+elLFhKYLA0K3GB07Q==
X-Received: by 2002:ac8:584d:0:b0:407:fb08:c44e with SMTP id h13-20020ac8584d000000b00407fb08c44emr4743578qth.5.1692273023167;
        Thu, 17 Aug 2023 04:50:23 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id h8-20020ac85148000000b0040ff387de83sm5142149qtn.45.2023.08.17.04.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 04:50:22 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v3 1/4] arch/arm/configs/*_defconfig cleanup
Date: Thu, 17 Aug 2023 07:50:11 -0400
Message-ID: <20230817115017.35663-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.41.0.327.gaa9166bcc0ba
In-Reply-To: <20230817115017.35663-1-twoerner@gmail.com>
References: <20230817115017.35663-1-twoerner@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop CONFIG_NF_LOG_NETDEV as it was removed in commit 1510618e45cb
("netfilter: nf_log_netdev: merge with nf_log_syslog").

Drop CONFIG_NFT_COUNTER as it was removed in commit 023223dfbfb3
("netfilter: nf_tables: make counter support built-in").

Drop CONFIG_NF_FLOW_TABLE_IPV6 and CONFIG_NF_FLOW_TABLE_IPV4 as they were
removed in commit c42ba4290b21 ("netfilter: flowtable: remove ipv4/ipv6
modules").

Drop CONFIG_NF_LOG_BRIDGE as it was removed in commit 77ccee96a674
("netfilter: nf_log_bridge: merge with nf_log_syslog").

Drop CONFIG_IP_NF_TARGET_CLUSTERIP from any remaining arm defconfigs as it
was removed in commit 9db5d918e2c0 ("netfilter: ip_tables: remove clusterip
target").

Drop CONFIG_USB_MUSB_AM35X as it was removed in commit 57f8e00d8a82 ("usb:
musb: Drop old unused am35x glue layer").

Drop CONFIG_NFT_OBJREF as it was removed in commit d037abc2414b
("netfilter: nft_objref: make it builtin").

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 arch/arm/configs/keystone_defconfig  | 1 -
 arch/arm/configs/multi_v7_defconfig  | 1 -
 arch/arm/configs/omap2plus_defconfig | 8 --------
 3 files changed, 10 deletions(-)

diff --git a/arch/arm/configs/keystone_defconfig b/arch/arm/configs/keystone_defconfig
index 1cb145633a91..61179b75cf1f 100644
--- a/arch/arm/configs/keystone_defconfig
+++ b/arch/arm/configs/keystone_defconfig
@@ -98,7 +98,6 @@ CONFIG_IP_NF_MATCH_TTL=y
 CONFIG_IP_NF_FILTER=y
 CONFIG_IP_NF_TARGET_REJECT=y
 CONFIG_IP_NF_MANGLE=y
-CONFIG_IP_NF_TARGET_CLUSTERIP=y
 CONFIG_IP_NF_TARGET_ECN=y
 CONFIG_IP_NF_TARGET_TTL=y
 CONFIG_IP_NF_RAW=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index c7b2550d706c..497274c81ea2 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -851,7 +851,6 @@ CONFIG_USB_MUSB_HDRC=m
 CONFIG_USB_MUSB_SUNXI=m
 CONFIG_USB_MUSB_TUSB6010=m
 CONFIG_USB_MUSB_OMAP2PLUS=m
-CONFIG_USB_MUSB_AM35X=m
 CONFIG_USB_MUSB_DSPS=m
 CONFIG_USB_MUSB_UX500=m
 CONFIG_USB_UX500_DMA=y
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index b685018dcf54..b2f0862f4bd9 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -78,7 +78,6 @@ CONFIG_IP_PNP_BOOTP=y
 CONFIG_IP_PNP_RARP=y
 CONFIG_NETFILTER=y
 CONFIG_NF_CONNTRACK=m
-CONFIG_NF_LOG_NETDEV=m
 CONFIG_NF_CONNTRACK_ZONES=y
 CONFIG_NF_CONNTRACK_EVENTS=y
 CONFIG_NF_CONNTRACK_TIMEOUT=y
@@ -92,7 +91,6 @@ CONFIG_NF_TABLES_INET=y
 CONFIG_NF_TABLES_NETDEV=y
 CONFIG_NFT_NUMGEN=m
 CONFIG_NFT_CT=m
-CONFIG_NFT_COUNTER=m
 CONFIG_NFT_CONNLIMIT=m
 CONFIG_NFT_LOG=m
 CONFIG_NFT_LIMIT=m
@@ -100,7 +98,6 @@ CONFIG_NFT_MASQ=m
 CONFIG_NFT_REDIR=m
 CONFIG_NFT_NAT=m
 CONFIG_NFT_TUNNEL=m
-CONFIG_NFT_OBJREF=m
 CONFIG_NFT_QUEUE=m
 CONFIG_NFT_QUOTA=m
 CONFIG_NFT_REJECT=m
@@ -179,7 +176,6 @@ CONFIG_NETFILTER_XT_MATCH_TIME=m
 CONFIG_NETFILTER_XT_MATCH_U32=m
 CONFIG_NFT_DUP_IPV4=m
 CONFIG_NFT_FIB_IPV4=m
-CONFIG_NF_FLOW_TABLE_IPV4=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
@@ -193,14 +189,12 @@ CONFIG_IP_NF_TARGET_MASQUERADE=m
 CONFIG_IP_NF_TARGET_NETMAP=m
 CONFIG_IP_NF_TARGET_REDIRECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
 CONFIG_IP_NF_SECURITY=m
 CONFIG_NFT_DUP_IPV6=m
 CONFIG_NFT_FIB_IPV6=m
-CONFIG_NF_FLOW_TABLE_IPV6=m
 CONFIG_IP6_NF_IPTABLES=m
 CONFIG_IP6_NF_MATCH_AH=m
 CONFIG_IP6_NF_MATCH_EUI64=m
@@ -225,7 +219,6 @@ CONFIG_IP6_NF_TARGET_NPT=m
 CONFIG_NF_TABLES_BRIDGE=m
 CONFIG_NFT_BRIDGE_META=m
 CONFIG_NFT_BRIDGE_REJECT=m
-CONFIG_NF_LOG_BRIDGE=m
 CONFIG_BRIDGE=m
 CONFIG_BRIDGE_VLAN_FILTERING=y
 CONFIG_VLAN_8021Q=m
@@ -560,7 +553,6 @@ CONFIG_USB_STORAGE=m
 CONFIG_USB_MUSB_HDRC=m
 CONFIG_USB_MUSB_TUSB6010=m
 CONFIG_USB_MUSB_OMAP2PLUS=m
-CONFIG_USB_MUSB_AM35X=m
 CONFIG_USB_MUSB_DSPS=m
 CONFIG_USB_INVENTRA_DMA=y
 CONFIG_USB_TI_CPPI41_DMA=y
-- 
2.41.0.327.gaa9166bcc0ba

