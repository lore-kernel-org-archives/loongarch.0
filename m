Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ABE153517
	for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 20:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711569727; cv=none; b=lJ/Uo9qdsFTtEv1oARq2POhAF5AgbD9b9OprLh/X3fB+PqkcCoBLWwyiL9dXlkMcLPRMfqTGZvtswZfIqoTDS3Q1rYPbHtSlj9EDTdUkuNshbl63qKnBu9JAiDBG8yOiKCeUxxz6/VCwUo6eYhndLSH1N2RQeBWi0Y/9W82LGzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711569727; c=relaxed/simple;
	bh=9cqIF+Bi5JTCjT1ojFORS3NgOriFIL4LCNqqaGMHGzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cXz33Fm370ObR3q2JwdmOKP3y2ENKcsXTEzSeMiBOetiLK+i4GFV7xiWf48DE6xgka2qoovixvHS3c4U3jCKItqelK3qq88ynhjvWjEPwLcPtZ/LqXcLgWKMZ5OcejevvP1qAMPXkkFqL8JruthPw7MF1YlNxOOiBGiAkt4qEYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=aJBw/7S1; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="aJBw/7S1"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1e0bec01232so2083165ad.3
        for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 13:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569726; x=1712174526; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9egB7QSoDAHRW6tgRYqVd+NUTiSQfL/JcKX7OjtD5w=;
        b=aJBw/7S1iRo9Bw/85cLNBfGLG+aNl/7E9w2stJ5ZjWnFX2E6hweyhYyQEdi8MaXhcq
         hu9cWTb3g31IWAiv7QLEC/UAYB4ih5pLH+aOMGzKZEb9OpuJnjRrRg9JfzMNmUS09w3T
         OJVuZR3QAF5XNgUMrOaKGPP6m9t+d4PmKMgpVnEgzDKEVMZR1svSoleZKTzPuLIxlrOW
         Rp5CC0e5oWVas1vkMVtPLV5IFnq7JTcW2u8hpKlaTWGCfr7LlS5jDe4Ojs/1FkjhIEr1
         CQqI38fqfPrzfMmQX4bXQyEGq6I3hxduSrSpFfCGc6KIVk9uQ7labCuZxc/TWw8SM929
         ZyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569726; x=1712174526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9egB7QSoDAHRW6tgRYqVd+NUTiSQfL/JcKX7OjtD5w=;
        b=EFAmJ+yaTBkY3mAgVNI0gCU7y4afv3oa7tuuDdreJf4f6q3HMRliGLYypuIY1EAK5a
         +gPyJgXj5LRkpHGPzhZZsXOnAK66fS0RwrsqiU0HZLyB+tIWxxweTZ7NqmatRBiNRYSJ
         Dc9aAwj9N7YqPV4AZ1ka+jvYmdGhRfvPIPld8y6xAKY4lFnZCAl9IMA7RZwrkKidQSIa
         4PtfKaOKo4I+NxtzZNcREqctUdaYl5pEMv9xLatFmvTt5AndLOTxM8Qf2KMKC2ERLgGx
         z4wej9iMfP6PXbIOKcOoSE7AyXOuMRJfARwTClhTegdkFZdwm2CZKVzxghp9j7MGJuV+
         ozfA==
X-Forwarded-Encrypted: i=1; AJvYcCW8sZnDCEE2awh3BNe3R532pLMqoTbmx11ugnzK/jueIzgL++wwk/5LzMVwuNwBw4rSRuqS9DDTtz1ljq0Xo1H0caCnA3W5TM/B
X-Gm-Message-State: AOJu0YwjWCYJLS4KQQcZT3SxLuh2RsNjbLmgdlAe7RKW+HBFyGUjPcZM
	M++IpkjhpeMN6DIxiD6ehrF8kc5aOzhnbUC4miTk52hdLhUMCbpgJhG02juhR6s=
X-Google-Smtp-Source: AGHT+IFGHdi74bAZSMUCS5nBpcP7LI5Cfqz6VZFaIDx36rlYRojmLVaB4TIyZga5IdN5tuwaxR1nKA==
X-Received: by 2002:a17:903:2b05:b0:1dc:a605:5435 with SMTP id mc5-20020a1709032b0500b001dca6055435mr854470plb.31.1711569725718;
        Wed, 27 Mar 2024 13:02:05 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:05 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>,
	loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 05/14] arm64: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Wed, 27 Mar 2024 13:00:36 -0700
Message-ID: <20240327200157.1097089-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327200157.1097089-1-samuel.holland@sifive.com>
References: <20240327200157.1097089-1-samuel.holland@sifive.com>
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

(no changes since v2)

Changes in v2:
 - New patch for v2

 arch/arm64/lib/Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 29490be2546b..13e6a2829116 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -7,10 +7,8 @@ lib-y		:= clear_user.o delay.o copy_from_user.o		\
 
 ifeq ($(CONFIG_KERNEL_MODE_NEON), y)
 obj-$(CONFIG_XOR_BLOCKS)	+= xor-neon.o
-CFLAGS_REMOVE_xor-neon.o	+= -mgeneral-regs-only
-CFLAGS_xor-neon.o		+= -ffreestanding
-# Enable <arm_neon.h>
-CFLAGS_xor-neon.o		+= -isystem $(shell $(CC) -print-file-name=include)
+CFLAGS_xor-neon.o		+= $(CC_FLAGS_FPU)
+CFLAGS_REMOVE_xor-neon.o	+= $(CC_FLAGS_NO_FPU)
 endif
 
 lib-$(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) += uaccess_flushcache.o
-- 
2.43.1

