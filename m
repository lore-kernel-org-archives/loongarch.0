Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901DB339AD
	for <loongarch@lists.linux.dev>; Tue, 30 Jan 2024 23:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706657505; cv=none; b=tOYfrsom9b4TRWxOJxNSIi86/iVHDcuDe8u0nFQJzZKzKl4LiwzZN9wanMWY0d/4iMwlIg0RInIsgNeZarMvTrkIfMc6m9aFXEAAUhdXTeoP4PBlqvIB2dC4HiINnmRUlvonq5XorPkpd1w6MN0cJCA2m8y8zdxj3vhmY2GerL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706657505; c=relaxed/simple;
	bh=tjgkJWJHJ1m0/YqTb/xcrpYoub6gZSwUTnxfXo0y8mM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RK+x6qu8vOD3eqLq7oV1tMJkQ6NzB3LfLHe5p6yBm9NDuejyvH9ixm8L4VF+ciE26pZtepLgwPu2WwQtpCnejT1wB/gIEC2Boy0w1vWtnfnn3T5t3Nys8O7yi6+JAcOPP683z+3RHjuFsRFnHo2cnJUyvlNXeVbcXW5ew8+xKvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TzykNBCi; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TzykNBCi"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-59a87156cb8so276393eaf.2
        for <loongarch@lists.linux.dev>; Tue, 30 Jan 2024 15:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706657502; x=1707262302; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PiOXMkAilXSlADbFG8aS86y0I95Of2JWiczoVplHqlw=;
        b=TzykNBCi0So4J0HxuDGwHOU6B18Sv9ZLCGGh9ub9nZH6JJzy24BTEiTuzYdszJS6TR
         p7PzjAWGBr7Q96TwKR62Ivbel8xcVnQ5SJQByAVZ5KAm0dXFPkU/TMGRF4sZl/xsl0wr
         PL+FshLlVLXtwJzJf+2TYHnotNvCIWF7z4Zfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706657502; x=1707262302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PiOXMkAilXSlADbFG8aS86y0I95Of2JWiczoVplHqlw=;
        b=gP78PkgycJKZQAy4zrvxABOn4HGS65aUuZaLSUDAHvIaF2MMPeKQ59Ri8sigKCMpjt
         adKntxpVbYeXpzJ4w2HkBIGiqvUQTnLk99toqqzITp9s6egQ6Y4d7c6b6VzVwe5O2oTb
         7aHMNGxlFPEtHGcrHarV7dVsnaSvSQTz5bnyH7wIsQeHpwZ+gHJWHNf007NT2XAr86aa
         l7NNGotK9sZShEacPHVoMsJAJwZjYEcwngd+dypC0ZHcqpldjMDNmpEPMr4BsW4U0iJI
         Jhh2BTPXAkqNSTKiuX7hNiF8RvOUDHSUMnJqK2eC1iFVYuoX1WxjjfCjXo85398Hyca6
         mVfQ==
X-Gm-Message-State: AOJu0YxB7R/Qah25flP3/5dl8Do/BXRqvE4pKx0PBfp6h3bQjSKJ3M5q
	Iwua56JAQnz1Nq4XZhykcPAK5KUXIH82e0GgTOZ1Lu54GBu2lTpYbIewe7uPqw==
X-Google-Smtp-Source: AGHT+IGGp57sIuxTKTDCF6nyyO91maNOKuzeOvSumXmlWoy42j5hwEgcNPzAvuL4+x+S4cRxfQM9KQ==
X-Received: by 2002:a05:6358:ee4b:b0:176:503b:937c with SMTP id ik11-20020a056358ee4b00b00176503b937cmr11351112rwb.21.1706657502506;
        Tue, 30 Jan 2024 15:31:42 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e17-20020a656491000000b005d67862799asm4122554pgv.44.2024.01.30.15.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 15:31:42 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	kernel test robot <lkp@intel.com>,
	WANG Xuerui <kernel@xen0n.name>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Fangrui Song <maskray@google.com>,
	loongarch@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>,
	Qing Zhang <zhangqing@loongson.cn>,
	Feiyang Chen <chenfeiyang@loongson.cn>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] LoongArch: vDSO: Disable UBSAN instrumentation
Date: Tue, 30 Jan 2024 15:31:40 -0800
Message-Id: <20240130233140.work.887-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1243; i=keescook@chromium.org;
 h=from:subject:message-id; bh=tjgkJWJHJ1m0/YqTb/xcrpYoub6gZSwUTnxfXo0y8mM=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBluYbcRNRE8eUz6tYFQAladg8P+XLUdL7e+q6Ay
 HNwzQiW6pGJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZbmG3AAKCRCJcvTf3G3A
 JqrGD/9KqwEPh/D8NLTeQy/ro72FzTNk6eJ4UoWbJyVz54451QNtyI8Oc+aW7x5mwjheN6IuiBH
 NQWBKFcgrqimUJYO3XbnPOZ9OHF6ipf8Fx5/YGLbDOW/LvRGhQlfhhM/BrARH1xALcZOIemiMq+
 NuU7tiZ/mCDZ/F642nIKE0HNndm4/hc5n2O6qywD9fGxto65WqauLwprzk8bha2cGSgza57ugq0
 skX/qRMKo3j1tE/w2RqvkSBY3+GQpzZagNc3svK67YbiehX9F/OmhGV4MwHgq14GA+cdGeq7RqE
 yDvPvSSAzv53zimYkjmzf1J1SJu0JGr1Z1oN1hp+9nCi0ERF7nII2Iuqrwg80fVRF1XcH1NbC4e
 nNwMv8Y+SxYvohvqCUv7PPh7jG9px5qJckUoUTf4WfuvKS7YU2vOMXpjjfENAh8x25CZV8hgM7w
 9GsO/XTLRiPR1AHlUG8WmqX9X8WYkLGiJrQDYNfJfzURwyRzrE6DYCVqHFnF7biS08v15rdi/kK
 uGO36RfIGaYGeB9X43uygcIWgMx8nAEyT7HAs65yjqtAQPXCwSN7dsKqUZ8MbVbqmfpULI8mwwN
 cigKOOdVwkeauhMdkb25S1LXaQl0LOqZcCgvjDThmUbYmdv9piaEe9qYh7seS8iF/mJGyg/+e2Q
 1zZB3C8 wXNNI0+w==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

The vDSO executes in userspace, so the kernel's UBSAN should not
instrument it. Solves these kind of build errors:

  loongarch64-linux-ld: arch/loongarch/vdso/vgettimeofday.o: in function `vdso_shift_ns':
  lib/vdso/gettimeofday.c:23:(.text+0x3f8): undefined reference to `__ubsan_handle_shift_out_of_bounds'

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202401310530.lZHCj1Zl-lkp@intel.com/
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Fangrui Song <maskray@google.com>
Cc: loongarch@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/loongarch/vdso/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
index c74c9921304f..f597cd08a96b 100644
--- a/arch/loongarch/vdso/Makefile
+++ b/arch/loongarch/vdso/Makefile
@@ -2,6 +2,7 @@
 # Objects to go into the VDSO.
 
 KASAN_SANITIZE := n
+UBSAN_SANITIZE := n
 KCOV_INSTRUMENT := n
 
 # Include the generic Makefile to check the built vdso.
-- 
2.34.1

