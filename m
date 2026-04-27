Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C2C3659F7
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 03:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261526; cv=none; b=I4BuoSDFHmmUUo8vsyu/5JqzBz4lG6ZgPs+IBE+IbM8JqlCAvNX+cAnFPK+cxTpxbtM66AbPVBiAE6foUrAf9rDH06DAbcRPiDK0Sy7W6RFYHk+w4Xu+1JCnd5nPClRigchOF2KThLDFkcxsQBvn+s8q1IuwVDPsncrBauN+G3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261526; c=relaxed/simple;
	bh=SJjBIHnJyopRMGSXdQG1IrX1S846AD36k5xbBYwIWG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fwpsOWWBv+T3m0LxuxXz+ugJonyUUwwqUdsYpoaKs75WvNR4DhOuPhR0B5xK5bVtBINbaufK28wpndMZHNmdwkOEFOiE/I16zMJP6azywaejPum7fQTseVn0u0S92XzcIgysieBNXLbRCJrzWSq/c2YpPc8vpkz355o0hnPRoO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=We1T4KI+; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="We1T4KI+"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35e563b0ee7so4564412a91.1
        for <loongarch@lists.linux.dev>; Sun, 26 Apr 2026 20:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777261524; x=1777866324; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R07shkiVuWsLnnERZIMp6yUrzas7HOh6Y70yJzuQ6hA=;
        b=We1T4KI+VBfbjbliPUAEjJjVsQits855s78xk+FmkBFLj5+Jymrv84iJNWaBp+AYx5
         8p+ck9UXovTwz2drplIr0I96wpFsnq4EeeIddbcJNvQgf0ARfZ8IIs38xXbu8UFmrSX7
         YKm5gqjHkQdOf7tNHSRfzI+XGPpzRLTdolq0VkFhgl6BPNebMklL63kN2soSfM5gWGo0
         2Lb2+0wNdt/z4qVqNEjslS1kyUL+IImY2OvdZEat5iVYzhrvUqAcNX0KS7fDAwFvGaIu
         um9ScDu5YZuei+EI+nqdBNzkjhHsJtBH2sQqln95f+tJnU5d3goWYsdC1B0s4n64Z9Mb
         /fDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777261524; x=1777866324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R07shkiVuWsLnnERZIMp6yUrzas7HOh6Y70yJzuQ6hA=;
        b=NuDyJ0g3R44bIBZNCmVkd/mF0iSH8J2Lf1dUIRbnEH6f4WLuzVw6zbi1N+KsLRBlva
         J5VdiRvqbmg0tkBCyZunMy12/q+CUmT2xzDYLrq8SQbxNvVz9szTKQV6GBVSwgE2eKOw
         JmuixRGv9Hp0Vb631WyESN3viRV4IO+gps8Uax9qqnUa2LZlurPLY4cUMijMUTH6pnON
         //hm0sXEZDO8UIIjmMEmB4N4SzUmFlX3VjokWrbxB6HeDAd5mgSlELjYNt3lGCY4XXGG
         eWBMfAVPqI77+H/mdDJqIalEe2XSqtjhX5HvugkSdrbI3cCKeAxCR4qoC4kIveoluyh7
         7J8Q==
X-Forwarded-Encrypted: i=1; AFNElJ8wTmgBCcLCImNEQ+1dU4yAqmulY5G3gFEjxRG9lAXpHB8ka7n+yiskLa1WNfygBPyPUkwcOg0vht0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOBrXvRAJ3NMQamDsZ2T5FjpwC6+/1fPouuttaRglL6TYJwVr5
	d7YVe8O+/odSQIw/46pQV1KjpNGZvRhKrOtZex3MjhdxTaE2p8ThDqe+AsTq6wBSwGREyisg8Mn
	VPehg
X-Gm-Gg: AeBDiesSvtxMs9vtADnmYDWRk94qm13XcuApLa5/YAUTtWyN/m43wveKC85Z+UUtCgk
	Y/aCUALEemntwpRTmwqEMQyWvfrL1L7VSy4yog1dkIal5igZ66rj2re99uueAr6o4sZvsLUmwgQ
	Zd8W9xIHAUxcFRiFPJ/bHZ6cZNcrjP8xF7fd0aiRdu3OlQ9yRutNjKLme/p6N16I+70MvBbZ5mi
	wxHIxdZhD63oZTHmMwuM7v1HdpM98likkLN4n1kWbWTBjS8i/ESj/wqrB9ERTDoOok3HSZex0dd
	ashdhVGVTVIZPBjRR84fGSF7YFlkeC61lUnjaXaZ9g1yxdQqXyoDPYRkHGxWom9aJOt9iz4XAX6
	oAcWwZziyve+co3etnWXJGQCSZES9LOiKvq7Y6Z65ig+5Y5XZfQWhUKgHF7trchQqjsj0ThtyFT
	quFWZI32Ys1lytHISFx3w=
X-Received: by 2002:a17:90b:17c5:b0:35a:10b6:1208 with SMTP id 98e67ed59e1d1-361402fd6bcmr38690575a91.14.1777261524404;
        Sun, 26 Apr 2026 20:45:24 -0700 (PDT)
Received: from localhost ([2400:8902:e002:de3c:3085:4d80:3614:2212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa3073asm279061375ad.27.2026.04.26.20.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 20:45:24 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	WANG Rui <r@hev.cc>
Subject: [PATCH 1/2] efi/loongarch: Implement efi_cache_sync_image
Date: Mon, 27 Apr 2026 11:44:50 +0800
Message-ID: <20260427034451.717817-2-r@hev.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427034451.717817-1-r@hev.cc>
References: <20260427034451.717817-1-r@hev.cc>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a LoongArch implementation of efi_cache_sync_image() to ensure
instruction cache coherency after the kernel image is relocated.

Signed-off-by: WANG Rui <r@hev.cc>
---
 drivers/firmware/efi/libstub/loongarch.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/firmware/efi/libstub/loongarch.c b/drivers/firmware/efi/libstub/loongarch.c
index 9825f5218137..26495747f69f 100644
--- a/drivers/firmware/efi/libstub/loongarch.c
+++ b/drivers/firmware/efi/libstub/loongarch.c
@@ -82,3 +82,8 @@ efi_status_t efi_boot_kernel(void *handle, efi_loaded_image_t *image,
 	real_kernel_entry(true, (unsigned long)cmdline_ptr,
 			  (unsigned long)efi_system_table);
 }
+
+void efi_cache_sync_image(unsigned long image_base, unsigned long alloc_size)
+{
+	asm volatile ("ibar 0" ::: "memory");
+}
-- 
2.54.0

