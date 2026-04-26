Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897F930498E
	for <loongarch@lists.linux.dev>; Sun, 26 Apr 2026 12:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777204981; cv=none; b=STW66okMfQ2tS1whC2SOz+u4C299TX4fJAo7TzQeCW5sWXgk2kUy2TfGV9CxOzQCe1QPN4RAkTgVR39jS03+rwrHfafrUBiXzfxcsnOqz6eFvzt1dPuChjmhMewbxL0JYXpGz24fJyhAFdHIoJonQiZOEiJdqXoo+OZZWs+usJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777204981; c=relaxed/simple;
	bh=x1m0TD4Z4bsNO+SOJ0ZCm0OpkLXRv7657OfoURIS1Mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UDE9ShlwOTdFanGR3l6nJdH9St/4SNeDyhrO5hIUK9fqIvT8vHi9DANOnomfx0jrKrJgyAM9weBSLBDAaTzOE5GMDe4d+JV9ZEOs2CvJESmdDSi+j6zZkg5nFo1cglDVFvGCLxtXo4QUAbGx8V+hRTb7njMCAi9BAih64mUxGcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=ckWAudll; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="ckWAudll"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35d99031e4eso6377996a91.1
        for <loongarch@lists.linux.dev>; Sun, 26 Apr 2026 05:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777204979; x=1777809779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/smLlR9zOWQ43zNvq5xtCfeY8/G1pmsrzt92d3svcU=;
        b=ckWAudllXXfhHkG3jnlkYQORLweBCQcFKmLwxozIKUb07QpF/aRRUrvIhcK4VKkB0G
         dLtlADYlpJx4XKzeO/9omkP/WdaWb1dDrO4aUxLmoQHmITuuYgwQqzOdznxr0j8njjr3
         dj73NzglkRySEm7gTVIfRf/OR5jqCvT7xehMggpXELXQSUuax0aUN2SK36mUoCrSZdV9
         9NEJSo7u1osmHdh7TkrXU/buzk+p6dq8GAOVXzB+i618XPbmHaXDmro5e6ctIsS81HJQ
         v15MNKF1fkrfZVCcs8ERL2kFTdlyntlkhcd/RH8ANaKraHVMshDVtf+S8omLYml6WkTw
         QYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777204979; x=1777809779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m/smLlR9zOWQ43zNvq5xtCfeY8/G1pmsrzt92d3svcU=;
        b=dO6FWcGz5Rk6OeZMl+PHOjXUQoJ26TgtjZVU/75m0tuckmDl20TEYNLnljW0d2BdHk
         28paxy8zsJBPhTp6tHiC/6OskgXkUj8ly8pPUCzDNpPVWzUoJ1Vy8V1afADTyW/dwN8Y
         7bnqtzaKJHMHw3BGW8/1urZ0jOdC4kSWkXeUDAmcfrMXS8UGFJwRFVw+poF8zK4FaW7A
         RhFxtMv163a0IuO2eCG3J78Fh0jy4dqI9tNxgb6Fpdlu9vQx2GDuEH1/8W8gqBmqul4F
         QFzovNAW7zrJPWnXChldpAEK3Bc0IsnQXtCpMiLlFvX26oz6YYjhqzjEo317XGDyllKX
         l+Pw==
X-Forwarded-Encrypted: i=1; AFNElJ/MMUERncrxducOWg603IEvRJ9cYvC/z6V79xKW7ZGl3jekeRF59U9AggWYGMYdgOfzXiNvRBiJ+Ew=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1TtcbJ8kozME2tAMCoZFP254qCd07Yjfj0+4AWEMz9P79YTyB
	23MBHPxHMECWACGjFe9iF/tf9EyDgaylC6h6SBSn8Z7MG28SjvSNcmaxhyMM5cHYpzw=
X-Gm-Gg: AeBDietZETGn6d29t/jRX4/dxqFzHRwG/wwu/soy9gyEkc52rQreIRI2rizDz/js9z9
	vAJHfU35K7/15QitdPoVrrMtL7J8BRKw4FMD+HkceyTsHJaNXu8jGH7XJYxhOD4n5vHnJg1xRHE
	IA3jJETM572aShbp/ex9UIEFPPzAs/0+GBOrcCNsQex+lmmbLD28vrxBskqegCVOfCCVKoaDul4
	h567NZW40s6K3hIN/sJy7E1XcZXj5kIyhfWU0RLldgZgHQzl5WJnDcGlAHo9dLfS2G/6qOCDJLI
	D7MyyRhhBRlPgbN1CxXtcJe052ZmlCLVK584ziarvtgmDH76cICY8TvfcDIu03l54GCX0C06ckS
	LeeMAUkS3itxjE5PL/GlcLXsjWysZlAXub+tmsKVoQF0UFuiF+Q6+asuddA40zXxAPd+F0RYax9
	u3iai6DjQsCfi940CNolg=
X-Received: by 2002:a17:90b:4e85:b0:35f:bf23:bd78 with SMTP id 98e67ed59e1d1-36140461d2dmr39745018a91.16.1777204978741;
        Sun, 26 Apr 2026 05:02:58 -0700 (PDT)
Received: from localhost ([2400:8902:e002:de3c:3085:4d80:3614:2212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab297c8sm263413965ad.67.2026.04.26.05.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 05:02:58 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Huacai Chen <chenhuacai@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	loongarch@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WANG Rui <r@hev.cc>
Subject: [RFC PATCH 3/3] LoongArch: Remove KASLR handling from relocate_kernel
Date: Sun, 26 Apr 2026 20:02:31 +0800
Message-ID: <20260426120231.532644-4-r@hev.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426120231.532644-1-r@hev.cc>
References: <20260426120231.532644-1-r@hev.cc>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With KASLR address selection handled earlier in the boot flow, the
in-kernel relocation logic is no longer needed.

Remove the code that determines a randomized relocation address and
copies the kernel image at runtime. relocate_kernel() is simplified
to apply relocation fixups only, and its return type is updated to
void since no offset is returned anymore.

Signed-off-by: WANG Rui <r@hev.cc>
---
 arch/loongarch/include/asm/setup.h |   2 +-
 arch/loongarch/kernel/head.S       |  12 --
 arch/loongarch/kernel/relocate.c   | 182 +----------------------------
 3 files changed, 6 insertions(+), 190 deletions(-)

diff --git a/arch/loongarch/include/asm/setup.h b/arch/loongarch/include/asm/setup.h
index f81375e5e89c..7e427484834d 100644
--- a/arch/loongarch/include/asm/setup.h
+++ b/arch/loongarch/include/asm/setup.h
@@ -42,7 +42,7 @@ extern long __relr_dyn_begin;
 extern long __relr_dyn_end;
 #endif
 
-extern unsigned long __init relocate_kernel(void);
+extern void __init relocate_kernel(void);
 
 #endif
 
diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
index 4eed7bc312a8..e134f8b084a9 100644
--- a/arch/loongarch/kernel/head.S
+++ b/arch/loongarch/kernel/head.S
@@ -84,18 +84,6 @@ SYM_CODE_START(kernel_entry)			# kernel entry point
 
 	bl		relocate_kernel
 
-#ifdef CONFIG_RANDOMIZE_BASE
-	/* Repoint the sp into the new kernel */
-	PTR_LI		sp, (_THREAD_SIZE - PT_SIZE)
-	PTR_ADD		sp, sp, tp
-	set_saved_sp	sp, t0, t1
-
-	/* Jump to the new kernel: new_pc = current_pc + random_offset */
-	pcaddi		t0, 0
-	PTR_ADD		t0, t0, a0
-	jirl		zero, t0, 0xc
-#endif /* CONFIG_RANDOMIZE_BASE */
-
 #endif /* CONFIG_RELOCATABLE */
 
 #ifdef CONFIG_KASAN
diff --git a/arch/loongarch/kernel/relocate.c b/arch/loongarch/kernel/relocate.c
index 16f6a9b39659..a9273c80a9bf 100644
--- a/arch/loongarch/kernel/relocate.c
+++ b/arch/loongarch/kernel/relocate.c
@@ -18,7 +18,6 @@
 #include <asm/setup.h>
 
 #define RELOCATED(x) ((void *)((long)x + reloc_offset))
-#define RELOCATED_KASLR(x) ((void *)((long)x + random_offset))
 
 static unsigned long reloc_offset;
 
@@ -58,13 +57,13 @@ static inline void __init relocate_relative(void)
 #endif
 }
 
-static inline void __init relocate_absolute(long random_offset)
+static inline void __init relocate_absolute(void)
 {
 	void *begin, *end;
 	struct rela_la_abs *p;
 
-	begin = RELOCATED_KASLR(&__la_abs_begin);
-	end   = RELOCATED_KASLR(&__la_abs_end);
+	begin = &__la_abs_begin;
+	end   = &__la_abs_end;
 
 	for (p = begin; (void *)p < end; p++) {
 		long v = p->symvalue;
@@ -90,190 +89,19 @@ static inline void __init relocate_absolute(long random_offset)
 	}
 }
 
-#ifdef CONFIG_RANDOMIZE_BASE
-static inline __init unsigned long rotate_xor(unsigned long hash,
-					      const void *area, size_t size)
+void __init relocate_kernel(void)
 {
-	size_t i, diff;
-	const typeof(hash) *ptr = PTR_ALIGN(area, sizeof(hash));
-
-	diff = (void *)ptr - area;
-	if (size < diff + sizeof(hash))
-		return hash;
-
-	size = ALIGN_DOWN(size - diff, sizeof(hash));
-
-	for (i = 0; i < size / sizeof(hash); i++) {
-		/* Rotate by odd number of bits and XOR. */
-		hash = (hash << ((sizeof(hash) * 8) - 7)) | (hash >> 7);
-		hash ^= ptr[i];
-	}
-
-	return hash;
-}
-
-static inline __init unsigned long get_random_boot(void)
-{
-	unsigned long hash = 0;
-	unsigned long entropy = random_get_entropy();
-
-	/* Attempt to create a simple but unpredictable starting entropy. */
-	hash = rotate_xor(hash, linux_banner, strlen(linux_banner));
-
-	/* Add in any runtime entropy we can get */
-	hash = rotate_xor(hash, &entropy, sizeof(entropy));
-
-	return hash;
-}
-
-static int __init nokaslr(char *p)
-{
-	return 0; /* Just silence the boot warning */
-}
-early_param("nokaslr", nokaslr);
-
-#define KASLR_DISABLED_MESSAGE "KASLR is disabled by %s in %s cmdline.\n"
-
-static inline __init bool kaslr_disabled(void)
-{
-	char *str;
-	const char *builtin_cmdline = CONFIG_CMDLINE;
-
-	str = strstr(builtin_cmdline, "nokaslr");
-	if (str == builtin_cmdline || (str > builtin_cmdline && *(str - 1) == ' ')) {
-		pr_info(KASLR_DISABLED_MESSAGE, "\'nokaslr\'", "built-in");
-		return true;
-	}
-
-	str = strstr(boot_command_line, "nokaslr");
-	if (str == boot_command_line || (str > boot_command_line && *(str - 1) == ' ')) {
-		pr_info(KASLR_DISABLED_MESSAGE, "\'nokaslr\'", "bootloader");
-		return true;
-	}
-
-#ifdef CONFIG_HIBERNATION
-	str = strstr(builtin_cmdline, "nohibernate");
-	if (str == builtin_cmdline || (str > builtin_cmdline && *(str - 1) == ' '))
-		return false;
-
-	str = strstr(boot_command_line, "nohibernate");
-	if (str == boot_command_line || (str > boot_command_line && *(str - 1) == ' '))
-		return false;
-
-	str = strstr(builtin_cmdline, "noresume");
-	if (str == builtin_cmdline || (str > builtin_cmdline && *(str - 1) == ' '))
-		return false;
-
-	str = strstr(boot_command_line, "noresume");
-	if (str == boot_command_line || (str > boot_command_line && *(str - 1) == ' '))
-		return false;
-
-	str = strstr(builtin_cmdline, "resume=");
-	if (str == builtin_cmdline || (str > builtin_cmdline && *(str - 1) == ' ')) {
-		pr_info(KASLR_DISABLED_MESSAGE, "\'resume=\'", "built-in");
-		return true;
-	}
-
-	str = strstr(boot_command_line, "resume=");
-	if (str == boot_command_line || (str > boot_command_line && *(str - 1) == ' ')) {
-		pr_info(KASLR_DISABLED_MESSAGE, "\'resume=\'", "bootloader");
-		return true;
-	}
-#endif
-
-	str = strstr(boot_command_line, "kexec_file");
-	if (str == boot_command_line || (str > boot_command_line && *(str - 1) == ' ')) {
-		pr_info(KASLR_DISABLED_MESSAGE, "\'kexec_file\'", "bootloader");
-		return true;
-	}
-
-	return false;
-}
-
-/* Choose a new address for the kernel */
-static inline void __init *determine_relocation_address(void)
-{
-	unsigned long kernel_length;
-	unsigned long random_offset;
-	void *destination = _text;
-
-	if (kaslr_disabled())
-		return destination;
-
-	kernel_length = (unsigned long)_end - (unsigned long)_text;
-
-	random_offset = get_random_boot() << 16;
-	random_offset &= (CONFIG_RANDOMIZE_BASE_MAX_OFFSET - 1);
-	if (random_offset < kernel_length)
-		random_offset += ALIGN(kernel_length, 0xffff);
-
-	return RELOCATED_KASLR(destination);
-}
-
-static inline int __init relocation_addr_valid(void *location_new)
-{
-	if ((unsigned long)location_new & 0x00000ffff)
-		return 0; /* Inappropriately aligned new location */
-
-	if ((unsigned long)location_new < (unsigned long)_end)
-		return 0; /* New location overlaps original kernel */
-
-	return 1;
-}
-#endif
-
-static inline void __init update_reloc_offset(unsigned long *addr, long random_offset)
-{
-	unsigned long *new_addr = (unsigned long *)RELOCATED_KASLR(addr);
-
-	*new_addr = (unsigned long)reloc_offset;
-}
-
-unsigned long __init relocate_kernel(void)
-{
-	unsigned long kernel_length;
-	unsigned long random_offset = 0;
-	void *location_new = _text; /* Default to original kernel start */
 	char *cmdline = early_memremap_ro(fw_arg1, COMMAND_LINE_SIZE); /* Boot command line is passed in fw_arg1 */
 
 	strscpy(boot_command_line, cmdline, COMMAND_LINE_SIZE);
 
-#ifdef CONFIG_RANDOMIZE_BASE
-	location_new = determine_relocation_address();
-
-	/* Sanity check relocation address */
-	if (relocation_addr_valid(location_new))
-		random_offset = (unsigned long)location_new - (unsigned long)(_text);
-#endif
 	reloc_offset = (unsigned long)_text - VMLINUX_LOAD_ADDRESS;
 	early_memunmap(cmdline, COMMAND_LINE_SIZE);
 
-	if (random_offset) {
-		kernel_length = (unsigned long)(_end) - (unsigned long)(_text);
-
-		/* Copy the kernel to it's new location */
-		memcpy(location_new, _text, kernel_length);
-
-		/* Sync the caches ready for execution of new kernel */
-		__asm__ __volatile__ (
-			"ibar 0 \t\n"
-			"dbar 0 \t\n"
-			::: "memory");
-
-		reloc_offset += random_offset;
-
-		/* The current thread is now within the relocated kernel */
-		__current_thread_info = RELOCATED_KASLR(__current_thread_info);
-
-		update_reloc_offset(&reloc_offset, random_offset);
-	}
-
 	if (reloc_offset)
 		relocate_relative();
 
-	relocate_absolute(random_offset);
-
-	return random_offset;
+	relocate_absolute();
 }
 
 /*
-- 
2.54.0

