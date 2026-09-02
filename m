Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com [74.125.231.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98848339390
	for <loongarch@lists.linux.dev>; Wed,  2 Sep 2026 01:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788311617; cv=none; b=bksCvdRyWW/Jq2k5xljiCn0L8rbnqAOk1UtlieWwzIqQTwN1GVfuGSbAuja+9M1O6KaQlkGm7rMe7lDHRjk/DWX896+dw9dKj+NJLR9qxhKsRxPyaVhsTpm81th90PNTbl1sA44xe28s62XGEMMNKfOD5Mezm4fBVCJC54oWnTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788311617; c=relaxed/simple;
	bh=mthsAuvC5kxwl9HoC2silixWp9Aei1Pp/kO4Vu2EIZk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Yv6dbnU+Wq2EPYJiFnNOjDwHa25v3PDSWlGQ+EP3aD5a+XGHig8EMj87bCl/IfLaDBh37td5v4SRIhoqjB9WPUwBeWUl/t6NUHoQUizk3piwZcU7iFtFLHp80LGa0ZSOg9HDDvJL3W+bCF+gMP0eZrDejXBAR68NB2USKNH3V3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WzxWBMxm; arc=none smtp.client-ip=74.125.231.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WzxWBMxm"
Received: by mail-oo2-f5.google.com with SMTP id 46e09a7af769-7f4e10aa28cso63674a34.0
        for <loongarch@lists.linux.dev>; Tue, 01 Sep 2026 18:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788311609; x=1788916409; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mqO5MLc175YVYlL4+Bawb4s5pN8s4dKpvKfmlQW7U1I=;
        b=WzxWBMxmmAnw7ruARTqok+0svl2bvwI7sAES8okCTrERuLnCYTmbDhNx4xHpb9LmmK
         YvdRAz2Y4oBlmGkT5K7+Wv+Qfz7n/sjSt6FHw/BZ/k3DfS1bBCLIa1/EUwj8C9IfmnpI
         KdHYS0PXTwr59ct811gQbwWyEaWtzKbhYRdL6eD5Wy20JNw4GRL7KnGVbVs046GL2Lss
         8+/rXPTF0WkX4LPdVH+iG6OAjcgLoAhHHa4cw5YLPdBjmWF9xMs7gYcPZhzNtVelwaIK
         8uvmiALDveB+n9hXtk03qmckz51GuDy2oYX/7BMpmxoO4tZ7IIEeEK+e3JtjFaZFDGDj
         SvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788311609; x=1788916409;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mqO5MLc175YVYlL4+Bawb4s5pN8s4dKpvKfmlQW7U1I=;
        b=IiRUUJXHyzO4p2aYIptfmm8RoxplcMFv7G9Br++HWFr8swqZZzgSFXiGgYC+7k/Ktl
         mwdTo470JsJYixeutRuYm0a3ZB/slDQHjJViqTP/cwm92ifnExyQNuU+ynWascMEw49f
         2+9wZxZLmYEwWfDuCrkdM6Ct9WifF7OUcZjU1zeJyegqm0WxgBzt4cq91pkj821Mqrad
         y1L2YwpWwng8HQTMTiQ8GLU+Mj1HB1BZMtzzJd5pF7Yngc3YjTs+PwzIzFl0sbrWQ9zk
         3FeK0GUzFK2DqeS9ZnynHTndOHclB/+nnB/XUfaJDcfJOyaViOlDDoKFCdJQyTTBpf7m
         TOWA==
X-Gm-Message-State: AFuF++nuxOlbvrGavaFkJUBoJL64Suy+XcjjTvyty0p3FObp4jonSnhA
	8VuK8nH4+4XiJgM5IBzG0+A0z35zJ05nOin0ouiS1ufOdFo4JLjcW+Tp
X-Gm-Gg: AR+sD13JtAHkVQbWIzE0yw5ayZXO1lEwYZpGz5D9Elarcfz6JnsU5+dgFO5vh91nvQm
	TEk4DRE3z6NI4L9DdtAroF6bao6NG2x5gTFR82pTrMSTBi+ch+fcF/RV1tMjezLHf8JH/6mlskc
	mL523meyAo1q9LcHh5G+meMnLWDSdml4qL9hgs4wou4Qx7wqR84yqnYBmSU6roiK8mFdCLyT/Cd
	ByqO8tEgiFbW4cR+WkSHLt/wV2lwasxFEb1s5LadapH4VqHEXOakOvzFvQ0N2G6is1QckmcI/3f
	NOjsBiLyDsMbzYQ/FgXTB2hGKvMgBxDxwWPoMS4uHcsZOWu069Hqiyrir0R3ukeDhEAyd6FxiZp
	C7UUaTZHpLSkkyR5jiPbvk3tFaGJT4U23Wj6NcP6yI4KklOzbyRqLeq/2gOF13r//KZ3WgVYAjj
	i09hZ687qSDo2fNx7urjTVTOZsJS3CnspAkl1Oax80c9ApITI+A7Z1cnb/O4zmNvkrFQCU1AyJX
	Eazxn3AXMeR1FMPpZ74O8iddM0+IR7EsFKKCIAKCnpwtDcWEgVBz8mmhIFYyhfeDn0NuF6EmiE5
	3oUMnq8=
X-Received: by 2002:a4a:ec46:0:b0:6b1:4e37:41c0 with SMTP id 006d021491bc7-6b48103a707mr855739eaf.19.1788311608778;
        Tue, 01 Sep 2026 18:13:28 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:40::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f74f9ec644sm1036500a34.24.2026.09.01.18.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 18:13:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 03:13:26 +0200
Message-Id: <DL4FK2P8LMEQ.216J5ZMX9B7VC@gmail.com>
Cc: <loongarch@lists.linux.dev>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf v1 RESEND] bpf: Fix timer_lockup deadlock using
 atomic_fetch_inc()
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Tiezhu Yang" <yangtiezhu@loongson.cn>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>
X-Mailer: aerc 0.22.0
References: <20260902005106.22187-1-yangtiezhu@loongson.cn>
In-Reply-To: <20260902005106.22187-1-yangtiezhu@loongson.cn>

On Wed Sep 2, 2026 at 2:51 AM CEST, Tiezhu Yang wrote:
> When testing the BPF selftest "sudo ./test_progs -t timer_lockup", there
> is a kernel lockup and panic on LoongArch:
>
>   watchdog: BUG: soft lockup - CPU#1 stuck for 8s! [test_progs:39601]
>   Kernel panic - not syncing: softlockup: hung tasks
>   ...
>   Call Trace:
>   ...
>   [<9000000000c40e98>] panic+0x44/0x48
>   [<9000000000e8b000>] watchdog_timer_fn+0x500/0x520
>   [<9000000000dfd9a4>] __hrtimer_run_queues+0xc4/0x530
>   [<9000000000dffe90>] hrtimer_interrupt+0x140/0x320
>   ...
>   [<9000000002ad9e4c>] _raw_spin_unlock_irqrestore+0x8c/0xc0
>   [<9000000000dfe9e0>] hrtimer_try_to_cancel.part.0+0x70/0x350
>   [<9000000000dfed58>] hrtimer_cancel+0x38/0x80
>   [<9000000000f6d944>] bpf_timer_cancel+0x94/0x1e0
>   [<ffff80000200fad0>] bpf_prog_108ab87b32f22e44_timer_cb1+0xb0/0xfc
>   [<9000000000f6b838>] bpf_timer_cb+0x98/0x170
>   [<9000000000dfdaac>] __hrtimer_run_queues+0x1cc/0x530
>   [<9000000000dfde94>] hrtimer_run_softirq+0x84/0xd0
>   ...
>   [<900000000271d9e0>] bpf_test_run+0x1c0/0x5c0
>   [<900000000271f548>] bpf_prog_test_run_skb+0x6e8/0xe20
>   [<9000000000f39940>] __sys_bpf+0x1690/0x2c50
>   [<9000000000f3af28>] sys_bpf+0x28/0x40
>   [<9000000002ac2d68>] do_syscall+0x108/0x5e0
>   [<9000000000c6a850>] handle_syscall+0xd0/0x170
>
> In bpf_timer_cancel() of kernel/bpf/helpers.c, it explicitly notes that
> "Need full barrier after relaxed atomic_inc" to ensure global visibility
> of the cancelling state before performing the lockless dependency checks.
>
> However, on weakly-ordered architectures such as LoongArch, the current
> combination of a relaxed atomic_inc() followed by smp_mb__after_atomic()
> fails to guarantee the physical store-load ordering because the latter
> currently expands to an empty compiler barrier rather than a hardware
> data barrier on LoongArch.
>
> This allows a subsequent read to bypass the prior write due to store-load
> reordering, enabling concurrent CPUs to simultaneously bypass the softwar=
e
> deadlock detection, enter hrtimer_cancel(), and then trigger a severe ABB=
A
> deadlock in the hrtimer core.
>
> Instead of relying on arch-specific macro implementations which may vary
> in strictness, fix this issue directly in the BPF core helper by replacin=
g
> atomic_inc() and smp_mb__after_atomic() with a single atomic_fetch_inc()
> to provide full ordering natively.

This paragraph is completely bogus. LoongArch's smp_mb__after_atomic() had =
a
bug. The specification in LKMM for smp_mb__after_atomic() is that it should=
 be a
full barrier, which can be relaxed if the prior atomic operation already
provides the necessary ordering.

As I already said, there is no point in changing or "optimizing" this atomi=
c
inc. Just let it be. You will see no measurable difference for this functio=
n.

Just accept that it was a bug, and fix the lowering for your arch. Plenty o=
f
other logic in the kernel uses this primitive, so I think you folks were ju=
st
lucky this wasn't hit before by something else.

> [...]
