Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D44320CB1
	for <loongarch@lists.linux.dev>; Fri,  3 Jul 2026 04:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783052080; cv=none; b=Zu7k0l3Jvel7rJLP7+lTH+r8Y/KxxEUkLTwfWsBLQipxOhfg79zG+ul9i4QoomhJoE+li2eQScLTKBdxg32thrxGrfCWIirBoSWws7g6r8v6pIhmXv0FV7adRubu2HZX11Ohp+9dqwnAyJkxpGKYbTi1ym6W65ELnsFNPniIls4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783052080; c=relaxed/simple;
	bh=YAzbChjmBb8kihv3jLA7zTY78EJ00CO3olMmNuwPDaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n8mlU5cn2HpLJWDAxpJP3M5J3B8No6SWjka0EzWjkUdag3YpczuQp6UOLuoV8MQvmSeIlEN9Ir/L+WJ2C7ZcdUxMDZ7TtNJjZ4G1zj2Eh1Iy0q9Eocylp4/d0h6738xrRfW8qzy27ttjPBjNiSEzuwk4ThjDUAuitlv00THhH/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=od/Vlt4D; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="od/Vlt4D"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8471013fac2so110857b3a.1
        for <loongarch@lists.linux.dev>; Thu, 02 Jul 2026 21:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783052066; x=1783656866; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqXn/X0N93kvWkJarTQhoPtzUbI801hVn8f9o9OjVHg=;
        b=od/Vlt4DV7uMr4HKs9etpUm7wKUPE0cSZVNqesbB5eOa9QVPVQieEZQWCk0uxfOYq5
         B5JkKAgpV0MPbmWTTaf9mOmbo731RUvQ7XkJW5Mg9rNu3y+OPscGnqQcENkDEkp552ex
         ZCGOncEDafpXyFHL74XNphstWElzKI++oMn42IdEQBygejXiAozoD787cvsgbJNN3bIL
         lkT2Lh/CU08r0cXJQAPjHQZqjgFzeG7P7AK7Z5pVGqaP5lPLDB/baEa/bruzDkCch7ug
         MIbl01jVfbeDiQhaYoa0vrm2AffBg36B/cIlBPxkmpNP7e0vN0h5O548FQ7KWava4C6k
         A3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783052066; x=1783656866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jqXn/X0N93kvWkJarTQhoPtzUbI801hVn8f9o9OjVHg=;
        b=UayzpXByVG9HqVcCkAHyBwfkmNC+rOD3b9qNQCzPJ9h9zVF75/hP8C3D6qcsV31GEB
         7yMG2OltET0ORIhWs+enhh5WsPLEReMa9WiR9WaSkPtEfeS2i/9/sg1DvoJ2wUicpVpd
         omoJkzq2/j/SjCd9zW8V+J+Wgj+dY+tNYeCmiCXk6gUtWQArXAdG7jiztAHBoB5DOzMK
         wr/YqpCZ3dpm4RGIhCplXR8TkDGY61MpBrhuvTEL5D6P4tcxcluJqlGSSoUuCY4WlwDK
         Ajtsi1hGlfih34Mk/0zxn8pi+XljlmYz+GVbZRufecHE93wgsro/VBSVSeztpNzCqiok
         mV3Q==
X-Forwarded-Encrypted: i=1; AHgh+RoAqxwkIgOjp+SiaOuuQYN2YsaNeCP0VM4eycIS2ZOT5VaGOnwRv+2oLYUgI69P5534IrRegTjfkrA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwC2LJOmHsBm0/Mwgl8ANr9bGdQ9IbXl3eVTZy830816ipIWW3
	pZR59QjmTOKbNKAMP8GjUt+KPY01q7QcWyQuw0LgymF41u7f82kFHkry
X-Gm-Gg: AfdE7cmVLTHRCRzlBGs4OgDa8TxKVrJIjOZN6onJIsp5FiGOnm/cUAZYIOpn6HxfLH6
	EiGSb8MA8PQORYIy8n6q3uA1D3+3ycTQvE3nP6Ebt6L7ZJvxdipW4BPyRRDyWQTZGmf1xv8UCOL
	teXTn6rHxO7eDQPS9rw2+ShniZ0KKQDePwzFvttiI2o3MxtiAV0UL/3HrMrXb2mESLbkCXksrOJ
	/0gDxc21OggRXIkM3yp9yjmPEY5x9RooWCK6HyM6c96V2twNi+8HBrmFJNOxR7IU0BZ2F3iBV7F
	1ft2u6QOzRHKK1dXeu/V66NPG9eQXsAQEK1VoGsUX773Cegt+ZxCRSiz2LMqOvyPaX8p2uRgbD9
	MkGLylKcbJsbS3HiCGubyo45uo8KRUCvd5Ah5SM1IRlSuJobNJmNua5eRAUUKptznFXIDi9uEO7
	/ojrQrUv7KoObdd8iuFg==
X-Received: by 2002:a05:6a00:944d:b0:847:83bc:d2a4 with SMTP id d2e1a72fcca58-847c068623bmr7514208b3a.2.1783052066293;
        Thu, 02 Jul 2026 21:14:26 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94bd7esm2207768b3a.38.2026.07.02.21.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 21:14:25 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: rppt@kernel.org,
	akpm@linux-foundation.org,
	Huacai Chen <chenhuacai@kernel.org>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH v2 6/9] LoongArch: remove redundant numa_nodes_parsed node_set()
Date: Fri,  3 Jul 2026 13:13:26 +0900
Message-ID: <20260703041329.2797584-7-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703041329.2797584-1-ekffu200098@gmail.com>
References: <20260703041329.2797584-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

numa_add_memblk() now sets the node in numa_nodes_parsed itself, so the
caller's own node_set() is redundant.  Remove it.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 arch/loongarch/kernel/numa.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/loongarch/kernel/numa.c b/arch/loongarch/kernel/numa.c
index 8b89898e20df..c96c53623715 100644
--- a/arch/loongarch/kernel/numa.c
+++ b/arch/loongarch/kernel/numa.c
@@ -216,7 +216,6 @@ static int __init fake_numa_init(void)
 	phys_addr_t start = memblock_start_of_DRAM();
 	phys_addr_t end = memblock_end_of_DRAM() - 1;
 
-	node_set(0, numa_nodes_parsed);
 	pr_info("Faking a node at [mem %pap-%pap]\n", &start, &end);
 
 	return numa_add_memblk(0, start, end + 1);
-- 
2.43.0

