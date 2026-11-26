Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655876;
	b=eXUD7aRQS1Jv030ISTy+zAKhhXueLbcwesbOyKQmFEYojBB1Q2znNBMANETjRhHbj1Y6
	 UpkQtbUeYeUxol9WDvZO14EfoIuWLRfdTFPU5E1pLi5KmtK+KDtbjO1MetwE5nq1RRtRN
	 icJnFJecf8YH75LLadyFylWn3+q//F4yK15UNLy4GTyAdAVoAYxYZFyWP47yCGCMmt8Ut
	 s6tP+HHOPU9RRXzOMHzDoPzf3Z53GQdQjAGyhFXSiX+FgAeNPnXA9psg06PFHapPQ0fVY
	 L+hvUF1+qe2T7/2W9/A5Xx4KnGT7kkVhxNsYIwzRdwtztGsiRtQ/M/lJG2xBxQTHhGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=+aRJH0s7CUutYvHA8qpdJ21NjF0/4sgc7Z7eUI52Igw=;
	b=3p0BB2SSpEZ/3ofYiqdC6b0Vau8poLuNBr+BipJbbOY5HaXE6bUnTuHL4pJJepjYejkh
	 YrhSctw/pymC2tAxyTLDO7/68xp+ZcDB8xwhD7o0QmMlcwdr50W4CVjT8c/NA98uVW0tq
	 KoWL75O7ekB5ZllckHLeAE3+CJSBuAXQ4ZjRaqf1ND5E9KWvNbRub7xkaibEsc7IQRpGL
	 7caprKhcK4VPEfVf1loNa9jy6pAuhgnMjmIBqGAsN0Ff9NHB14uCU3m31MqW5xhK+JU8v
	 Ffl4ZmyR+FQrY4jPj4JtSOxnQb4I7Bo5K0S7spiGZq0ONaTskr1xhdYyxzHW+R9RfCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7m+IXsB;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4B6606A321
	for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 01:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E4B6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7m+IXsB
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cde7e8abf9cso2321547a12.0
        for <loongarch@lists.linux.dev>; Wed, 25 Nov 2026 17:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795655876; x=1796260676; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+aRJH0s7CUutYvHA8qpdJ21NjF0/4sgc7Z7eUI52Igw=;
        b=X7m+IXsBXP44pqD8FdRzTnUtyF3tnUC0PpF8WmUs20VZrG1wAFYvCLciLai1DjSP4q
         zK3Ksn33cr5dR8xAwiHZs+aPEFU1QJt/KKBx3U2m6Rx0OK+9vxcBSYr3axLG1eLhNHPQ
         wtux5AfYa/j3+F7OaVh1A6k7sX2GKxHcEuU8GpH8dfh487IIXKc6hT2tCqZNiFORf+ae
         bp4Yd7IXGlkPgSTO+hXB1Gvg0hLZGL25NjYWnNUKzMZySALVHxOMyxrYDeLL4DxkoSIG
         XfTUrRklo/eVfH+UbNry2HHBpLFs28u6ab2MhKPZW4b2oFNlw1An7lQfM8bu00mLE3F4
         qyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655876; x=1796260676;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+aRJH0s7CUutYvHA8qpdJ21NjF0/4sgc7Z7eUI52Igw=;
        b=LGxOyyZbFMpN6PL4N3X+6XRjyq2XNTc/n/4poN8ThHudEMMjBInOOkQHWs8bcMjADi
         GWIefTZu0O3/NigPN0Zs7qGLDQERB/+Wa3HLGkuKcjO3SMNN5s5kcC+ayJsYr8FMG9OG
         Tkd6S+Gklz4s6V4Sjx6TrzC3kLFJzx7S0+HoBMi4GKia0w2dg1N+m1clnn6pRc4FXYRH
         7tUlbN8Ea54bYHUS3ogcxE/167dqIxT7GYpgElBRIh5t2EjncXqcRjet1NfA33LR1DxY
         U6LKfNVyCR+pD0A5hTSp8fJw/tOyDMKX/8f5NAw0/SGNXXCaQtljqj0iVzwB6FXpTe9e
         It6g==
X-Forwarded-Encrypted: i=1; AL+hErHrnThj1D+Rn+nZZm5cLvYhyH78DL8MqbSuZZ6ecASuNVQaE3X4rsiv5ERRO10b7yDRmbjwm9fu0UA=@lists.linux.dev
X-Gm-Message-State: APuU4Z8oFulCLG8ldPP8tX887358lZpEkTiblN87zDKoJMLUuW6arHZ+
	SBeGqlaHF1EvzCnqpawRUbs4L3fC/GG2CojKjJkvh036m0h/yGCB4PtD6k/gMg==
X-Gm-Gg: AZFdTZeBZX1hZVMlwnmCNsveQHuNRtcTdLevjHc37A2pycHsTOm4PK+/bvsaN17rNGD
	Z3zMux0Las+E+8OA56yMBj/PPEK1cRAgqvwERg72m2hy9Lu7wTTxHtMPQMGcpQnKYhILp77GuKb
	HKfqJnvRiHnolNkagRzmC78WGOO+cSkmxdbulJT4mT2yUW/mEpfm4Jv74bTrl3aQ0Yri3qHw7rp
	eGSCSRfc7g4QddXMANIAK1RnctpUSnVtRsekUN8V3ilpWqRJdowVk7ilmjuQjtcCc6IFfD8O9MD
	dYNu0Yuxr6NU16ARRa9T0V5bcrHtb7odhoc5kz0PsD1+9bt/kpyeODr8jDrIFeHkztLcIkXYNx+
	yKW3MSqCzhp8S+CRt1m/DUtNYgrgBBu6S1h37eFE/CGNrSR2aTxMso+duQGu3Tv/pNEYb5SDJc7
	7MAupzp9kX/oHBoO1R4zdY4ddTVJ+0OIev9p1dzl5IxvurCX++liBUjSeetb1T1hNRiTxwqrUtp
	MvbEIKi7i5nsycmB0zNhacizYNMyb3LfiYhhoGBlyr4JZntHDu/av+xWnBZMULI4qvo9NkQdskm
	0FUO+gQ6MaQUbLGQ0G61ePIG1xlqDraLKDYTj4aRt87rrJ9U/W7M/hPbEsFKimnq/t3FqFHHO8v
	AkCSUHHvUswtVtTfWZIZMdu2DXdmGCW81Fw==
X-Received: by 2002:a17:90a:d44f:b0:3ac:8897:7ba5 with SMTP id 98e67ed59e1d1-3b41c98ec99mr18155731a91.59.1795655875720;
        Wed, 25 Nov 2026 17:17:55 -0800 (PST)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm29921315a91.8.2026.11.25.17.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 17:17:55 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 01:17:54 +0000
Message-Id: <DN4QVSWEI27E.32PRRHCUBAZFK@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Tiezhu Yang" <yangtiezhu@loongson.cn>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
Cc: <bpf@vger.kernel.org>, <loongarch@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1] selftests/bpf: Restrict JIT tests to 64-bit
 LoongArch
In-Reply-To: <20261125103208.15242-1-yangtiezhu@loongson.cn>
References: <20261125103208.15242-1-yangtiezhu@loongson.cn>
Content-Transfer-Encoding: 8bit
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 02:32 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> Now that 32-bit LoongArch support has been added to the kernel while the
> eBPF JIT remains 64-bit only (HAVE_EBPF_JIT depends on 64BIT), limit the
> BPF JIT-specific test cases and architecture macros to 64-bit LoongArch.

Most of them are not JIT-specific.
The interpreter runs sdiv, bswap, movsx and gotol.
The default build of test_progs fails against such a kernel anyway.
dummy_st_ops_success.c takes struct bpf_dummy_ops from vmlinux.h,
and that struct is under CONFIG_BPF_JIT.
raw_tp and kprobe progs can't load there either:

  select HAVE_PERF_EVENTS if 64BIT

> This is a cleanup patch, inspired by Sashiko AI review:
> https://lore.kernel.org/bpf/sashiko-outbox-228693@kernel.org/

That comment is about the new guard in bpf_insn_array.c.
Nothing is broken. I don't think we need this patch.
Pls don't change 16 files because a bot said so.

pw-bot: cr
