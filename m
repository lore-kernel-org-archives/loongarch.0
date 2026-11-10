Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313068;
	b=OTENxjzVLTLAuA7bBfZxYhZK6u0vLx0YD3016pJIt+iZ+vaIyDmvT2SJa/4kg6to2aXA
	 1v5M0daLk4zMz88tLNL4dNth4E58Nai/0DfLKF67DehHC6SjUpT5wE5V97mBZ/5fD2Dc+
	 Tnjta/ktv5ZIMTr+g1XAzGGCTmqcHHFBH1uFOm0LIHaoOUhgFuYLwyme4Kd90oC57WIGP
	 DOneB+4wB6rt3gKI+sBQnn+Cpgn8sOYeGN6ZbrseW0/1BgMAbEoEdfZLMTzZoWfEwKJV/
	 zkD0qrT2qo/rmDe5Pb3hIUWfSzvR37yLznaYJcAidwSGgReQbARdM63Xasx6jF5Mu4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=vWyWnC7FTB1F4LSiq4vWzvhtzfzrYrtPmxSukIMBSxY=;
	b=Eo+2xSwpYjE/K/2/e9gKUjpcWZqPGXxX81SIDgOecWwMFLLD9OsLADe/wKCs5LhjOcjU
	 5wbj96RpyMzcmYZ0GLs43B7jSBg75O3rdSTyKhZbmBLfdnYJaV79+7IE9l0jm0XNnxeL2
	 P25IOZ1hwzfeachIpRAhBTKWFyotTljR8FVZ611/ItWjfouBX2mgWSanvX8AXR/XjlrBv
	 SZYYtM4OGKxPjNLjil/bM4rTrpEPQyVjGVziogXqWU/yE5KCDR/4iXxxVZOiV4lGlNW6P
	 mmAAEdI8bRwfocZQchYCQMwfbNYl+Kf5Yt4uSZP1pFwmGfJIFG598d+DcILdWYKZIYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PXQEQZZJ;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACD4606A325
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 12:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EACD4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PXQEQZZJ
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a214a5f8a1so19812275e9.0
        for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 04:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313066; x=1794917866; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vWyWnC7FTB1F4LSiq4vWzvhtzfzrYrtPmxSukIMBSxY=;
        b=PXQEQZZJchmgXaOSvpfEd3pLjJm+fpgSZFX/xf6BJU2vY0kU6N2VMoQGqwpEI6352S
         hs9XjJesO7esNWdpZKWok35syn1hzJYzDf2Y9s0LPhmU7TOc1vQa1tX+nkmTnFC8WXdE
         nY++CH1ShImA/2fGTYjf/QhDjKKeYh1Sy6dgBYxJMcn0MD289TUy/tL7K+DMlUrsAmMT
         IPptltWkLf/CTuemgcvhLbKBHx3r+PNkZA+aUPo93Bv8ITYGIERItouV5LsOfnFLb7DR
         mPn9R8ZNHZIPGtGdObixFf29huzIokJdRWjUT8DTDW1X+GpSF0ltzIVc2ecD2FM24SAn
         Mruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313066; x=1794917866;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vWyWnC7FTB1F4LSiq4vWzvhtzfzrYrtPmxSukIMBSxY=;
        b=IZSMf0kbG4Huj26YLW/WSsmi/8G1WiyCBQCGlqQo2WLV0dRhFS6o5lmvLoSm+CaWLQ
         Hop2dRVIDp4fMs2zSu2tTkRSZPwBK5IXYB0tMHwJYUNV7IDI7EI6MuE1dnZueuuFb/PS
         n52q4G/k7LUln4CEUsxY5kHv48lnOJ//470CQ6ZiTOBV2CbtyzWxY1WNDpyaquA2T4AH
         Mgi4AMrIc7u/36ODDZR8FeK9KAH7bVuCBBhHoYWEB6OBh9tTMu2tXDFYl/10HI1IcMz7
         DmBY5XtIlG3arQaZKGhBi4zln0JCOAbTEscJutkgfhKRDH7ztp0S8og6ytecDesRzfDV
         YZow==
X-Forwarded-Encrypted: i=1; AL+hErH1NquSCbIalETKwP0+T4+6CDLC+IeaAukV2V16hldNzuFAUo86QR2gI6bSZiQaT3a0bx8x9p3j4h8=@lists.linux.dev
X-Gm-Message-State: APuU4Z97reHcOqEbcOICka04EKkZeB2GeP4P3tn69Oyyeh7crTYFHg4I
	5DL/x5DM9jTIMPEYT4s+71Na2ALJB+pnx1cY6yyfbBFJk6A5teH8Q06ep/NNpgG2t3t7q+Ih5A=
	=
X-Received: from wmbh27.prod.google.com ([2002:a05:600c:a11b:b0:4a1:f1e1:c6d6])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6290:b0:4a6:7d6:821f
 with SMTP id 5b1f17b1804b1-4ba02350573mr44083795e9.29.1794313065550; Tue, 10
 Nov 2026 04:17:45 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:38 +0100
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
Message-ID: <20261110121731.2728824-18-ardb+git@google.com>
Subject: [PATCH v2 06/10] efi/libstub: loongarch: Use struct efi_image_info to
 access image properties
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Instead of exposing individual symbols to the EFI stub explicitly via
the linker script, use the generic struct efi_image_info, which accesses
the original symbols via PC-relative references from the stub itself.

This improves code reuse across architectures, and makes it easier to
add new references in a generic manner.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/loongarch/kernel/image-vars.h            | 1 -
 drivers/firmware/efi/libstub/loongarch-stub.c | 4 +---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/loongarch/kernel/image-vars.h b/arch/loongarch/kernel/image-vars.h
index e557ebd46c2b..d8676cea754a 100644
--- a/arch/loongarch/kernel/image-vars.h
+++ b/arch/loongarch/kernel/image-vars.h
@@ -8,7 +8,6 @@
 #ifdef CONFIG_EFI_STUB
 
 __efistub_strcmp		= strcmp;
-__efistub_kernel_entry		= kernel_entry;
 __efistub_kernel_asize		= kernel_asize;
 __efistub_kernel_fsize		= kernel_fsize;
 #if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
diff --git a/drivers/firmware/efi/libstub/loongarch-stub.c b/drivers/firmware/efi/libstub/loongarch-stub.c
index c87ac7025107..ab7e73e38334 100644
--- a/drivers/firmware/efi/libstub/loongarch-stub.c
+++ b/drivers/firmware/efi/libstub/loongarch-stub.c
@@ -118,7 +118,5 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 unsigned long kernel_entry_address(unsigned long kernel_addr,
 		efi_loaded_image_t *image)
 {
-	unsigned long base = (unsigned long)image->image_base;
-
-	return (unsigned long)&kernel_entry - base + kernel_addr;
+	return kernel_addr + efistub_kernel_entry_offset(efistub_get_image_info());
 }
-- 
2.56.0.542.g3ef89b7020-goog

