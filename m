Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839239;
	b=azDWps1DTmhqODjGxBvQYxVJVA9YzYopZWAWOEoMvnM3OiaVntYyNr+l96d4YqzHkNpi
	 wQUw4WLjLIA4IojJcOdba9w6DK3ddS/JRyrT+3+WoXf/zLFVsbwVLifdyb+BsXeBwYRfK
	 /BHmCENED9o2XPRds+Zgf5R4f/j493ft0xzTX5dEAvP3cAp9TFuekt/Odi+0+c46AV6FC
	 HdkgL9K5sfeKNwo3gFzKUFcVdrDQ8FD8AlLWG/Rqczq67GCsvyKK2LONVLeAq0AmUaY+3
	 CpkuQA1NI/izPgtNU5gpqns0jDy0J8gtHMUo7EVjDzPTxam5ESp7AWMQc9w+AhDIKPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=5R2g9UB0W7Cq1TglUi5KIOs/VyvT4iQcIBDMlZHHNJ4=;
	b=ZYZVGEfeiJ9yuI872+nYJ2TlwxmqQRuj7Dlf/IoLEtdRDWP90M0ZnfHMSPErgKZ+gUrs
	 yadMehGZj7DHbjziReZ97TQ0tAGlIOjcknhrTr5A6qcwqbBGwcVSfJ1t1z7HeJBpOogA+
	 LTHjxpwhwaYxGUbLO4f34xMwmAGJu5DxdDqCW0nGnCZIHFa1UsBARXpU1EFJNgPe58ZYj
	 oghznbOwWmghG0LeLa+sFCv25U+bBAVKS0wQBqoNJD2t5qg3pnMPzXD29yKsxxW9JZexX
	 kD73GEQl+E87O+9+zAeFPh3SUXYGnGJXsGeCZNh6R4RisgEogw42Bds10LAIrFGAuLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Uuy+MYp1;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A202606A32C
	for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 14:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A202606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Uuy+MYp1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4915ba023d4so1590062f8f.0
        for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 06:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839237; x=1795444037; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5R2g9UB0W7Cq1TglUi5KIOs/VyvT4iQcIBDMlZHHNJ4=;
        b=Uuy+MYp136Fg4vrzI2f97NihKfAs3zMLH0ErpFpywJtFIYO9sGE4Ssl35zaaTTmhSO
         n7L9zZWHgGP8oI239uyCNzlcdjPuJH3rbjKHsdak1knDtQoiIMostqJxEaCX9I23SGzG
         r0CidASRz7EImAPWauhmEfowXbH/p83qw1t8ZqXfc+1LalMXagqfoWOaSciHMN0uEEvy
         O4Fg0uWOGaKTv+WLrTaenJ0MvPU4QJhbUaKZgiS8qRgjJovb+xeBzk3etKTAY29LlSOy
         0sgOnoS6YNxp3i7PxdC4rms/geOYcXh56jvqCQfSmQjFo13cmo6yVg3LqMWvWkBc/T8/
         BaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839237; x=1795444037;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5R2g9UB0W7Cq1TglUi5KIOs/VyvT4iQcIBDMlZHHNJ4=;
        b=u3mZFeIks3JfJlXX+afvGpZydNrjzywDrQAp9Ubh3dZVFMgBbo54xrfbi4OShUGlHh
         soy+rctJmX/sFeXhCRXc6YXJ2R7sz+lomHI5YfbYtxhj3tFpJW7xJw3VcpItkgDtPajc
         amf834UAVPchaB9rM/m7PLOaIRnMeS5lnAaXAjkNz80R8ybvna0RiBY2rc+2KKhBAQPo
         gpYDyE/pgstqUqUGoVDmDTFuvie8ylzUGhpwa9ssrnxpbpq+cMQuddFQM0zqkU6dsSc6
         zGIvp4l4Wh4VsFN60b1qYnV/alDDCtniu5wV30KT0uGm9gIfdKRQIsU1vdZlkmkxx/Y+
         u/LQ==
X-Forwarded-Encrypted: i=1; AL+hErGremMwME++NfGUYJ4uDDUGbrBrEm/R6vWUECS8L13iSwPMmxvfEaxSro7s1b2CIhDMRX1OEewklZw=@lists.linux.dev
X-Gm-Message-State: APuU4Z+UDccN2foUYArljPfTxg/A+j+07ZfvdzAiOIlLVpjVfaSsB3g7
	e8VhsrVBm86XEemU7art+e6jTqk7ecyzF/cYM1oz01dqeAwG8qcfGtxe5/+WXz9LATLO4iU0CQ=
	=
X-Received: from wrok6.prod.google.com ([2002:adf:f286:0:b0:493:d441:be7f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:584b:0:b0:490:71a7:6f51
 with SMTP id ffacd0b85a97d-49c72ba6509mr22449676f8f.45.1794839236764; Mon, 16
 Nov 2026 06:27:16 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:23 +0100
In-Reply-To: <20261116142618.1687025-17-ardb+git@google.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261116142618.1687025-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2981; i=ardb@kernel.org;
 h=from:subject; bh=8ndYJWrl5/5wY4uh6dzMJ+7YlbAJMHVUNmS0W0hi37A=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu30MSrTJ27pkw5q/E2uejHnms/n2+SWLfg1plna36U6
 s4Uyfxi1FHKwiDGxSArpsgiMPvvu52nJ0rVOs+ShZnDygQyhIGLUwAmsquFkeGL/Zr2F/FRRtFF
 3L9sW+7N3qJ1/c1Dg9yKmY+eR046/1uJkeHT1Pev7Cpzzr93SnY6G7djx68ll3oyj09f9z0v/fi 9U8cYAA==
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-21-ardb+git@google.com>
Subject: [PATCH v3 04/15] efi/riscv: Rename __init_text_end to __inittext_end
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
index 9849a3e4d102..ba939c7365b2 100644
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
2.56.0.611.g1030f0b940-goog

