Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B393219C553
	for <loongarch@lists.linux.dev>; Wed, 13 May 2026 06:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778652950; cv=none; b=Gd2pmuBof+iPVrbzbZT6FdqMqsctRJZ2O+cTNYsulLj1oFLPTID7jXKW09K9lFVO/vvjb8Clvr51o0IiRpRULMhxZKO/qHxWlsifIcuqIYxEYg41xxRUrCxUQdBLcnvYS+gPW+R8p8lqBBWEH2Q6VvT62jI5cxcf2uWJzdkDcfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778652950; c=relaxed/simple;
	bh=KJPOgqdHc+VPkWM6a2kP1iJwDgDFUyAJ6Cn5wVa30xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZm9DwjMqZtyvntt+StIwSuoEblszh5KFyjhuTQbAkQkjAgjzUaZEzpxBQn7yZt+CWptYw3FbtC26ULj6iVx+pMdmHF0s+RbmIFwC0cUv0MCMHOTQJHsfm9UPZnd5Mct8K46AscH+uCcF2F4p1pJpHxuxeBqL4kW5IvELdCgqZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytefly.space; spf=pass smtp.mailfrom=bytefly.space; dkim=pass (2048-bit key) header.d=bytefly-space.20251104.gappssmtp.com header.i=@bytefly-space.20251104.gappssmtp.com header.b=YWyoGIFn; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytefly.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytefly.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytefly-space.20251104.gappssmtp.com header.i=@bytefly-space.20251104.gappssmtp.com header.b="YWyoGIFn"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c736261ee8dso2954954a12.1
        for <loongarch@lists.linux.dev>; Tue, 12 May 2026 23:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytefly-space.20251104.gappssmtp.com; s=20251104; t=1778652948; x=1779257748; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8N1muubSiaSOqcljpZfa53HxJ6SNVfisFDbsHh2JmU=;
        b=YWyoGIFn4dpFopKpQAYCwqpp4fILC3zd7j6lnuAWri06yXm4sOxnjPbwNDIyBIf1RX
         GTp4bF8rd/17hgNP+MGvzjtdAsS+cczSBKIb5ZPTtuphvX0I/28z7/dDAOJXeSLrbG+F
         DJOaF6VaE+75OFd8aQcL7YpUqdpwGxjKMm72YvjsPU0rpThpQgieeKwbBn3knlXLXkcl
         D9GYoyQYVSspD0ipUCReTbVA4n48mx5MCwf4wooqg2DQi3xGtzFdEUra8mhD8v3pMz0w
         UvV0VT/GqJm10nDyOArcXTE6Fo6GC96SMpmRuBlZrSfx2dj4cKeAjN6DJolsjN9pV/Im
         mj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778652948; x=1779257748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y8N1muubSiaSOqcljpZfa53HxJ6SNVfisFDbsHh2JmU=;
        b=Rdoqcm2jiz0ByQUZOA+ht+sDV7PHUOtOQ3doo3b000VVR6AmTbNiqgnHMGu5aRuQ7Z
         ZkVFhSH72jItKdDoGt35QGVzruLmRH8Y+WHiQqbIb4+5r4yr6Q9mEVm7m51snT9nEAvq
         9e8OenANGKpdanD74ZE3nRZMfTu0tEWFRiw3ZnNzxAW4s5/ISP6nkPW6S68PhHQqDQGs
         7Iwn3gFtv7xfD3xJqzFHzy3FbdRSTIcLlJZzbfMP2wYhtbeMCgZfGDvps0kABgst7grq
         gZNAT2iyP8fYzR025aUUYIK/kYX5XCgq6xm6e8mVs9gNc4WSBTPvpzZ+NlIZKo5KRJgw
         P17w==
X-Forwarded-Encrypted: i=1; AFNElJ8cMM8m7m7DJWt1ZlDavkwZg6TEKQgN6Jqf/lgiA4LBJtRF4B/BVe/ZoTc/aW4fiv3Fj02rMUCq0VI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyI5cKVvoCS/Qur1oKbfYsYd5mkU/Yl0qObYtl2jVhyR3z/r1GA
	IswRTvapC2IOpsQXqhfDdTljIKVl7QPgBx5kbNIbzPcq+PambNQuznrTpcguARyTnxY=
X-Gm-Gg: Acq92OEiRg9d9KZgBtSRLX8JnqUR0sDKTswzH2cWqkjbw7Ku05cy5HpbGKPkZOMY+/J
	7RQ4wftPUjt9UNzKisTECtWpM0x10rvPo5p385UXgisb0VvY/HzbYl61lEchKpzUGkW/Z38DA7N
	DN66UTf20NbxlgG459LxglpVwB6afWbicEHO/fy+KalALd797jhBcPatUIigtnKzKdSX2e4rXEp
	OHrTTJ/gbGnVJ4Xl0p5C0Mv86XBL/uQlNUx9Bh0I4uTk4Y8e9I+5kP53S76wdX+Z4OX8Iwk01v0
	3Hb+LGn7Q+MjYAA6WUKoXzGVIS0oS13AGCKaAzf5HILePxhLzVA4W/t1B609VK7pSp6/h2Hy5Hq
	ZUaGxZeuXmx616DQi5/F+ECfbmWRVCL0lWuKLV9dHaAmbmyhGHKlt0FEmBdU/owWQEHpWyQ3/Wi
	mH7RHM4BYFG6nGrc2TUnc=
X-Received: by 2002:a05:6a21:3390:b0:398:9820:f6cc with SMTP id adf61e73a8af0-3afb0f0f116mr1467384637.55.1778652947896;
        Tue, 12 May 2026 23:15:47 -0700 (PDT)
Received: from bytefly ([2400:8902:e002:de80:1c61:4e63:36cb:235c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826767be49sm13550276a12.3.2026.05.12.23.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 23:15:47 -0700 (PDT)
From: Lisa Robinson <lisa@bytefly.space>
To: yangtiezhu@loongson.cn
Cc: chenhuacai@kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Lisa Robinson <lisa@bytefly.space>
Subject: Re: [PATCH v1 3/4] LoongArch: kprobes: Fix single-stepping instruction slot preparation
Date: Wed, 13 May 2026 14:15:14 +0800
Message-ID: <20260513061514.83-1-lisa@bytefly.space>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512082029.2131-4-yangtiezhu@loongson.cn>
References: <20260512082029.2131-4-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> In arch_prepare_ss_slot(), the original code directly assigns instructions
> to the buffer using raw memory stores. This approach has two significant
> drawbacks on LoongArch:
> 
> 1. Consistency: It skips the necessary instruction barrier synchronization
>    required by the architecture. Without a local barrier, the instruction
>    fetch unit might not observe the newly prepared instructions in the
>    single-step slot, even on the local CPU.
> 2. Atomicity: Raw memory assignments do not guarantee that the instruction
>    unit sees a complete instruction at all times, which is critical for
>    the integrity of single-step execution.
> 
> Like RISC-V and ARM64, use larch_insn_patch_text() for slot preparation to
> ensure the atomic instruction writes and proper local instruction barrier
> execution.
> 
> Note that global stop_machine synchronization is not required here because
> the single-step slot is executed only after a breakpoint exception, which
> inherently provides a context synchronization event for the CPU to observe
> the new instructions.
> 
> Fixes: 6d4cc40fb5f5 ("LoongArch: Add kprobes support")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/kernel/kprobes.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/loongarch/kernel/kprobes.c b/arch/loongarch/kernel/kprobes.c
> index 04b5b05715cd..8e1b7a87c897 100644
> --- a/arch/loongarch/kernel/kprobes.c
> +++ b/arch/loongarch/kernel/kprobes.c
> @@ -12,8 +12,8 @@ DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
>  
>  static void arch_prepare_ss_slot(struct kprobe *p)
>  {
> -	p->ainsn.insn[0] = *p->addr;
> -	p->ainsn.insn[1] = KPROBE_SSTEPBP_INSN;
> +	larch_insn_patch_text(p->ainsn.insn, *p->addr);
> +	larch_insn_patch_text(p->ainsn.insn + 1, KPROBE_SSTEPBP_INSN);

This instruction sequence is executed only after arch_arm_kprobe(), so any
instruction hazards are prevented.

--
Lisa

>  	p->ainsn.restore = (unsigned long)p->addr + LOONGARCH_INSN_SIZE;
>  }
>  NOKPROBE_SYMBOL(arch_prepare_ss_slot);
> -- 
> 2.42.0
