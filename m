Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026134;
	b=VkkS+XHOtkjF8xt6d+n3dbFlv+GZsDfB4Vyl4+4aRwQI2aVC2vN6drspISPlOKm8PcXB
	 CtpRArAkubHLFQhZ4QBG6TYE91K4PikS2+njZ9+R2XbR1YaUcgjxQsyZ/SQSHaNajC11R
	 u/w8ozkyMNWA+jXpFVn5XgHVUFvaoh+wMXaPJkoouwn/34RjXQ5/l1n1Y3pglYWIf5ya8
	 vPpW5MHJq3YnIf6i5tYPHQ/rGtrmloBaBwpZTzrGGVJd+3TS4m6Po0H0cyCM4BgKpW774
	 IrdcoyhSlbIzAl023D2lNY4xcmjUE05L6XOPlOx0uffGZ7WvD7b80maSq1jp5sfr5ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ufXRKDkvqGZ7V1E+zy+j379v8X/+jc3iv3T/Ea9AhuA=;
	b=oynC87/fgWNbHigwhwIuQe3QYBxgaxUAREhi6Vtr960CkJM/cePNVEttyqH6/HmQ4TWv
	 zFYbIAbpCaHMLtlO7dlXjNYj0vlFKXW0jGUIBOPthSn6ei8nos4ZosbVL3mg+3oDzwuXg
	 NtVEeqeO7B3WxcjIzj5SIphCx29XBMvh6PbBPww8Kz7lLpO2uKR18+y9TU39eENU7RzaM
	 RGMRdN2dPNRjp58ReFVj0zllnmcti0QR2kSKaH/66iv0X7q3bVbgRAu6IqmlCIiX2n/CZ
	 532UuMA0yDPCZy8yc+/34mCvGDagQcg6HHt3o4p9kTYooTUG3QtZwZ2T1SeZcsczRuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EtOJ6wo4;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF13606A31C
	for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 18:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CF13606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EtOJ6wo4
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e00f3929bso52600f8f.0
        for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 10:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026132; x=1795630932; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufXRKDkvqGZ7V1E+zy+j379v8X/+jc3iv3T/Ea9AhuA=;
        b=EtOJ6wo4E8PUWXysjBwRvq67fam6TsjbJfw14Qg0CO73fuzLW79Vpkz10B+twD6mcN
         qvP1b34zbLyQnutTBD498i/ACAoTT4CmfU0Mzq4TtVNZjguwevr9/Tm+RH25OH61lwVS
         4L0zRz9qtp4Mzh48GwpiAe7nN71ePJebmaJa7j+phUS0gTCrx3QReTxje9V6bIGMAjir
         NxgnLPIr3dLMxBqaOm/nsr3cIXkMQ35fr0jQPTwxfcNEZNqZb8oOEK35pAtj7+A/u5wS
         Rit7U28F6+z4FqPuYk59+LXAaG5NpAsLwzEeqWk+vmpUJdt7HkMElcdX/+rvHG/pgBoq
         GQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026132; x=1795630932;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufXRKDkvqGZ7V1E+zy+j379v8X/+jc3iv3T/Ea9AhuA=;
        b=kEz+B5vZAwrt/T0Bxc8jRMMVoCjrdvGZYFL3DXUNzCgaZ2/7+4PET3BnroGh5ykgG6
         s9DwNaE1pGxBfhhKW07bYV58vcxhyzQDpQhiw4eyyNiwmxdapUT/1XYKxcRz1V3qZDkU
         DNliSX7VRs374Xe7iU2pZGaHfz4FN/vIC60S1pXM0km6GQzVlKE8ACgOWprXjPNtRq65
         Rbdi2ofiH0AzNxX2sHHY+1sP1Vf0pWWcmgtXUW0sF/k46OKHGJiWrym/gaL0osN1DL2b
         Nh8UxznWgX2Ep865XrYhTbKYJv1FXfHxr85k6i9QQ5rz3RUwgXBrt1H+/1sK2njQVaJu
         XghA==
X-Forwarded-Encrypted: i=1; AL+hErFKfICFUQqHcabWwbbB9IoGQXrNvuBFg+m14PtQ8uWuZzOKNpHaB3O5k+kuIIYfGEgPVwoamgQ+fmo=@lists.linux.dev
X-Gm-Message-State: APuU4Z8e9DN30FuxpparkihrtX7jZUZJ2vgv0fnhr9bDNVoOUarmHSSj
	w/+dboBn+fDKcRZ2sewEArAy3SxeFu8BiCq82RkayXcOU/QAzkrdJ72cK1WUwxgaA7HLJ9rNRQ=
	=
X-Received: from wrbdh5.prod.google.com ([2002:a05:6000:a85:b0:48a:f5b5:2f71])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:41dd:b0:492:b1c5:6db6
 with SMTP id ffacd0b85a97d-4a8e3f70001mr836395f8f.6.1795026131432; Wed, 18
 Nov 2026 10:22:11 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:20 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1259; i=ardb@kernel.org;
 h=from:subject; bh=2JP+cT9iihC5uYGXzSyzWCniO925ZMwvqz8a7g9Ari0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm6WGnSc5J+WcVbnAJc433bqPOze3x3t/lFj+ivTJ9
 1IurmjvKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABOxXMrwz2xaQsuyS1zrH/yb
 dOxUcZ7zBe4/av8WMjnc3BUXcZ6ldALDP4s91ycxG6wzmBcq1hDzZc3ikPLX4te+xBasDvn43ri fgxEA
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-35-ardb+git@google.com>
Subject: [PATCH v4 14/19] efi/libstub: riscv: Use struct efi_image_info to
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/riscv/kernel/image-vars.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
index bf703eba3fa5..c18b24792a29 100644
--- a/arch/riscv/kernel/image-vars.h
+++ b/arch/riscv/kernel/image-vars.h
@@ -23,14 +23,6 @@
  * linked at. The routines below are all implemented in assembler in a
  * position independent manner
  */
-__efistub__start		= _start;
-__efistub__start_kernel		= _start_kernel;
-__efistub__end			= _end;
-__efistub__edata		= _edata;
-__efistub___inittext_end	= __inittext_end;
-#if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
-__efistub_sysfb_primary_display	= sysfb_primary_display;
-#endif
 
 /*
  * These double-word integer shifts are used by the library code, and
-- 
2.56.1.708.g77570a6a1d-goog

