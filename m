Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED8F6FBB
	for <loongarch@lists.linux.dev>; Fri,  8 Dec 2023 05:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UT5M3wt+"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ce32821a53so1093203b3a.0
        for <loongarch@lists.linux.dev>; Thu, 07 Dec 2023 21:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702014909; x=1702619709; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJ/tAo5hDwQPfRruz9afcRfXvkx00dxKddYKFVNcdvc=;
        b=UT5M3wt+P0hsPfLvakaMevsbP9bVCJpgJOGvHgTwYGQAVEuqVe+e08UCMGJTFZ3YHc
         33PJ4Ehr35tV5R3FBVopOez/mT84Q+z8Q3VfCTZrulvy6L94amTvOSArqRPUVWGaFwkB
         v++GhrQq892nMDd5Je+NkxueThuLvI6RyEZltpotDBVruHXxXbxSPE31GuIpwqxzkSUK
         znqVK++GFzCe+NCZI1j8MrCs9xnT6iCr1SALV5EcuKpobx+u5iuhMvkiagPg9d40Ihf8
         4tpX81ECi6540E37SHuNBlswDh81h20UKH9QGHmnn0LFVE7cQt71GooYIsKT2MVADXec
         g3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702014909; x=1702619709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJ/tAo5hDwQPfRruz9afcRfXvkx00dxKddYKFVNcdvc=;
        b=V3H/iusRWgD8JM3KPa8zOeqKw8Qtk5p7dowQzVMlguY69+W7eB6/l1WO40IM0k5Tdn
         JulKM5/Zy38TobNYO670w1fXLR/TO0qjTogxaIve0h1ZMmEavIoe5bNWUkMyR5WtvJzm
         7MmPjbzMIm6ttdeDajdcvRA1XJW6QpcCufuQ6PeUWSivH9FOCSmRVopK6L9WDvql9U00
         ckJanbnd2fFRDHlwt79Q1uetoH96pPXbdvQn04lPoHdfythieJBuS93klNwcJFbhj2jC
         XdivhaWLttwwNrUhBr54W16ya8sbDKylKz5a4hY3lo8Kmj66UPo3aAIaqEctJxmR2wTs
         HhbQ==
X-Gm-Message-State: AOJu0YwCvR9uzi3OwkW3IZESzrqrgAkBXVFPYGARVNno38Zyv9WJPft0
	GczyCGHsa1YnDb3XvkQpp+yERw==
X-Google-Smtp-Source: AGHT+IHgMEmtold3cNsq0/10/gSamuXTn7dqDmNr7pkUJjR3cZZJuyMG6U/Bp0CgIPL33Lkbwgh+tw==
X-Received: by 2002:a05:6a20:4282:b0:181:74fe:ba83 with SMTP id o2-20020a056a20428200b0018174feba83mr4264495pzj.40.1702014909013;
        Thu, 07 Dec 2023 21:55:09 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b001ce5b859a59sm786250plp.305.2023.12.07.21.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 21:55:08 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-arch@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH 05/12] lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Thu,  7 Dec 2023 21:54:35 -0800
Message-ID: <20231208055501.2916202-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208055501.2916202-1-samuel.holland@sifive.com>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that CC_FLAGS_FPU is exported and can be used anywhere in the source
tree, use it instead of duplicating the flags here.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

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

