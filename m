Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708230;
	b=vg0YS90bx5aG2Wv/zezYUAGx8EDdrRZpAzIHgZU1KVzKu6g1pSMfia4CsarwLl/NUwMy
	 tKjKh1bXSw992sosU8fLsBkBC1mbakew6D5neUtbPEIdMdFUi5OCG9Zerevkq2XfvZVk1
	 peS4N/LrHSS0xvIgkTXnrf6+6Uv1zW4RqOqXpKbbPbTUG4VnKZZ2L+pQTv/6KDJF2pxFB
	 9+vuV5pLNVhC6ZTX0VgQyjnsQIxUx/tk/duEbwu30WCa6ObTM6KeQGUVEi3PGIQzaJZ96
	 9oaSRKlgFJbPVO8hA/1Np8yKCsRtmHra56MYID6NWffcgptiYC0WXonFSliLeb4ux8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Developer-Key:X-Developer-Signature:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=JL/cyFp2k3ubn7iKatlLArpJgvVDo1Ae4q1D5CbiC6o=;
	b=cj4NVDGNU3IIJIl2mLUOI+17Gupp1oI6pGjLbeiADsjkvcGRey+4IKH8ch5tiJGVrRv5
	 t+MDH/E5QNNPfo3mU+sOWrCBXlQSAVitT0mPQKjpA3Nx3RfvcNWD6tNLJKI+wKR5uzsJ4
	 Sq0/GXb+s+mss9Do1qPdQtomNody9Vxj9OOrzXCvJASIaC99orBFfHmobDhovTOXbfgCF
	 CTRImmk3LZStYJWBD+09EHdcrK1kkRaX5BHxRZtf5uxHzV/GEylE5IvVQHeu0jyHjmpvd
	 Frc+i6/9qjGfB/6zjlISLhAFBtaZHIX0ZJwZddq9I+ie+WGKjCRALnWKEXjua6Y1vzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ANemqPpB;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A06606A323
	for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 15:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61A06606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ANemqPpB
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a0284121c6so3688105e9.3
        for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 07:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795708229; x=1796313029; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JL/cyFp2k3ubn7iKatlLArpJgvVDo1Ae4q1D5CbiC6o=;
        b=ANemqPpBRyJUdVR6BtPb13H5lGdgPorhSNkdvjRw6FEkv5h4Fj+eyq6vd3oCtX5SrR
         wu9fEIBaEVomPzziAm0/VOFA5WtYvH6YqXuoN5fRO6qmCoLZEVstUOB2d2v+2SwESal3
         RDiJNNnf+tvt85lnU0AY7bpO3i2ZxA+009AueeK3O0tkS+tRBlSpN4orJXDXFQRatEub
         HhpXkrEEmt6noN78B0NN6DglJ90lYDSGcC/YLsoPOgcEc9+uutC/5SCKaTCGRj6e/foy
         KgjADm4tAZUxYp3vGtXP7KtIujEcmKhaxZhVEL21zu761+0X5s0Td4BF+ADfICkqvson
         0XIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708229; x=1796313029;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JL/cyFp2k3ubn7iKatlLArpJgvVDo1Ae4q1D5CbiC6o=;
        b=PDo8SM8CqZmkT7tIkGsmVdonCmaoyflv9LEiiK866gcI2vLFMBwG5M9CfLB3ETzwhC
         FA4lkgmBmH7N8QTV41W0osM9HkYi6LPyXDkq7V+ddpDJgyyBE/om1+yyncTfTAQxOzVs
         8+njseUKhhmdEocPihuiEaEMqLIRfNFEyZGk6jpwfO5pT2anuOCIXT9SEt+3nw2Lg3Cb
         DaNDgBOnSCKklb9Gq9RSQHuyg7cdX9BhFGjDu9oE7SsOhrM+r/p3t+pQqYO7Ze08UEob
         Ue1MIWlI5eY2l371fnsprsQAKPZhJzQKhOyIKF/OQ6byHwrxWKrt2ZNN3tBLogJ2aO2l
         UAog==
X-Gm-Message-State: APuU4Z985fGbBigKHavt2f293jJxfJst4mYnJPumMvxeqhpQIpsJ1uid
	lyTXBC7csvIpPoIGvvSQ8Jmh/y1b6KBd1zDTvYidQzdJX7lfNyHDAvwlZY6f5pXSNLMGO2zQaw=
	=
X-Received: from wmik14.prod.google.com ([2002:a7b:c40e:0:b0:4a7:28e5:546a])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:6510:10b0:4a1:811c:8078
 with SMTP id 5b1f17b1804b1-4bb8881de57mr297581615e9.26.1795708228774; Thu, 26
 Nov 2026 07:50:28 -0800 (PST)
Date: Thu, 26 Nov 2026 16:50:19 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467; i=ardb@kernel.org;
 h=from:subject; bh=WGbDIpMotR8/+NEIXKCfjkrF2l/j1lVds5GBCom33k0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZsj1Np9jdnphlfP+6PZipzYSsXEb4YukTr10FnoxjNhc
 b+pieYdpSwMYlwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCI10YwMHyQ+GNvJWR8tnhmZ
 VrRj1/W9Zw1kK2v2b3E1c3rS4Hj7JsP/bEvD5Y1bk4Ovm4fPUGMU1indN3fmNUPz9zNeXv24vn4 JAwA=
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126155017.2401147-6-ardb+git@google.com>
Subject: [PATCH 1/3] efi/libstub: loongarch: Provide 64-bit integer shift
 helpers for 32-bit
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: loongarch@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>, 
	Dmitry Antipov <dmantipov@yandex.ru>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The EFI stub's copy of lib/cmdline.c performs 64-bit shifts in
memparse() [which is never actually called from the stub], and so it
needs library routines when running on 32-bit CPUs that lack native
instructions for this.

The LoongArch 32-bit EFI stub build already pulls in the library helpers
that are needed for this, but only when CONFIG_EFI_ZBOOT=y, which is not
sufficient, given that the same helpers will be needed in the vmlinux
build for the builtin copy of the EFI stub.

On other architectures, the builtin copy will call vmlinux's versions of
those routines, which are exposed to the stub via aliases in the linker
script. However, on LoongArch, those are C implementations that may be
instrumented and therefore unsuitable for use in the EFI stub.

Reported-by: Dmitry Antipov <dmantipov@yandex.ru>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/20261122125352.gAcg5yLx-lkp@intel.com/
Fixes: 442082297e3d ("riscv: fix building compressed EFI image")
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index bbab12b8eb4b..ba6c9e763862 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -88,7 +88,9 @@ lib-$(CONFIG_ARM64)		+= kaslr.o arm64.o arm64-stub.o smbios.o
 lib-$(CONFIG_X86)		+= x86-stub.o smbios.o
 lib-$(CONFIG_X86_64)		+= x86-5lvl.o
 lib-$(CONFIG_RISCV)		+= kaslr.o riscv.o riscv-stub.o
-lib-$(CONFIG_LOONGARCH)		+= loongarch.o loongarch-stub.o
+lib-loongarch-$(CONFIG_32BIT)	+= lib-ashldi3.o lib-lshrdi3.o
+lib-$(CONFIG_LOONGARCH)		+= loongarch.o loongarch-stub.o \
+				   $(lib-loongarch-y)
 
 CFLAGS_arm32-stub.o		:= -DTEXT_OFFSET=$(TEXT_OFFSET)
 
@@ -99,8 +101,7 @@ CFLAGS_zboot-decompress-zstd.o	+= -I$(srctree)/lib/zstd
 
 zboot-riscv-obj-$(CONFIG_32BIT)	:= lib-ashldi3.o lib-lshrdi3.o
 zboot-obj-$(CONFIG_RISCV)	+= lib-clz_ctz.o $(zboot-riscv-obj-y)
-zboot-loongarch-obj-$(CONFIG_32BIT) := lib-ashldi3.o lib-lshrdi3.o
-zboot-obj-$(CONFIG_LOONGARCH)	+= lib-clz_ctz.o $(zboot-loongarch-obj-y)
+zboot-obj-$(CONFIG_LOONGARCH)	+= lib-clz_ctz.o
 lib-$(CONFIG_EFI_ZBOOT)		+= zboot.o $(zboot-obj-y)
 
 lib-$(CONFIG_UNACCEPTED_MEMORY) += unaccepted_memory.o bitmap.o find.o
-- 
2.56.1.839.g22a8290db9-goog

