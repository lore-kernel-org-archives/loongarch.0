Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3C963CD
	for <loongarch@lists.linux.dev>; Thu, 28 Dec 2023 01:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="PZZ/fukN"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6d9b13fe9e9so2461545b3a.2
        for <loongarch@lists.linux.dev>; Wed, 27 Dec 2023 17:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727750; x=1704332550; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jd6BNzjMN3b9R+N9FmyfxlTWIL2mCpzUIRSa4mv1F0=;
        b=PZZ/fukNvv58YA58o5C5ZW0MtyxXsj4I8PdQbLUj6xkLnQFoOT+GTEDMMUt30n9baF
         FPvHFSOrAMDNo5iXlNwXmggew8bgAF/9DiUFfa9mNU4gz920Q27cTRBDToxC6gCHzITh
         9lcmloxEHysSgK0lxivHH3LSOwymDKeaexy0a6HesawjIrArpI9wYmUd5Z9ZHlJnuH9X
         Snn9Ep9av5q5H3UYvVu9h2HDVt0dX3DGRhtvX+W+7WTxFfxqe4V9SkjjoEMJCgfQGWLf
         bq1+enqt66VKFbTOxF5rTPOkKGa39BXsSJRUoIaesYqfzrpyaNWUlttFZSBY5PDk3u5Z
         RS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727750; x=1704332550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jd6BNzjMN3b9R+N9FmyfxlTWIL2mCpzUIRSa4mv1F0=;
        b=hcuGbBkEuZjWxaSriRxUtfQ+zIz99h/H+zjWSUUHx+/qK0GQJ7ts0vCDB8moy56QsB
         a53R6K8A/wMUQPsBe7/Mc84jjdw98BRr9OpMjqA+rnuZVSqHVUs5WOUMkUolcTgSdxHx
         zaOGXth9gkMMsoHqY37sR1UGvxcqwSNKHdpBihK+SftdK/IlBQ+tjmWKnv66uWtlYnvU
         KbKzr0NJhk+0otIR56KLzzF6N3F3KE3eQ95JvKHpC4ZdDeTjwjDJyd3H1In1ugWkkYAo
         CTbE7BPoLSaCV3Sw8yTjoboMnTf/ulVKMD/AXGwme5gLhXESx4DrPCLloJaAkK2x627J
         7BPA==
X-Gm-Message-State: AOJu0Yz0DLQfXeWZLLbRRGREx96TRI0zZ4xOFeIvlUoEIrQ3glUnfmJp
	1CjRvpRwczHyQc/7yWuVrr2C32e9YbA4Zw==
X-Google-Smtp-Source: AGHT+IE0nmjtDXMxXkCsxA9jA/OWEHDhYnPM1dnj251PyNU2gTBGhxX93h+FmlGsyJJp6FOxSnIuVA==
X-Received: by 2002:a05:6a00:214d:b0:6d9:f66a:b5f6 with SMTP id o13-20020a056a00214d00b006d9f66ab5f6mr2059083pfk.34.1703727750207;
        Wed, 27 Dec 2023 17:42:30 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:29 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-arch@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 06/14] lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Wed, 27 Dec 2023 17:41:56 -0800
Message-ID: <20231228014220.3562640-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231228014220.3562640-1-samuel.holland@sifive.com>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that CC_FLAGS_FPU is exported and can be used anywhere in the source
tree, use it instead of duplicating the flags here.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 lib/raid6/Makefile | 31 ++++++++-----------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
index 1c5420ff254e..309fea97efc6 100644
--- a/lib/raid6/Makefile
+++ b/lib/raid6/Makefile
@@ -33,25 +33,6 @@ CFLAGS_REMOVE_vpermxor8.o += -msoft-float
 endif
 endif
 
-# The GCC option -ffreestanding is required in order to compile code containing
-# ARM/NEON intrinsics in a non C99-compliant environment (such as the kernel)
-ifeq ($(CONFIG_KERNEL_MODE_NEON),y)
-NEON_FLAGS := -ffreestanding
-# Enable <arm_neon.h>
-NEON_FLAGS += -isystem $(shell $(CC) -print-file-name=include)
-ifeq ($(ARCH),arm)
-NEON_FLAGS += -march=armv7-a -mfloat-abi=softfp -mfpu=neon
-endif
-CFLAGS_recov_neon_inner.o += $(NEON_FLAGS)
-ifeq ($(ARCH),arm64)
-CFLAGS_REMOVE_recov_neon_inner.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon1.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon2.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon4.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon8.o += -mgeneral-regs-only
-endif
-endif
-
 quiet_cmd_unroll = UNROLL  $@
       cmd_unroll = $(AWK) -v N=$* -f $(srctree)/$(src)/unroll.awk < $< > $@
 
@@ -75,10 +56,14 @@ targets += vpermxor1.c vpermxor2.c vpermxor4.c vpermxor8.c
 $(obj)/vpermxor%.c: $(src)/vpermxor.uc $(src)/unroll.awk FORCE
 	$(call if_changed,unroll)
 
-CFLAGS_neon1.o += $(NEON_FLAGS)
-CFLAGS_neon2.o += $(NEON_FLAGS)
-CFLAGS_neon4.o += $(NEON_FLAGS)
-CFLAGS_neon8.o += $(NEON_FLAGS)
+CFLAGS_neon1.o += $(CC_FLAGS_FPU)
+CFLAGS_neon2.o += $(CC_FLAGS_FPU)
+CFLAGS_neon4.o += $(CC_FLAGS_FPU)
+CFLAGS_neon8.o += $(CC_FLAGS_FPU)
+CFLAGS_REMOVE_neon1.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_neon2.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_neon4.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_neon8.o += $(CC_FLAGS_NO_FPU)
 targets += neon1.c neon2.c neon4.c neon8.c
 $(obj)/neon%.c: $(src)/neon.uc $(src)/unroll.awk FORCE
 	$(call if_changed,unroll)
-- 
2.42.0

