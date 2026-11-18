Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026114;
	b=AsbaXW/ypUVLdynFP4sWowDYkv5DcOQ7Aaj34YgyAqZj8689bmzAUY3PwLXKB/I0VcLh
	 mJHtmjcO8AKVa98t4PoPV0mTyTPCpHDTNtrAwqLcilR8FMi2WtjktYshC27wUjVXBEP7b
	 ZbyxSNA75YrX61pPFQqUTj6F8ol+N5Abjo1FI69elXYpCUVr6kqX5YU6pyTmVzm0i1GVT
	 lA2LwrGqcQxOQLgiHLLzYU9nU9o/ZrJHH1QQeEczi1ueZn6fBe8LfceuoKpsNQSxs1kI4
	 ZbpMmkJjo/tz786gXjDlfzXK5hnWJYn2+pyfenFoj8jztkR0iQh5uNP73RJVQtLcWLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=W3qJpbOK0S/KfzF1LTQDOmj6a+FOLurEzqYwJRYI91E=;
	b=cbkLZlM3wETJyH5sqQTOzi6x+KtSaebbPfZ6psYStQ0iPrE775pe4Vv4pMVJyHCy9Tt6
	 BN0mCUZ5hTNYg8EoN3WAeL4jzc7cbpNfQOJrR5VSj9+TK81Oh6T6bFzNiL1/0BsPjDFqt
	 NzYieqZaHgMFntCZxIKFadawOsthnBPE1cxMOz94ur1ArWsEWsnebqxyU8O2BLK85UeEC
	 tz+76pSYIZWs3eFKMPEPmmHAxQOVK6Qt4YQYHkUf1NORkssXRWkAX5McW+29M4dxXnIEa
	 171aG1cxzySlcs4f5xC4nDbuLtXHvc0YSTwYfyzBJA3iBXjQgCjlcGUdryGXhHoSOAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FuazcBo+;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B757606A31C
	for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 18:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B757606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FuazcBo+
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4a91b174fcdso2522f8f.0
        for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 10:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026113; x=1795630913; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3qJpbOK0S/KfzF1LTQDOmj6a+FOLurEzqYwJRYI91E=;
        b=FuazcBo+D5yl2H+7RKI1qhLYrB1fMP+Su4aCSCTzXUHujDftUka9cAWChBkHYXbd/9
         LjvcnoA1zBUDytIiXhZ3yvjTd19SUpXV0k9Td1WXBwiRQ831ZXpnPe2rb7ZJtHaIMQru
         +6M2Rhabs+yOJschH/sNnNI8gM5ci5fvyegnExmZb3K5zG81oQAnwp9UV6H5pmc3+Gcq
         Cymu9wvpm+jCGtxKMBrkA/YMJ7vBlWkz2u4Hqvbw3LlepwDDJIsnc2jTLDYPkNjtG1bm
         yudiiINJQjgvF2K8z60ml4bDfIaPl5DLMM10I7Dsz0BD228b1CdP+kK9i0Hk+fv902Je
         pBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026113; x=1795630913;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W3qJpbOK0S/KfzF1LTQDOmj6a+FOLurEzqYwJRYI91E=;
        b=0b4eYRTf7mbdEb5Yj9rAzB/Dhqzk3whUhZPw4g5N1QQZ10U2cWnqYaC7GdZpvxPCBc
         SxCxxr0qEwZJg4G2nz8Ffhf/uWgIk7ssd2CgugkhbK/nL+yQxJjWv8jG+9iR6o0QI1YN
         lFu7j/FSz+yL3q3endhNFHRQlm++yKxmZFEOF5uzOTqgYnelhosAF50bLMYLYjC+DvTp
         NRff8j/3BzmGdWjDozAFGqyk1MHDg5XUNFP1/CYkkN+fCvSjXkvj7hQ64qro8naPoczt
         5aE35Pd0s6VNN/V4Hdh0DdHHjaZGH4phbJAQpTzTCog7QNmwLBaqrykTOO/gdQILaxaa
         rdnQ==
X-Forwarded-Encrypted: i=1; AL+hErHBOWVR7WPvC85muJhHMAIXkzDVmrlhAPWxfEYL/pFgAY9gvtimBB0jkbLqSKEFpj3u+IOQl0nJ+Pw=@lists.linux.dev
X-Gm-Message-State: APuU4Z/sv99CPWDmPWpP/xs3+Ojxk3M82aFXFkdNC3wTAiE5+pduMmip
	b2HSZ05GeiqtqN3znpnYKnGEESA9Vn7vcuoXjaeqQmzHdifJQy9MiBGIFB6tpfNjqDAnygRI4w=
	=
X-Received: from wrul11.prod.google.com ([2002:a5d:668b:0:b0:4a3:5c5b:309f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4310:b0:492:2b36:a149
 with SMTP id ffacd0b85a97d-4a8ee39a399mr578670f8f.25.1795026112167; Wed, 18
 Nov 2026 10:21:52 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:10 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3105; i=ardb@kernel.org;
 h=from:subject; bh=VYcmCaSIFKr4fxWSLhFh8fGld9SRwA19gzbmJfyyOk0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm+mng60ZL704seN5fuy5j+HTcq/zyR2552qw+s+Ct
 aaXv4b86ihlYRDjYpAVU2QRmP333c7TE6VqnWfJwsxhZQIZwsDFKQATaQlgZJj396zSquk9MRGb
 dkz+IGJ2SrfWan9054bMgFMBnCkejEcZGfov8D/7+szO6pHCcue/V6d7hTruuuX8qHCKxjflTRo qudwA
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-25-ardb+git@google.com>
Subject: [PATCH v4 04/19] efi/riscv: Rename __init_text_end to __inittext_end
 like other archs
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Align RISC-V with arm64, LoongArch and x86, and drop the underscore
between 'init' and 'text' in the section markers. This allows the value
to be captured by generic EFI stub code that can be shared between all
those architectures.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/riscv/include/asm/sections.h         | 2 +-
 arch/riscv/kernel/image-vars.h            | 2 +-
 arch/riscv/kernel/vmlinux.lds.S           | 4 ++--
 drivers/firmware/efi/libstub/riscv-stub.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
index a393d5035c54..4a882a28f414 100644
--- a/arch/riscv/include/asm/sections.h
+++ b/arch/riscv/include/asm/sections.h
@@ -11,7 +11,7 @@
 extern char _start[];
 extern char _start_kernel[];
 extern char __init_data_begin[], __init_data_end[];
-extern char __init_text_begin[], __init_text_end[];
+extern char __inittext_begin[], __inittext_end[];
 extern char __alt_start[], __alt_end[];
 extern char __exittext_begin[], __exittext_end[];
 
diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
index 7b44b94f1283..bf703eba3fa5 100644
--- a/arch/riscv/kernel/image-vars.h
+++ b/arch/riscv/kernel/image-vars.h
@@ -27,7 +27,7 @@ __efistub__start		= _start;
 __efistub__start_kernel		= _start_kernel;
 __efistub__end			= _end;
 __efistub__edata		= _edata;
-__efistub___init_text_end	= __init_text_end;
+__efistub___inittext_end	= __inittext_end;
 #if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
 __efistub_sysfb_primary_display	= sysfb_primary_display;
 #endif
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 9849a3e4d102..0ec1b4b55e41 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -46,7 +46,7 @@ SECTIONS
 
 	. = ALIGN(SECTION_ALIGN);
 	__init_begin = .;
-	__init_text_begin = .;
+	__inittext_begin = .;
 	.init.text : AT(ADDR(.init.text) - LOAD_OFFSET) ALIGN(SECTION_ALIGN) { \
 		_sinittext = .;						\
 		INIT_TEXT						\
@@ -72,12 +72,12 @@ SECTIONS
 	}
 	__exittext_end = .;
 
-	__init_text_end = .;
 	. = ALIGN(SECTION_ALIGN);
 #ifdef CONFIG_EFI
 	. = ALIGN(PECOFF_SECTION_ALIGNMENT);
 	__pecoff_text_end = .;
 #endif
+	__inittext_end = .;
 	/* Start of init data section */
 	__init_data_begin = .;
 	INIT_DATA_SECTION(16)
diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index 725b634c5179..5cbc50a814e1 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -34,7 +34,7 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	efi_status_t status;
 
 	kernel_size = _edata - _start;
-	kernel_codesize = __init_text_end - _start;
+	kernel_codesize = __inittext_end - _start;
 	kernel_memsize = kernel_size + (_end - _edata);
 	*image_addr = (unsigned long)_start;
 	*reserve_size = kernel_memsize;
-- 
2.56.1.708.g77570a6a1d-goog

