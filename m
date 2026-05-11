Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3D03DA7E5
	for <loongarch@lists.linux.dev>; Mon, 11 May 2026 10:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496408; cv=none; b=BIihl7wEBJdkWeZ6cs1AG+ypyUcHEDpDb3Diw1so7cU0KjwsakVRfg+Ntl5V/oRHmzmmSJJzIYvfa3Zxe1S1xRJEEOqvBzipbvv8qDRKXJ9FUfICoQ36nurjQFW6ZMF6uBlF1CKHsXSOJtApRxS6LeDVhgh8Vr5Y/DkW7nu3nuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496408; c=relaxed/simple;
	bh=4SXmfcgX9Xc7X+ECU2pGHF0IxLYkgbYx4JOLZXPQsjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fsADssUIhMy0xeHJ02qWmQywMcJoMPT+YSFW5xpRu9DFC4oaAXu582oOLdg6Xj8ip2NTVvbkcNgo+PIXZbwiU8v+I7nmBi4XzAjec4RR17HnwT3pyfMYPeeIaVVeptoW3MmDE5TB3NapJdhBw5AKPbb4TAOQSCMQ6gTdZlmFTl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=pE71mqUz; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="pE71mqUz"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c798fc1a28cso1759674a12.3
        for <loongarch@lists.linux.dev>; Mon, 11 May 2026 03:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1778496406; x=1779101206; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGeGGvDHlwPJP9DOo96cEsEK7mSKv8XkYQ47F+mLwRA=;
        b=pE71mqUzvokw1GF4vFhOVfNMezF9KuHfXhdQsuQlINfqQ3vc4GCshnrmvLb5Rr1MMg
         sBnWuPOoXtQTzcy1Se2x6wVt4NTASR7kSynATJzRXE6mK354jRWtHQkQEEBhtAtOyr9S
         bCNNPfNeLdBEx9hKPZ+qpWjwzhW+NG39SoqeCNeY7drhiQYGgoervrdAOn1Fh8thlH/n
         4koEAJMDnLjw1MuHXD05JA7lgt4LJjesIRKAty/t5dYyZ+22lGcHfzaaIoX5GSU/HD9W
         qV15mViEPUKBqch+rJ//KUVTvD2VpsH/jcOqDcYr0n16QUoNdFBkS9ZUlvCX4bc7lyuJ
         TpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496406; x=1779101206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KGeGGvDHlwPJP9DOo96cEsEK7mSKv8XkYQ47F+mLwRA=;
        b=S6xU5JX95zxSmTkF1ENei7ZyMH9+aqPOKtOGiJXOzh8ILbNICv5nAYjCroSHLZgbDL
         nYFhWjF0CQPteqkkvu9q76gcCHFlt5i/LBsz4nuKmfC+lhuioNmkHhYAefMaMPi2kINk
         bSGtOtrVwCiiMuHwJXp6ayb8rRhVQNWn/DOYa7jR0PtqVUuLOlfnw60qr/RWvkh/XGH2
         T3WaJryL5X2+UUeUSKlwF5Gd+HGXNPJPt1PkpmkE6KUnIXVQjJQP/rP8QtYg7Yb2JbhE
         cGF7Gcarmt2T/Q3HJ+10sR0O4fz6xoWHej0SsyA+r2DcFwbpbuvb61+/SwRWnIFmv1MW
         Mm3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+OPaF3le89XdW7VYM8RZjogpVcrb952rsKOmHLFnIK+LGjcnLdkuuGWT8rMhLeBJxxd8bjK6PMyxk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+z1h2xPjF0olftQGuc7u/YR5fc+OcdWLZQP89i3lp0lAJugWU
	Lb4Ap0S/su0NmvKkuYHlcgEDymN5z3Gzen4b3oKvej3bHrQ/eq9wM2CxrBFLqctcZe4=
X-Gm-Gg: Acq92OEg/aKcaeNf4RREIw7PZ7jngzqymu069ssDanYunz+VuweZ4Gi5kly/1L3maZ+
	HNKrvuDdTdc6tEkF1Q/ywxbpugtN4KFU2VrDYaTXqBbKl8da5HbppBI31Jdb4l7RJjfrgytJLXs
	UsYUNasmE+7sIIQaC+LdtuZC0H3YvG3Cru+PJHr+0ZnKsdth8OOnwJHTIUsZ4W4NRYOUx5PzV7V
	ZDuJQy8M3NS4auu9F1kx1zS/KEkQc0pz1sxruWtqqsdTNIiTzuSD7kCvlpJ8+qD98H74N1684E3
	1InFrEGasZXNj1pAV1Qml+MQOVtj5CiUGZnIDkluDw4VLUewBImsgx9xtuZZm7jZwmw+Tv0puiv
	/pefezkpM0DFnlWsrKBIxuBoWVMZJVspoMZ0uyXgUzZomJ/jLnPTUTlZAd7YBRqTa6+fu0qKGiN
	b5XSCeHJBg
X-Received: by 2002:a05:6a21:3390:b0:39f:94cb:1bc with SMTP id adf61e73a8af0-3aa5a901f0amr27108324637.1.1778496406048;
        Mon, 11 May 2026 03:46:46 -0700 (PDT)
Received: from localhost ([2400:8902:e002:de3f:344e:4435:2c77:3920])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c861esm24927599b3a.30.2026.05.11.03.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:46:45 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Huacai Chen <chenhuacai@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Haiyong Sun <sunhaiyong@loongson.cn>,
	Lisa Robinson <lisa@bytefly.space>,
	loongarch@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WANG Rui <r@hev.cc>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v5 3/3] LoongArch: Avoid initrd overlap during kernel relocation
Date: Mon, 11 May 2026 18:45:55 +0800
Message-ID: <20260511104555.196270-4-r@hev.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511104555.196270-1-r@hev.cc>
References: <20260511104555.196270-1-r@hev.cc>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Validate the relocation address against the initrd region specified via
"initrd=" or "initrdmem=" on the command line. Reject relocation targets
that overlap the initrd to prevent memory corruption during early boot.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Co-authored-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: WANG Rui <r@hev.cc>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/relocate.c | 38 ++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/loongarch/kernel/relocate.c b/arch/loongarch/kernel/relocate.c
index 0a045964fad5..4b61a9632a98 100644
--- a/arch/loongarch/kernel/relocate.c
+++ b/arch/loongarch/kernel/relocate.c
@@ -222,14 +222,52 @@ static inline void __init *determine_relocation_address(void)
 	return RELOCATED_KASLR(destination);
 }
 
+static unsigned long __init determine_initrd_address(unsigned long *size)
+{
+	unsigned long start = 0;
+	unsigned long key_length;
+	char *p, *endp, *key = "initrd=";
+
+	key_length = strlen(key);
+	p = strstr(boot_command_line, key);
+
+	if (!p) {
+		key = "initrdmem=";
+		key_length = strlen(key);
+		p = strstr(boot_command_line, key);
+	}
+
+	if (p == boot_command_line || (p > boot_command_line && *(p - 1) == ' ')) {
+		p += key_length;
+		start = memparse(p, &endp);
+		if (*endp == ',')
+			*size = memparse(endp + 1, NULL);
+	}
+
+	return start;
+}
+
 static inline int __init relocation_addr_valid(void *location_new)
 {
+	unsigned long kernel_start, kernel_size;
+	unsigned long initrd_start, initrd_size = 0;
+
 	if ((unsigned long)location_new & 0x00000ffff)
 		return 0; /* Inappropriately aligned new location */
 
 	if ((unsigned long)location_new < (unsigned long)_end)
 		return 0; /* New location overlaps original kernel */
 
+	initrd_start = determine_initrd_address(&initrd_size);
+	if (initrd_start && initrd_size) {
+		kernel_start = PHYSADDR(location_new);
+		kernel_size = (unsigned long)_end - (unsigned long)_text;
+
+		if (kernel_start < (initrd_start + initrd_size) &&
+			initrd_start < (kernel_start + kernel_size))
+			return 0; /* initrd/initramfs overlaps kernel */
+	}
+
 	return 1;
 }
 #endif
-- 
2.54.0

