Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEB1396
	for <loongarch@lists.linux.dev>; Thu, 17 Aug 2023 02:59:57 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6418c1239c5so34066586d6.0
        for <loongarch@lists.linux.dev>; Wed, 16 Aug 2023 19:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692241196; x=1692845996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztwugRyCoG/jPczTnAvnIkr0nq9TF+fC2+bEu6D3jFw=;
        b=Zw4yS8EE/ONnyxUVX0vsKLQUPf5oNFxSVPTWmOyt4c9a9lq6ns/tC4610cgge8UXgh
         fBhR1AdhwR9+pdnw5tRB+nIS+XUKsWg9lY7C9zM6eYgGoCfOBUP21kM5OM/pDhOahNSx
         wXluh7v2jIkhQdJJifSB8i0RenT6XLhxG8V9iThazbxiTkEUJM+tJ2tWaMQtUqfPZ8f2
         Hv99NSes3vLfyMDH56pVsPQXJYlOS0T0ENdSrkqFa1nnmUiJzDPXVhd96mWYJ6Am9Tc8
         OwzCXEx2MpfRi0rwevYHxRB9wjuSrt2KNaXNTfPAyOnLTlIFwDrZ2INl9TTdeLMxyW+H
         TjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692241196; x=1692845996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztwugRyCoG/jPczTnAvnIkr0nq9TF+fC2+bEu6D3jFw=;
        b=Fw9vfDN53ZGjN3iNnxLX90ymb9GepCZ5aXQjyLtxzWQAoMr14Qzt4QCi0cOzuIs8Yv
         XeYoiBGczaZF26b8Ik2eicSEwNFSZapQx1jwSPVzldbVETfWeZF89NMvSvLLLPpWpsYh
         cyBpDq2ZZt9vQEuozrD/UfF8Crr7mTBUZSK1syteSqHZkMm9H5KuERcLWrczfW64HdXs
         GYygrsscakpfT87JykvkkqkPnk+SGAjVk3bMOMp6EQA0I9ZhxNXSyOqlKYbDSKET+vJ9
         QJ0e2HXMT0j+mPG7bE7c7s/QYCX0j9MygT/oBnByukGnGOSfaBIL7NuD+iGRDV2GO5Ih
         4P0Q==
X-Gm-Message-State: AOJu0Yw7bQnbAvkhDCIEsdiVrb2ANT54s81N430dhepMcmyA7erydl6X
	OwRcHRdyS8+3mwDsS1zc9wQ=
X-Google-Smtp-Source: AGHT+IG+FilTVdaRFGvd3ZuP9D/ev2/97REv1ERlKBJZKe5MJQokXeEBYBnEUFUrg7AAkPP/DryCmQ==
X-Received: by 2002:a0c:b356:0:b0:649:7b67:14d3 with SMTP id a22-20020a0cb356000000b006497b6714d3mr1869864qvf.32.1692241196259;
        Wed, 16 Aug 2023 19:59:56 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id c16-20020a0cf2d0000000b0063d0159e1f6sm5260184qvm.109.2023.08.16.19.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:59:55 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/4] arch/loongarch/configs/*_defconfig cleanup
Date: Wed, 16 Aug 2023 22:59:37 -0400
Message-ID: <20230817025942.3209-3-twoerner@gmail.com>
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

Drop CONFIG_IP_NF_TARGET_CLUSTERIP as it was removed in commit 57f8e00d8a82
("usb: 71 musb: Drop old unused am35x glue layer").

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

