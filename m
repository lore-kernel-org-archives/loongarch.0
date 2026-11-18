Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026111;
	b=IGpokrPZNISRq+uLIfpX/LLKfS5kEbJX9+zaUhZLE8VTLGRHIa0fq4p2/BzaWP1wluFo
	 iQOTIz9xD3B3emennNCeHDm0Gfw1CRskILWoRYjYTe0RkqobAvqGZfvIv/92YEzoE30cQ
	 mdMnLRxPjW3gka9NPMQFWcgMp+/xqsIFnpXMT/OFu1nO3KvDSZD+5ewFVLjoD8x3hEp0+
	 wiNsboTYUme8aLHiQ3GT7CcC/xpOGnx9TTzi05Yq3Xbsk/MJ1wb3MHfcoZTxmfRkpkKr3
	 xNxGwrpixWdIGEUK+/vQTRuU6G4x83jcXVXUB1tHZYVnhm3RGOfXCpFC0gI57fFBiwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=8uARk++meO5zgQMDlHPkaRg5Ipl+Zw0cx2xa6wUMMvU=;
	b=unLp38ZKU8D3EToWNNkkMTLtQm1LHKCoZE9zeJrRIh11OG/3nbna543EOzo3urztQqrk
	 EHacT9j05uIkAGh7bTsYXxpOxMnWC0Hn3H2N1RkXw+SucBDMXxNyLE7SJDsAyeZNP/Ouf
	 SDvc4pYh9U9XTWwR1WjK+QyaNf+cnACbLUVbrn0Uf2GLgFi9TdYdZlsEcYV6rl7s6pPnp
	 yMN/tgdka8zB1V5sL8PTnzJ3mQsAFm/fTlxjQI58YdcXi33hdiu0MNQ16xtc8OPdVrgD0
	 D41T48XMe5hL1oSP+ce/ZYBZogcNqXzuR2DSLTx4hW89qZeEXN9JJkB9zu6brxylINA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZPYg99Sr;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62E6606A31C
	for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 18:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B62E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZPYg99Sr
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e0389d6f9so907184f8f.1
        for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 10:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026109; x=1795630909; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8uARk++meO5zgQMDlHPkaRg5Ipl+Zw0cx2xa6wUMMvU=;
        b=ZPYg99Sr3exEu3cq/V/LRtqragcneFBeCsQaePWJQjU4aoBU+Z6jABHn+y5GR8g+4P
         cWfTjuvxBKTwECwbDjpR8duv7Ue5v1g/37QmdoydVIEShRy8OZn/l+6n1YwCZO9SsY4a
         oScVEyaopK3SW9BGu5ftWP4Qgyavl1w7VWVspQzqX8kV0Uhh6IRaffg/nRSIxlWPPLyE
         9TE1zYediPWGBxHRNDUZEx3tLq1lRHeM2xw5YsiHZolSII0EjU5/nWdR1gawuL+NZGM6
         lukAmGN6zTkfnMXAwXH+4zzOIRNy3cchNBvK6rn999MtLfQvWSSKglhi0RrwyIRJr2YR
         fobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026109; x=1795630909;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8uARk++meO5zgQMDlHPkaRg5Ipl+Zw0cx2xa6wUMMvU=;
        b=2ccOEAau8Azu5xRjoYmAS4yzcuWXTpCUBA6s8ja29863O9WiWhSJgDjL76KZd9tVd+
         NIwULl+OQE3x3SSZPGS1ZX3mIiZEUty80rsCBVJ+278om8nuj1P89yCI0G1GsveSsh1l
         ijRp7TPS9FxQ4fJkXosq/wTcIO07m7hqllciY6YxAIo/DnvwwBuKAv/DwJyLShdPrOu4
         rtYHhxK3kA3W0pDdlY2pTgCkgsbaCKi5ToMz0R5PgF1kVLBtlZMgGYZNA6BDZIyuACP1
         8ysJdwE/x1U9PePXHutjiVhtBEkhOYIVmjowtuQmeHtEG9SlwGepemzdYHSGwEK7OUDt
         /37A==
X-Forwarded-Encrypted: i=1; AL+hErH1b0ceWi8UPOiwFAry+zgWCXflHD3oTl9SDk6wOMlSsdtdreXqUdwwfapz3Q/Ch/WNE4uNes1JP34=@lists.linux.dev
X-Gm-Message-State: APuU4Z8ZHIPjmLqcoxFdHLTJDKKr5pqI2Wf7RM7H3Ktg6X4OqRu0rzPi
	qyJl+1J41R3qFEzAa9ALeBxHSl3+1OI71fo5VQfJ/9I7eA3ZJGebdRWxtAe9zfnmpvpNc6p0Zg=
	=
X-Received: from wruh8.prod.google.com ([2002:a5d:6888:0:b0:4a7:4422:f19c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:468b:b0:4bb:6cef:d14b
 with SMTP id 5b1f17b1804b1-4bb7d5d64c3mr73846785e9.2.1795026108878; Wed, 18
 Nov 2026 10:21:48 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:08 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519; i=ardb@kernel.org;
 h=from:subject; bh=vKdz9BGSZVExEz+d9rJxUgExCcdNux9c9+LOmmgmNfY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvmymTmUW7PTesiP30fqlynVQUw7ELZQZ1eu0r/0sfD
 THmbeTsKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABO5sILhr3jAfmfn0L3nqq/N
 4sjPd9leY7N46grXDmOWVeV76+sV5jEy7Mrxff+YpWTaT9GJLTl/ck9uODnZ+qH+kt6Sk/v3H0i IZQIA
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-23-ardb+git@google.com>
Subject: [PATCH v4 02/19] riscv: Use _stext not _text to denote the start of
 kernel code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

On RISC-V, _text and _stext currently refer to the same location, i.e.,
the start of the .text output section, which follows the image header
(.head.text) emitted by HEAD_TEXT_SECTION. _start is the symbol that
refers to the actual start of the image.

On other architectures such as arm64, _text refers to the start of the
image, and _stext to the start of the kernel code, and generic code
(such as the EFI stub) may start relying on this distinction.

So switch the only user of _text in arch/riscv, i.e., the "Kernel code"
resource that is exposed via /proc/iomem (and from which the "Kernel
image" resource inherits its start address), over to _stext. This is a
no-op given that both symbols currently resolve to the same address, but
it permits _text to be moved to the start of the image, making it an
alias of _start.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/riscv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index d79f99b86033..e6112d424fde 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -91,7 +91,7 @@ static int __init add_kernel_resources(void)
 	 * child nodes.
 	 */
 
-	code_res.start = __pa_symbol(_text);
+	code_res.start = __pa_symbol(_stext);
 	code_res.end = __pa_symbol(_etext) - 1;
 	code_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
 
-- 
2.56.1.708.g77570a6a1d-goog

