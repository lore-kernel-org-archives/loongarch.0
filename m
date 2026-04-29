Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAD33F54B8
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 12:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777464227; cv=none; b=UeC7WmVOVekCd56UkkCiwW+Ch1+ko8cZm+sXO7aubNkmkY0c9EeVSh0Je1wNHJ6QBvngPXVL5TrmuDhXH+HTYBpBHIO83Dq1W34JgZgKadIaSt7tsyN3apVSvT1NH/8sLHzjvUeuasLJVQAYYzdwGdbCp9KrdHEi86pWlSutI0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777464227; c=relaxed/simple;
	bh=a34ACn1Sgal11ZBxSg+Hb4pRuQubJyFhjmNMgVieRzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aQqTSqT/06ksWeoNA0x9UI4hA5WrNMbds0Y21YuAn1LTPbDCk2I56DEA+qwyDZsnmI6tEmnLqGb8JpKnkaQUGD3j0P8t/OAMHCio+Y8mrvqBR3iAPUAovtsVRyfU3kca8DQO7J9WGyy4r3PG032pskGvLmdqV5cpi/e+WJMKuy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=kV2GoCDr; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="kV2GoCDr"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82418b0178cso7531790b3a.1
        for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 05:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777464226; x=1778069026; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUMOs2k5LZ6uSx/H9Ms2dy+Y0TfQtSGfCzkhnixfHJw=;
        b=kV2GoCDrX5bnclKLH3BgpX4iKBVdr3jI8qDrQPV+7p0/gDucTpk0mdPBbbKDt8CraT
         fFxVNgTIIKOPQH12Z0hXY/L0MIh5bNKAx7c5XYAsK064GbPkOkXRkfOv4Zj45ryDzygX
         vK59WrqzCNWrLdzNyoUyD746PlaV7yQPIc+zeiDwMT6WDCDwkSTNJf4BU3hJKgYLlk30
         z4mrLDN5sEQyt0ccRrIbPQVTQgjpmfv7m5F/mwlCdchxiU5h0+7JE+l1s8sptQmQP+QB
         vjPnza8q5nKVAMRhPAfeQJRdomgEyp7+6ujmqByUexv0WIe1LqRkc5NdhCQ9ofgIFgjF
         fHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777464226; x=1778069026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gUMOs2k5LZ6uSx/H9Ms2dy+Y0TfQtSGfCzkhnixfHJw=;
        b=bOUpV1026EbgS0AJHKvN6L2wp6s9SoTZrGXpcfeLAt/Ie8+OpNXnAPS1rwMEv1AeZL
         SMOpsVk8nbV3Ht/gk2U9O7ms3VtUTAFs53uJXhhGuqt8OQSZ6Inut9KsO5n37edznXoU
         bWcd8r2a7ME2EIhl9mlrzmlLSfFizVQj61kQ4Kzcsh3KbCQjwGwyiglnqkZt7rQIfixQ
         tbBuLo21GcdCnu9QgBT/2wFwcS7cKaLjabScD4CXoKjQ7eGGJYdP1J4o5a4jzhyrcG2f
         4TU1VtPA7VIkaFT+L1XldKaglqdWP0JX50K7cELYXdVCnyrUqb0R5jc1fuWAFjEOxxbD
         hZzQ==
X-Forwarded-Encrypted: i=1; AFNElJ8sIONdagCIlIdRrxDzX8QOwi8eVtA+HwOOEXzU3c612S3rIMvTHfgEi0yGUy/OP/WmfWriQnEruvg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8JIZm5vc4CJJXPzgOurOX2P2eAFCTZLlaZp1wdpoFLRk0zvJI
	pFPKM4w5MkFv8k40WYjzGYgn5o7gRIEK/Qtdo39ziUFirNazuGfiqQwuxVlHGEbmp5A=
X-Gm-Gg: AeBDieuoUUzA6LRlomKZUpZobLYkIPnG2GXhf1hjy3YZ5ZK/gFL/DQ3byoe1SXacnTl
	geC5vouaCCn/7TJ8IJ/LFh5R8EAmKKlIoYCloqiU0QxGYNfOjcp/SmIvQKYqukFDFjF/c9ES2PK
	50o2ZMibJjiwuwnZiCAuxdyRInyYASChwNYrYorNS4tzLxdxhhGdlA62UjDpcOgS5rhw8NLbGOn
	gebTNErWBwWwb4HyXGz+1mwPRlQ8hrEV18mutwliLn8ZENTHA6y8OTgGXxXhAVpNpNLE1nhyJw7
	n+FZwCoFLwW2RJCRENQnGCCoUEdfGsMFSwan6PE9IM0zzh8Y9wVehGqpRwggEngc+vQl/eAhfhj
	o3FseLOV5/JHr+6nmNmTaVrMKGbxSbigCQsr1gLMAVDKsRnRrh3q/bq/KLVbxO2ufRGGBdSkTNT
	on7i+/WIuIbcaV1JKnOg==
X-Received: by 2002:a05:6a00:2999:b0:834:e15a:19f7 with SMTP id d2e1a72fcca58-834ea68c89amr3427366b3a.44.1777464225343;
        Wed, 29 Apr 2026 05:03:45 -0700 (PDT)
Received: from localhost ([2400:8902:e002:de33:3dbd:69cf:4a22:309])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5efaaasm2016493b3a.27.2026.04.29.05.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:03:44 -0700 (PDT)
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
	WANG Rui <r@hev.cc>
Subject: [PATCH v4 3/3] LoongArch: Avoid initrd overlap during kernel relocation
Date: Wed, 29 Apr 2026 20:03:00 +0800
Message-ID: <20260429120300.1786210-4-r@hev.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429120300.1786210-1-r@hev.cc>
References: <20260429120300.1786210-1-r@hev.cc>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Validate the relocation address against the initrd region specified
via "initrd=" or "initrdmem=" on the command line. Reject relocation
targets that overlap the initrd to prevent memory corruption during
early boot.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: WANG Rui <r@hev.cc>
---
 arch/loongarch/kernel/relocate.c | 45 ++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/loongarch/kernel/relocate.c b/arch/loongarch/kernel/relocate.c
index c36604a81d08..721b982f194b 100644
--- a/arch/loongarch/kernel/relocate.c
+++ b/arch/loongarch/kernel/relocate.c
@@ -214,14 +214,59 @@ static inline void __init *determine_relocation_address(void)
 	return RELOCATED_KASLR(destination);
 }
 
+static unsigned long __init determine_initrd_address(unsigned long *size)
+{
+	unsigned long start = 0;
+	unsigned long key_length;
+	const char *key;
+	char *p;
+
+	key = "initrd=";
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
+		char *endp;
+
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
+	unsigned long initrd_start;
+	unsigned long initrd_size = 0;
+
 	if ((unsigned long)location_new & 0x00000ffff)
 		return 0; /* Inappropriately aligned new location */
 
 	if ((unsigned long)location_new < (unsigned long)_end)
 		return 0; /* New location overlaps original kernel */
 
+	initrd_start = determine_initrd_address(&initrd_size);
+	if (initrd_start && initrd_size) {
+		unsigned long kernel_start;
+		unsigned long kernel_size;
+
+		kernel_start = PHYSADDR(location_new);
+		kernel_size = (unsigned long)_end - (unsigned long)_text;
+
+		if (kernel_start < (initrd_start + initrd_size) &&
+			initrd_start < (kernel_start + kernel_size))
+			return 0; /* Initrd overlaps kernel */
+	}
+
 	return 1;
 }
 #endif
-- 
2.54.0

