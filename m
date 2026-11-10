Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313063;
	b=or0lMOebOws/uq9SXlcOOmqXucwmFEkPPoSlV3Eo8uX1OX0MhUv8pVnkkvvPiDvS7JuF
	 mYbvQ6qaevVNMK/h7iohqqv/+TbMZxBVAZeE5xYuIBOOXtgVv+hKNglJaiZZ3IodZ/YTK
	 ndFWT5dYXeZor7yTbGzIbL1YDqBqEfufUGor+uEsTc3kingZ3V8vfJ86BevbcF/buWJ70
	 25Cfh2dszmaZdIH3E5LSXd/F03c4oQ5Qy5gsAtSmRJvc34IA9wwEFky6lYWYyTlrRRkeJ
	 20d7KyddHhqGAYpiQVzxU4QVGURmlaJkdPdL4QpVCJ47InnrpMlEFq7vFHm7R7x/HSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=FKyHqeXkJfnFo2/e42CmLuZIRnayYURfHn0ko47n0QU=;
	b=sJ+5kisuH5SM9ppCoQaVxIy+WiAtr480kVzsHZfgkxAEwxywqlprrVqBoluxvmuTHWNC
	 7jF3UnxmNs40aGaEgjZpod8tkEF7P7EJX18aDa5hLw4r67kpeGX3vJ08CVlDS1z+7I9fF
	 o7CEN/sL570h0kJRzaEpGn7yOeZEpp2cZOpU22FCRirLLiIVVwhGOYUitsxqj8YcvIw6e
	 wKQNvqwRO6jYjHa1UgVTxm4AYZBJ2DgdFD41iOA8lHIWSoWstfYGwJ/o0O4mZjZUKamqA
	 YbM2/w4ZeIXlSOdKrjV0tGqmNruE8A1RsltuS5Ly7pn9fbVi3Q0sbs7GwH7SC8CQyTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TIFjpn4B;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72062606A338
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 12:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72062606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TIFjpn4B
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a0284121c6so14461845e9.3
        for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 04:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313062; x=1794917862; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FKyHqeXkJfnFo2/e42CmLuZIRnayYURfHn0ko47n0QU=;
        b=TIFjpn4BQ6sB3bwQsf0BUnbpYG+dLbnsP4mHvqEw6eu9vsnda09ZxBpiQHHJlUKcNX
         6I3bIhcOiAIWtlcYGaMyTDnSLzjOhWufTgAYgcYzxakIh247wQT5Akxeq1DWs+qQ/Q02
         f3HBerF/5zJ6+UOA7/VHTs1EvHEOI46FkHfvEM6Iza/VYqcDcd1hvWK5M5vyI2idprkp
         ao13x6OKe4mSTTxrcwAIjmk5xh4MJ31Ri9isLyM7MtNm2UvvRfkbTOogvsCInN0qED9M
         vbDFuFYdHrcHCPmNesPtBXeOhxYPmSEXuaxXJR8vGv39t9eiSuRHDxRsPdYBUeR9Eg2X
         F6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313062; x=1794917862;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKyHqeXkJfnFo2/e42CmLuZIRnayYURfHn0ko47n0QU=;
        b=EML6SJMm5+DovjIimgen5XfF8p8+UGToOfBgwB1YhWY0kVaPAOV4bcMEB9M7jt41Zi
         XKpkZogA29JTGln0L/CJKv3sDOtf8KTMey/kj+RPOBIUZxc5elDoqxz2Xlqyl6jeo8dN
         tq04Sw19RYbaeSttHi8akVJ6MvQzsybvGsuOiV3g2fr90cq4KuwylgoJG3mfazCuMG1G
         mlVzAXP7ShzuOhVbLVqQiOa3A6iysVYLEa0LsCn+lFLs2JBuyzo5/KessLB1E7vHTcMO
         tCrozAm983zQ+w35MAqT7ZTvY2Ei/FWS+8KRKK1K7kmJ37c+VIpq0DQDl0+O6+BreZX0
         knww==
X-Forwarded-Encrypted: i=1; AL+hErHqQiE8W4YxOxdmVUcxIUrvUFxOfI1LykjGok/mbu6i7OQFR5o+Ys0RwWudnoddgSrl0ULKtr8Lh/M=@lists.linux.dev
X-Gm-Message-State: APuU4Z9ZSsS1IJ2lHV+iFHgDklkSSmVsKRlQkmA4HEn5aNvilOy2YZBb
	ExzJwdz+7EawH7NZUQIocoZzZ7g15vCQ6PDLMHsONFzBg7SvHk9G9QyczM8Bzd5MX/QvckfkrQ=
	=
X-Received: from wrul8.prod.google.com ([2002:a5d:6688:0:b0:48d:edc0:5a37])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:198f:b0:4b4:49d7:bc25
 with SMTP id 5b1f17b1804b1-4ba0234a940mr39574545e9.21.1794313061406; Tue, 10
 Nov 2026 04:17:41 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:34 +0100
In-Reply-To: <20261110121731.2728824-12-ardb+git@google.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261110121731.2728824-12-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110121731.2728824-14-ardb+git@google.com>
Subject: [PATCH v2 02/10] efi/riscv: Rename __init_text_end to __inittext_end
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
index 1f4f8496941a..08ada0591f3a 100644
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
@@ -72,7 +72,7 @@ SECTIONS
 	}
 	__exittext_end = .;
 
-	__init_text_end = .;
+	__inittext_end = .;
 	. = ALIGN(SECTION_ALIGN);
 #ifdef CONFIG_EFI
 	. = ALIGN(PECOFF_SECTION_ALIGNMENT);
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
2.56.0.542.g3ef89b7020-goog

