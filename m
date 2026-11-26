Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708233;
	b=WxEnt8YZRjTjkYmzlW6VdePBt24F4b8SlqomsXSBeetR+jXcJB50EphmolQcOwUyZ5rK
	 yDcj3/IEv98nu0bO9H6zN+3vfwjlc0AO10v3QE5dsxg/8ixvnFsV168M9fiQRg4UpoyPb
	 rJO5s+W1VcZsJH5XsdMjkL8b+AUyp94agPl08H3z1dMOBd+vIkoGyfWmqcEummjEKIbgi
	 W641oSBkTaMbsAmA75b6xXOx23L0YUOT8Oxg+hf+QmIW3JBKsqu+Arb721QS/0OMCM3oO
	 UkisjrFj8etuWF0zTHHQVvC2I4udyyZi/HVXp4evb7zMlDzSigNa+/aKIjG5f6zUOwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Developer-Key:X-Developer-Signature:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=z4dyIj8lQ1FXo9z1autS4mIIcUIyGZfOl4YwmKn/wug=;
	b=Enq1nzZrSwkKimnJ99799jNtAYVGR2ARm6rDvq/lbNQoCkMv/ax0VtNZlz38Rk84r+0p
	 R7BCqvx35y1Epsa3Np3PC2Lboc8/yt75c1Apv6BjWmHyYRczDFJn+uopY7mb4csuBXUAZ
	 ijSz5ZTrM+V9UGhrRM8buL1ITCUi+KLMc2aZJTVPmIa9TKGGFFaFSMy8LfLcjNqMPaFnh
	 HVCNQjHcFw4kF2UYOOla46Ff/VztxIP9XVlZIouCkG6cGheK6jTJcFyqNXp3XjkF1C42v
	 C40m1YwkR2QiSnjFNex7tlIJonZbXf5hLM1l+Zq18X9IqGHLCMpBo3L4gBJ+x3sfG6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DMCm+i5K;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08131606A31C
	for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 15:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08131606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DMCm+i5K
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4bb64c99bb8so58880395e9.1
        for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 07:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795708231; x=1796313031; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z4dyIj8lQ1FXo9z1autS4mIIcUIyGZfOl4YwmKn/wug=;
        b=DMCm+i5KlKmwoOcbkZgreWMsKiCDpkr8gv25ZI1kwM6E/t7/Jyluen8zctRhXzJ6Ac
         o1kbD3Eq/zpoHw0SvgkRgaGM7dZPoVgmUgfHi5WJ1DWK6reV38efGPUe4Bt61gNn7YsI
         v8Xe7bHWxa2BMuQS1KvH3iqZmS+zGu1zyc2m1kyloVfQTswlqMDXmMdUqTKmcw8PjpjJ
         EpVhUycDCCH85hGonuXLkq/8ihEYDbEUGxtvg6OeofEOIDPOua8nCueGGpetnCuBbJlK
         czSknzCLUEO2da9qBeTlFEsw5/A/wEvvsMdCy2tg64Oa7pSE7+CiNNKEqN2cDp73iw4X
         1LQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708231; x=1796313031;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z4dyIj8lQ1FXo9z1autS4mIIcUIyGZfOl4YwmKn/wug=;
        b=s1dZWVFSWbtcoCEf5zIEvSH5rjUVqOasUWJgRAxFOBXATM5FM+unS9+QjaRr5OEiyN
         afLHSYGAmCnBBqzTeS1BIKcdN1LgBkGMzGEcimq6bXvQoZTUbnvCt/ZT27uF/odq5l3W
         ytmsg+oPjy6fD+qNVdwe54cdZ/xEX7fMHg39kl5q/hMWYriiIExFOjTJ4YwlFa6icXWH
         cwa+mnytwJD135RKDIESh+dUQk4WUPXCjpSuCmOWA1hQ8tO8xGq1b544J9MjP19lWb8T
         d73IVqJntHe+4i1nb0LIklYowcIA+G7qF/4KgqESu4wu5r+nqpfNZUCfGHr2xhLEU9Q8
         B2cg==
X-Gm-Message-State: APuU4Z8gnDEd+o5cEciporEd5PsnaJxrcv9j08nBPz8sqO/rzh8OVTxY
	iePD1pYuYUaNQaY1CJk4xLPEzlk1V4NIaUbmQyqJc43FT/4POuNNemafNtaXNTOkKGbdD+SO9g=
	=
X-Received: from wmbh9.prod.google.com ([2002:a05:600c:a109:b0:4ae:2747:b6c5])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3f0a:b0:4a5:75d2:c104
 with SMTP id 5b1f17b1804b1-4bb8880cde7mr417033825e9.22.1795708231180; Thu, 26
 Nov 2026 07:50:31 -0800 (PST)
Date: Thu, 26 Nov 2026 16:50:21 +0100
In-Reply-To: <20261126155017.2401147-5-ardb+git@google.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261126155017.2401147-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1662; i=ardb@kernel.org;
 h=from:subject; bh=tUTiqC5KpzNWid0nLDW0ngCatAa0zIED+GzI+E9BPdQ=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZsj1I5drriv+I8Dp7GR7CMf1zvVEp4Xw+VfNJzc8fDR1
 TCdXWkdpSwMYlwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCIMZQz/XXp271E8x8fIF13C
 NbHrtePU1VaucVpdd21/rzFr7elQYWR4FvKxKs3xEt/neXtv+3if/3/xr7f4i+n3MucdY+f0fLK WFQA=
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126155017.2401147-8-ardb+git@google.com>
Subject: [PATCH 3/3] efi/libstub: Provide library helpers only where needed
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: loongarch@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>, 
	Dmitry Antipov <dmantipov@yandex.ru>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Now that dead stub code is being eliminated by the linker, the only
remaining user of the 64-bit left shift and clz/ctz helper routines is
ZSTD compression, and only in some cases:

- the 64-bit left shift is only needed on 32-bit architectures
- the clz/ctz helper is needed on all RISC-V and 32-bit reduced
  LoongArch

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/Makefile | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index 20b5b77956d1..ba6d67e5cd78 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -98,14 +98,15 @@ CFLAGS_arm32-stub.o		:= -DTEXT_OFFSET=$(TEXT_OFFSET)
 
 zboot-obj-y			:= zboot-decompress-gzip.o
 CFLAGS_zboot-decompress-gzip.o	+= -I$(srctree)/lib/zlib_inflate
-zboot-obj-$(CONFIG_KERNEL_ZSTD)	:= zboot-decompress-zstd.o lib-xxhash.o
+
+zstd-obj-$(CONFIG_32BIT)	:= lib-ashldi3.o
+zstd-obj-$(CONFIG_RISCV)	+= lib-clz_ctz.o
+zstd-obj-$(CONFIG_32BIT_REDUCED) += lib-clz_ctz.o # loongarch
+zboot-obj-$(CONFIG_KERNEL_ZSTD)	:= zboot-decompress-zstd.o lib-xxhash.o \
+				   $(zstd-obj-y)
 CFLAGS_zboot-decompress-zstd.o	+= -I$(srctree)/lib/zstd
 
-zboot-riscv-obj-$(CONFIG_32BIT)	:= lib-ashldi3.o lib-lshrdi3.o
-zboot-obj-$(CONFIG_RISCV)	+= lib-clz_ctz.o $(zboot-riscv-obj-y)
-zboot-obj-$(CONFIG_LOONGARCH)	+= lib-clz_ctz.o
 lib-$(CONFIG_EFI_ZBOOT)		+= zboot.o $(zboot-obj-y)
-
 lib-$(CONFIG_UNACCEPTED_MEMORY) += unaccepted_memory.o bitmap.o find.o
 
 targets				:= $(lib-y)
-- 
2.56.1.839.g22a8290db9-goog

