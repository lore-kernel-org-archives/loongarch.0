Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA0139A7F8
	for <loongarch@lists.linux.dev>; Fri, 24 Apr 2026 11:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777028796; cv=none; b=g0G39JDjAV32JmaGACWFBmil82MOsNwPPqOOq8oyJiaTBcnuD3z41sOpr+heo9ZhOF4aplgtCJUbvMsY7EIUDfHYrIPCrNHKW4RD1jM746vGTUVv7lvG7+nXtuH5XbqKHJApCxf1UR70hhS/5Zb9ssK2WnSYpwYYgvnAka3dAmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777028796; c=relaxed/simple;
	bh=N4Z9CTh5ZlzdtCFtBp8F5n/nUs8lkwIgEc7rauaLOBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WP2ohl46N3BNpPL4KBfAQLtlhMJ+wARZnBScl7WJzl7FD1OUfqUevpIpSPIa5DIwTT1f+KBC6nEwR/4Cq8YHJpjQK58U5ZGLO9qXclSoybw+RtaxL9Di+6jIinf6Cc+1b1xvOkkKiyyFEwOb9r9fEbiPDxmPtkbrXg4LbMI6Qp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=BoO4ueYk; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="BoO4ueYk"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b788a98557so30380985ad.2
        for <loongarch@lists.linux.dev>; Fri, 24 Apr 2026 04:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777028794; x=1777633594; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDIZFW/CQm971bNIO9ritpIw0PqXgfmFxiIFHhRqUmo=;
        b=BoO4ueYkLL/Z/OR/w+ktDfAnlTzEU0V6aSQeU7fHC28ndAi+ZnXqpmkbdgS20/iDyA
         enoVtDECWdzw0GHY8LPKl/Gb0Iy1r9Dmc6w7qze12FAHjEUbrdBmobGWTk7g7Ph1G50I
         6UrYZt1hqTkzMm+M59B7QsBX+XrW/37G1pip/lpJZcrEjeYKTKCIqJQ5pvoedokSYHZh
         AZDW6aFMq8+UGki6PGUh86IR+vZ5eUlyWAmwQxhrxp2p/HwiXrAErSV+POCRAtomlyPh
         /k8GetzzGy6bLviFu2Y/mSU1wqV1cB+9Ldr+yruvS6I1bVDU32dLB2vPCA3g3tunBTON
         Vgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777028794; x=1777633594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LDIZFW/CQm971bNIO9ritpIw0PqXgfmFxiIFHhRqUmo=;
        b=mBhh6v3eJb1gieWQj4t8IMhldjc73/i2X2L8VRU8Pu0PHPMRftXuAEBnhRr5K7XyGx
         9EmL15plzUvj/o7jU4uQNWOTs9dTFAHIsDkY7KPtafqJqRB+8JVv+QjuYh025Ueaimsj
         exTctGzOkuNjCYi9VCkINTAsQNyFxN7nvRmVTH1uNPy7hU7IAC2xuQmz7rsplTZ8huPN
         0hTLyT1oU0eRDE3uBM1OkxK5P/uEmihHsB93tP/zmPJWUTx94jWu/ZcXmWrTGm9ArGSX
         83KFgTGHialtWVKOqiup8fCjqxb03rqtd37SPaxSabTFO2wSKVX/Sae2TAMiZ6R5aL2W
         xVzA==
X-Forwarded-Encrypted: i=1; AFNElJ8BWUi90K+CtCdzSrU2zGvYiHfvxYa9VzS3RMZUu7BzUpT2iq5EPCQ5Ssn5zz2XPj1uXCfQI1N4Pxg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1hQ7oSz1gNJ5Ex1tZdN2GvcCM4yUqL94IJpCgmGLsRCGD7Gkj
	KBGz1C/nEVL/UmYywy2WeYIWli9RsisaxzSTdPbmIfGLoO1MiNZQ8RbC9VO4VgbYwxY=
X-Gm-Gg: AeBDietLQv5ljQqmt8mA32C8xg05wSoY0gPwCBjJLUGD5sJP1TBBQIdZARe2LIrpD/2
	wwWifA8W8qoDibKJc+eh4hi6hhSxAAkeI4zbKLDmOJ6AzC0icLjIhlwdxcgzlCNvICUcSGVVICy
	KWogcFX0eOOysvZvA8NPgNZUM+TyP2aBKnLCfrro2p5tGlDKfGLu2MZKZRt1UMLWIzmL9+5IW+T
	xY7eqlwEwNNUdE6jieXGRIW1veT9M3/snCwED9wfcTZ3tlJUF0Cu3uEIX1w3c7V/z0y4smh3rQo
	EyOWB6XIKdgcV1NEa3m7yL+NacY9AXmgSQXG6RvjYvPDI3gkMKAgBT54EPULRhLGNx4wJ+qSt7z
	sLrIGoMv469ASeogvEEUXjlVWkdhaiy3NXaCfHj1Bh3dwkIxbdG/URmHVfrblKYfXsyuM+UOL7t
	5gkml3GZsjszQ=
X-Received: by 2002:a17:902:8211:b0:2b2:ed0d:3f47 with SMTP id d9443c01a7336-2b5f9fd5bf9mr231926145ad.39.1777028794151;
        Fri, 24 Apr 2026 04:06:34 -0700 (PDT)
Received: from xpc ([2400:8902:e002:de3c:3085:4d80:3614:2212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab20ae4sm276880115ad.61.2026.04.24.04.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 04:06:33 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: nathan@kernel.org
Cc: arnd@arndb.de,
	chenhuacai@kernel.org,
	chenhuacai@loongson.cn,
	guoren@kernel.org,
	jiaxun.yang@flygoat.com,
	kernel@xen0n.name,
	linux-kernel@vger.kernel.org,
	lixuefeng@loongson.cn,
	loongarch@lists.linux.dev,
	WANG Rui <r@hev.cc>
Subject: Re: [PATCH V4 14/14] LoongArch: Adjust build infrastructure for 32BIT/64BIT
Date: Fri, 24 Apr 2026 19:06:23 +0800
Message-ID: <20260424110624.48510-1-r@hev.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260423220647.GA3447678@ax162>
References: <20260423220647.GA3447678@ax162>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Nathan,

>> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
>> index 8d45b860fe56..47516aeea9d2 100644
>> --- a/arch/loongarch/Makefile
>> +++ b/arch/loongarch/Makefile
>...
>> @@ -62,9 +66,19 @@ ifneq ($(SUBARCH),$(ARCH))
>>    endif
>>  endif
>>  
>> +ifdef CONFIG_32BIT
>> +ifdef CONFIG_32BIT_STANDARD
>> +ld-emul			= $(32bit-emul)
>> +cflags-y		+= -march=la32v1.0 -mabi=ilp32s -mcmodel=normal
>> +else  # CONFIG_32BIT_REDUCED
>> +ld-emul			= $(32bit-emul)
>> +cflags-y		+= -march=la32rv1.0 -mabi=ilp32s -mcmodel=normal
>> +endif
>> +endif
> 
> As a result of the above problem, I see
> 
>   clang: error: ignoring '-mabi=ilp32s' as it conflicts with that implied by '-msoft-float' (lp64s) [-Werror,-Woption-ignored]
>   clang: error: ignoring '-mabi=ilp32s' as it conflicts with that implied by '-msoft-float' (lp64s) [-Werror,-Woption-ignored]
>   clang: error: ignoring '-mabi=ilp32s' as it conflicts with that implied by '-msoft-float' (lp64s) [-Werror,-Woption-ignored]
> 
> when building configurations that I expected to be 64-bit but had been
> turned into 32-bit ones with LLVM. This was also reported by the test
> robot with allnoconfig.
> 
>   https://lore.kernel.org/202604232041.ESJDwVG4-lkp@intel.com/
> 
> Maybe some change is needed on the LLVM side?

The root cause is that scripts/Makefile.clang unconditionally sets
CLANG_TARGET_FLAGS_loongarch to loongarch64-linux-gnusf.
However, Clang with --target=loongarch64 does not support a 32-bit ABI.
LLVM clearly separates loongarch32 and loongarch64 targets.

Since CLANG_TARGET_FLAGS gets initialized before CONFIG is available, the
current setup effectively assumes that a 64-bit target must also handle
a 32-bit ABI. That assumption may not hold for LLVM, which models 32-bit
and 64-bit LoongArch as separate targets.

I have a workaround patch for now, though I’d appreciate suggestions if
there’s a cleaner fix.

diff --git a/Makefile b/Makefile
index 54e1ae602000..f03ff854014a 100644
--- a/Makefile
+++ b/Makefile
@@ -725,6 +725,10 @@ CC_VERSION_TEXT = $(subst $(pound),,$(shell LC_ALL=C $(CC) --version 2>/dev/null
 RUSTC_VERSION_TEXT = $(subst $(pound),,$(shell $(RUSTC) --version 2>/dev/null))
 PAHOLE_VERSION = $(shell $(srctree)/scripts/pahole-version.sh $(PAHOLE))

+ifdef need-config
+-include $(objtree)/include/config/auto.conf
+endif
+
 ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 include $(srctree)/scripts/Makefile.clang
 endif
diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index b67636b28c35..1c4db2f6543e 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -4,7 +4,11 @@
 CLANG_TARGET_FLAGS_arm         := arm-linux-gnueabi
 CLANG_TARGET_FLAGS_arm64       := aarch64-linux-gnu
 CLANG_TARGET_FLAGS_hexagon     := hexagon-linux-musl
+ifdef CONFIG_32BIT
+CLANG_TARGET_FLAGS_loongarch   := loongarch32-linux-gnusf
+else
 CLANG_TARGET_FLAGS_loongarch   := loongarch64-linux-gnusf
+endif
 CLANG_TARGET_FLAGS_m68k                := m68k-linux-gnu
 CLANG_TARGET_FLAGS_mips                := mipsel-linux-gnu
 CLANG_TARGET_FLAGS_powerpc     := powerpc64le-linux-gnu

--
Thanks,
Rui
