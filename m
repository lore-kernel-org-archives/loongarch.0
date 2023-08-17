Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2235036A
	for <loongarch@lists.linux.dev>; Thu, 17 Aug 2023 02:59:52 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6418d8a659fso25000256d6.0
        for <loongarch@lists.linux.dev>; Wed, 16 Aug 2023 19:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692241192; x=1692845992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VqIUTEi6b5maOYfEISJN/XLCGUsT7sZm6MvKkdhtPPQ=;
        b=WHSqp/OjipS4malg5Jhuw8Q9iUeu1/JOmbXWqXYvnZgGD0kM17N6tQvxwUsCI5NLru
         Uc5eVbilZvj+vU/FDtUEKtVANL/igEVVU9fMzmN+KBhf+xt59WNKpal6tsNf+z9+Y7TV
         yD5Im18r3kHMjvZZUNXeLn1YO9dO18rMwOHA24MSxJx1EZE51SgTXLAarM8kC0zelVrK
         5SidfXYcfJz7Lp9YUVglFIezKC2ivHG+RE4hB+Sk1DDJsqYqmafTDGDirXACn06WXuBz
         DmK8i+/ZjA5wROpsni5u9JVtRraWCxRDSDmuyfbzUbITI31KPak3SF5rZt2bcrO0fYUd
         z78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692241192; x=1692845992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqIUTEi6b5maOYfEISJN/XLCGUsT7sZm6MvKkdhtPPQ=;
        b=bu5Y74H3oeS+Moq6Kk/F+mGw7CaeNeN+OfQQvJfjpAXvZZ4atxRbulJbAG3iRT0p/j
         Xh1Lu2292PHMmPPDhRz5+crKCM/tL/NRm1rB2Zm9vEh42TsdQr3IOXfuv+TgDpBE/fca
         Sf453v1FIUWku/ybPq7Xyq6c7BfExrJCjNUOhh3DXvei0zFHKnBE+GLcq0ZnnwppKLEQ
         B9nj8cUehC6eaS/qMJpaJZHctgkqJwNsHyBNuBRfo7zqQTqPDx2CDvwP5mPM2uycI1SI
         lepRKIC3lPolxpTj0hECD/yIKzG1hIVGeLRFrtlgTu14TziI8nmJ6eO4AioH39bJevO4
         v17A==
X-Gm-Message-State: AOJu0Yzd+hfbtPMmm8YFlAeAhWFPCcdgjLi7hhwXeAQQjYPDVYWRqGeM
	626tVgr+yGHn/kcIFHA0KTE=
X-Google-Smtp-Source: AGHT+IFBzAZ0MiGiVZDZXUmHBUCgDd7pIXBv+9jFVMKW5hvqzp/dG7vKept76xYLnf/geME77zPN6A==
X-Received: by 2002:a0c:e047:0:b0:636:afa1:345d with SMTP id y7-20020a0ce047000000b00636afa1345dmr3324091qvk.17.1692241191804;
        Wed, 16 Aug 2023 19:59:51 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id c16-20020a0cf2d0000000b0063d0159e1f6sm5260184qvm.109.2023.08.16.19.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:59:51 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/4] general defconfig cleanups
Date: Wed, 16 Aug 2023 22:59:35 -0400
Message-ID: <20230817025942.3209-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.41.0.327.gaa9166bcc0ba
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop config options from defconfigs whose code has been removed.

v2:
Generate arch-specific patches. In v1 I organized the patches by
CONFIG_ option which caused some of the patches to cross architectural
lines. This requires cross-arch consensus before they can be applied.
Therefore organize the changes by architecture so each one can apply them
independently (or not).

Trevor Woerner (4):
  arch/arm/configs/*_defconfig cleanup
  arch/loongarch/configs/*_defconfig cleanup
  arch/mips/configs/*_defconfig cleanup
  arch/powerpc/configs/*_defconfig cleanup

 arch/arm/configs/keystone_defconfig        | 1 -
 arch/arm/configs/multi_v7_defconfig        | 1 -
 arch/arm/configs/omap2plus_defconfig       | 8 --------
 arch/loongarch/configs/loongson3_defconfig | 2 --
 arch/mips/configs/ip22_defconfig           | 1 -
 arch/mips/configs/malta_defconfig          | 1 -
 arch/mips/configs/malta_kvm_defconfig      | 1 -
 arch/mips/configs/maltaup_xpa_defconfig    | 1 -
 arch/mips/configs/rm200_defconfig          | 1 -
 arch/powerpc/configs/ppc6xx_defconfig      | 1 -
 10 files changed, 18 deletions(-)

-- 
2.41.0.327.gaa9166bcc0ba

