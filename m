Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435C713AC2
	for <loongarch@lists.linux.dev>; Thu, 17 Aug 2023 11:50:26 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-40a9918ec08so45925491cf.0
        for <loongarch@lists.linux.dev>; Thu, 17 Aug 2023 04:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692273025; x=1692877825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbvZ0wXoAsUi3mH+OyBVc4tLRr53KILTrQvp8XOCI2I=;
        b=TI34epmG63xD/ogdDBQlcmORfJTVgqCB9lCa/odYhTA7mGcaaXBsVMVzIoLJkRSQSX
         cyj6CUlXhBBpxGczW9E//k7K5WcVE0awNVniGZOocUxt1fjELgDWbzmKjH/aB/Lw8haN
         ejRcRk+qaJr5GY/7t0AgvIN6MkEqFwU/TsheIqw6pwDr60lXmZZc4/+qGwtIMqPjCStI
         7LGDwqCEjWEvukhk68ufc+soaBCCdJqVyC3WfFdbEX15Vhznz7adSHAXxXIS41T3S+HW
         gUgF92Cz6ETPSlKpDhxGxaPa8wHIFUKq8zBcj/64dTv6/6P+aoRQODiwtCT7tJFNbbzP
         z9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692273025; x=1692877825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbvZ0wXoAsUi3mH+OyBVc4tLRr53KILTrQvp8XOCI2I=;
        b=dXkJz6HLGoaZ7nruNHsWmfd9ziZac6cLKMudlvLCCJfE/R56d7xXFGJ+MwVrw+jhSf
         auLQA7yE/+zDeXGkj9WTBHQ6hegMLbmSNVwKMLnbzIZfUHdw5r3LBveSx9fM5avGcV/H
         IzXmognulzmC7SbZ/7N9BOLgh5XVnQHyAtTtMs56QdUI9TfFTFuRPzzRqbyXO8s90hEa
         QNzs9sec+sraQX90Cuz4+wTK8PLoM+wM/R/XBv+hiLkp7ovLQ3o5GG4N2rv5Y1uRGqLz
         iNLj92p0MTRxlkEUOe48qPNxISwfYScT1CV+KCVQCgnm7dkBRY1J8RhRIdOlAuQvShXJ
         Gbqg==
X-Gm-Message-State: AOJu0Yxck22NwMIlgYeb5oVvtSi4sGkUIr5uO23AZlE7Bt9zyYsy7Iz/
	98sKD/I0THWNGI/dpvWY6aw=
X-Google-Smtp-Source: AGHT+IFwFJxPNX+IDoSCTYuBwePuAYwMImkYtdwD+QMIGbAdq3LaStJT3pJEeHO3wtYuDF5hW0txgA==
X-Received: by 2002:ac8:57c8:0:b0:405:5337:4166 with SMTP id w8-20020ac857c8000000b0040553374166mr5942082qta.68.1692273024954;
        Thu, 17 Aug 2023 04:50:24 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id h8-20020ac85148000000b0040ff387de83sm5142149qtn.45.2023.08.17.04.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 04:50:24 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/4] arch/loongarch/configs/*_defconfig cleanup
Date: Thu, 17 Aug 2023 07:50:12 -0400
Message-ID: <20230817115017.35663-3-twoerner@gmail.com>
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

Drop CONFIG_IP_NF_TARGET_CLUSTERIP as it was removed in commit 9db5d918e2c0
("netfilter: ip_tables: remove clusterip target").

Drop CONFIG_NFT_OBJREF as it was removed in commit d037abc2414b
("netfilter: nft_objref: make it builtin").

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 arch/loongarch/configs/loongson3_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index d64849b4cba1..4700655b2bcb 100644
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
@@ -227,7 +226,6 @@ CONFIG_IP_NF_TARGET_MASQUERADE=m
 CONFIG_IP_NF_TARGET_NETMAP=m
 CONFIG_IP_NF_TARGET_REDIRECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
-- 
2.41.0.327.gaa9166bcc0ba

