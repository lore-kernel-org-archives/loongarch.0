Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2478423184A
	for <loongarch@lists.linux.dev>; Fri, 14 Nov 2025 19:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763147650; cv=none; b=rMFBxya+aHBiW7WP482a8ZX5I/PvFNI7aou5oqWnI827jEqcW/hoczArw+66dZvapi/2xWOCh3NMvDpVsS+9ctJdcMqUFEDdd0kt3uvhIappLP10fOx07Brrq97PU+ytJ3+HcXAvKvMLjdxNxHgMoyKJABkOPVLZ8Vnq4bY1moE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763147650; c=relaxed/simple;
	bh=aI9onR+f63JFzaNIBKoGx3OAwegzLui4sLBarF2xej0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZxxF/YS92IXDewlF5gK05QukXJ16qYwlF8+HEMuxcxpqaPMM1tFn9aq1AvU8EeLoLxdXkcZZsKcF0wulocSP4Y76SgeSlhzwXaWgETPzPfDOXQgVoOrwFiSnZMtBAA5yOB3TQ7c2QBxFcbxtxDNElSbNnaCJB5gyj7bZZQILCa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWtr0daJ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWtr0daJ"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64369269721so408804a12.0
        for <loongarch@lists.linux.dev>; Fri, 14 Nov 2025 11:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763147647; x=1763752447; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aI9onR+f63JFzaNIBKoGx3OAwegzLui4sLBarF2xej0=;
        b=hWtr0daJcf/NkRP9PoXL2n12I0SdHlOLnFYIeKBf6PfDeDOiZUMVEJ771S132bSd7T
         q6itUQFUYr56snZUx3XbwDenvx2Yi/owitYcSy0+QvJ4EaaLNMT7zIQ2os2KbjKC81dP
         844WCB/qeXgqBNV+Sov88G34roDWfaEFt99iX63f2ojWl2Qah3UkdLjvYzCs8vmqMzMb
         HjThJSLYkgm0+bBnX96FqXJko9aAaV+V1TJbttzYf2UqlaiEE8Dg/pcG3ImS9UrVxjG0
         QKyw89LWipxxfBcabEouxqcM4GoFqnH2sGtyzBhRFa6l4VGg+3BgCbCJYhZMCnFYhKIN
         WhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763147647; x=1763752447;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aI9onR+f63JFzaNIBKoGx3OAwegzLui4sLBarF2xej0=;
        b=qzVaf+pHraVc+YtcY1js+BgMkLaxOi0BzEbePaDj+Y+NNnm+BZW4NVRODT2XQUBYD0
         Z5zJwcxUWBV1arL+2ZnvfkrGyc9ST7bfSlMdpsKsE4SVCBvViIPqy8dWR7PPJuKovc0a
         Pk0mCezgF8LjBelCOxleomA85pB8yvIh6jfGgd+1NNk95Idm78cBrn3NEivNt3MRhOoA
         a7mzm/caYHKa/b8EHF7q7YTAPyWdWNxklpBP1c7/i6JOAouU4+1kbCS2chE6jeUcYWou
         bsm2PKNPw1/io75VI34QAzh0ZvX97OX1cv2DnFE9oB+K8RU7MsE3AbQr5/j2RDZNyLXi
         hQ+w==
X-Forwarded-Encrypted: i=1; AJvYcCXCtseJdtoAI6WMZbVFJG0Q3j/0w1zmq50EqGoP9N+FsL/sLGHplFRYDzPPc8lgVkWN4Oi2CbkSSgI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKIr8Tb1AZ30dPJQ1Z8dN+jH6v6wQd8AiyeHP4bF0QjYI1a+jh
	Jq/TmBR2ocK0M+71y5B8ullumQeKrU9vOfHRgmCnTN8ZbIbof7vmowOuwd2OLb05cVco/8NxAvD
	QHOhCC5u6NcWalB/aS+9gT+VnsI9Zj20=
X-Gm-Gg: ASbGncsx4g2XERmvt3jeksSCpBTRQqjNXqLCXCCkfY/K0sxIZizDUSsLJY3A0cwE0ge
	eru35qmTTgtvMWFciTJUC2WNQ1xLlqlhSmMJCNLx09qQPKROPmmPP7F3+rnIfHMo6bGPrp/DpQx
	c4UCUMqWXaC3C+rxynU66V7ycwkmI+adkAe+bM3LfU9pg9aek0RbeeyTYmAEVMpTjyZaAy87+Rq
	jnKFKVjv0R3ZwTUKIzuZfv2MFImP2Alem9j0Bxh8v8m8xatZdz6bGtit+RzLA==
X-Google-Smtp-Source: AGHT+IEvBu7ESLrGNRMv2QiwL16IZgt6aUNJ72TYzx+vz9COzg0vAhK2L9oI/n3nL6QJ1JU+lRhqexZnJfrgTYt3DEI=
X-Received: by 2002:a05:6402:4603:b0:640:f974:7629 with SMTP id
 4fb4d7f45d1cf-64350e225e0mr3893696a12.15.1763147647239; Fri, 14 Nov 2025
 11:14:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1763117269.git.zhengqi.arch@bytedance.com> <66cd5b21aecc3281318b66a3a4aae078c4b9d37b.1763117269.git.zhengqi.arch@bytedance.com>
In-Reply-To: <66cd5b21aecc3281318b66a3a4aae078c4b9d37b.1763117269.git.zhengqi.arch@bytedance.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 14 Nov 2025 20:13:55 +0100
X-Gm-Features: AWmQ_blqeEJIFeEqLe5Vq5SGpFC4UPadwiIAm270RAB9lR4JL9-RyEZ3PVaRM7w
Message-ID: <CA+=Fv5SGu_Y-zwryrQiTQDy32SipMk_dfjZezth1=aZmnDKNeA@mail.gmail.com>
Subject: Re: [PATCH 1/7] alpha: mm: enable MMU_GATHER_RCU_TABLE_FREE
To: Qi Zheng <qi.zheng@linux.dev>
Cc: will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com, 
	peterz@infradead.org, dev.jain@arm.com, akpm@linux-foundation.org, 
	david@redhat.com, ioworker0@gmail.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

I applied your patches to a fresh pull of torvalds/linux.git repo but was unable
to build the kernel (on Alpha) with this patch applied.

I made the following changes in order to get it to build on Alpha:

diff --git a/mm/pt_reclaim.c b/mm/pt_reclaim.c
index 7e9455a18aae..6761b0c282bf 100644
--- a/mm/pt_reclaim.c
+++ b/mm/pt_reclaim.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/hugetlb.h>
-#include <asm-generic/tlb.h>
 #include <asm/pgalloc.h>
+#include <asm/tlb.h>

 #include "internal.h"


/Magnus
