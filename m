Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01BD3D9DCE
	for <loongarch@lists.linux.dev>; Mon, 11 May 2026 10:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496405; cv=none; b=pnxG1U2Y+dV9u+/6TAIToGBlfNC2FURDck0yiONXJizD9st3tScSv+Rk22peHvyMrP09oVS7enoYm7PgRspptT/KM6ciyZ0N+tJPd3Sa874wwvg4Re+aBNhE9cc7lnp14r9cbkqDHn7Nm7//xu8j9iZOq/S+IPjeTQJzECxIDu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496405; c=relaxed/simple;
	bh=M7SzPCM13HJKsqptckY7Oq9QwJZQzoJVaF+FfkouS7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NVPUwLFb0es5/Fu2Y6N1uheNCjTEYbiSySLphSFABTbnfi4Aujf+WI7UxTYOegxSCEZc/m/5EPBBioM26/yOQoPZTIgjeiTfA9bueMahUbadV0c0YM+snVEERqmFHHfrVKsSHXVH7tchi0qFT5xPe5UDEMER1ukHeo5jdD8uglc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=mUXXEqPx; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="mUXXEqPx"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c798fc1a28cso1759652a12.3
        for <loongarch@lists.linux.dev>; Mon, 11 May 2026 03:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1778496403; x=1779101203; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCD5tvLyAyFU8kzoBKm4CiGZmi4/Go8gChPflbMKPN8=;
        b=mUXXEqPxZ0vkhb8UaisCp42Nw2Vhtk+NRzDQxnLeyo5xb1HNQJsWyuj9FWZvDPhfdA
         dsliLQ4zSRDnn0aJ4smx6qFLlSfE6Rv+xH94FOa3De/uWlpgXrHD+Py9kluo8MmAgqtQ
         j7+zp7l3SzcensvOP35SdQDuqyRzeG6bKy3VaMOLb7w0FQdqzN1IJbQIvxYzYd41kXpP
         W1/kt1dURYYhUz8KUgz46Kpw93mZzSUe5lnubqCJoqfZuxl069RxLt+PqmnI1GWYZ78y
         5KjgX5o14VTSk8Xv+/hFRF5NdK3ErKZ0rb89tSfWGEV479sGSS0Gw3sdI0ZlOV3Hvf1a
         3f4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496403; x=1779101203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SCD5tvLyAyFU8kzoBKm4CiGZmi4/Go8gChPflbMKPN8=;
        b=WN8XhuvQg2d4tGMqbnG7E7UaoXZ+pDwcmTfb3VxLhD5+JU0oiRZccCxqQLkA8Uok4g
         U1xZnVgIZF2KtPyLnJvwNou3uIIfgc/qhMm9sjLh3Dq8b+M+Z1dxoWlcfyEkEljnVtjW
         weC78rj862fE/O6w+P3bqC7JtZIPAakZ79UIlm42WbFRHyA3A5m9h9foqIoEJBiBzAtG
         mqBwaIoTIe2JalERk3/4hiELc2Ofm8P4aE4nLtL791UKM2vdREhzsHy2HT1BbbwZhgv4
         oJVXKSYozCcZkQ+K/8wWNBavivL5zrscEjLmwTn6/hC6KL1wWF78FeoiDLMWUrSV4a3f
         RTLw==
X-Forwarded-Encrypted: i=1; AFNElJ+vdyfGiPy9iF5VfQAMh6TA2zIikyfXh/LUIVJHbN/Vx3RGneU9a6LU5Ky4ayq/gBeYKEqpYDqZPCg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyO5OXwnL0l5abqk/fK2zmQQcIZmBCHIMXtA/DHHHGvI+hDJOwn
	NzTc7Yp0u+MNFkNw6bfEx2VaHCGkGszZ2fnLlJjJD8NSk6Q2kg3XogreKmT6Q/tv5oc=
X-Gm-Gg: Acq92OEAyRabTcp/lGou8JaywoeBzLluXXwF3kxoXuF8Xt+blk+EQOWLZ+2v/BNfBKx
	ijSuTjIMHOqLn2nsFmCjTPZkRmu0qmXgd2/XkKqR/ljvL9IDz4zs4O9UuvzXd7g2JSMg8zeI5kg
	84+IshNO4Bsh+Ppkuc/gbiS82agyE1dbEz31IibYEDcfFr0TQvAqi6HMXfd2JcLABi2MWkkK573
	25xqw9g724ZY1ryCGy1bbW6ZNov8UZEV01xX4b6hk/Ry8baCBgL8+jgaqVETrrrPmXt8EsKejWz
	W1uRS2lZG/Zq8Q3BlB7FaL3wqPHL8L5yXlsGdKvNFY+zWi8wFgxfuR7G9GZHKp/PhhzHnEtR++d
	zcweyn6+j8MPnSvOnWBtd5weO+j5p9ntJgsv9GqClDlqatj0M2z858UePUWkuY5OWZh5zUhpBl0
	TlowUMFbPb
X-Received: by 2002:a05:6300:2189:b0:3ab:1680:c5d3 with SMTP id adf61e73a8af0-3ab1680c657mr3024235637.31.1778496402887;
        Mon, 11 May 2026 03:46:42 -0700 (PDT)
Received: from localhost ([2400:8902:e002:de3f:344e:4435:2c77:3920])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c861esm24927599b3a.30.2026.05.11.03.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:46:42 -0700 (PDT)
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
Subject: [PATCH v5 2/3] LoongArch: Skip relocation-time KASLR if already applied
Date: Mon, 11 May 2026 18:45:54 +0800
Message-ID: <20260511104555.196270-3-r@hev.cc>
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

When the kernel is relocated during early boot (efistub or kexec_file),
a randomized load address may has already been selected and applied. In
this case, performing KASLR again in relocate.c is unnecessary.

Note: strictly-defined KASLR means the kernel's final runtime address
has a random offset from the kernel's load address, which is implemented
in relocate.c; broadly-defined KALSR means the kernel's final runtime
address has a random offset from the kernel's link address (a.k.a.
VMLINUX_LOAD_ADDRESS), which also include the efistlub implementation,
kexec_file implementation and QEMU direct kernel boot. kaslr_disabled()
return true only means strictly-defined KASLR is disabled.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Co-authored-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: WANG Rui <r@hev.cc>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/relocate.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/loongarch/kernel/relocate.c b/arch/loongarch/kernel/relocate.c
index 16f6a9b39659..0a045964fad5 100644
--- a/arch/loongarch/kernel/relocate.c
+++ b/arch/loongarch/kernel/relocate.c
@@ -134,11 +134,23 @@ early_param("nokaslr", nokaslr);
 
 #define KASLR_DISABLED_MESSAGE "KASLR is disabled by %s in %s cmdline.\n"
 
+/*
+ * Note: strictly-defined KASLR means the kernel's final runtime address
+ * has a random offset from the kernel's load address, which is implemented
+ * in relocate.c; broadly-defined KALSR means the kernel's final runtime
+ * address has a random offset from the kernel's link address (a.k.a.
+ * VMLINUX_LOAD_ADDRESS), which also include the efistlub implementation,
+ * kexec_file implementation and QEMU direct kernel boot. kaslr_disabled()
+ * return true only means strictly-defined KASLR is disabled.
+ */
 static inline __init bool kaslr_disabled(void)
 {
 	char *str;
 	const char *builtin_cmdline = CONFIG_CMDLINE;
 
+	if (kaslr_offset())
+		return true; /* KASLR is performed during early boot. */
+
 	str = strstr(builtin_cmdline, "nokaslr");
 	if (str == builtin_cmdline || (str > builtin_cmdline && *(str - 1) == ' ')) {
 		pr_info(KASLR_DISABLED_MESSAGE, "\'nokaslr\'", "built-in");
-- 
2.54.0

