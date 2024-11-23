Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A6F45948
	for <loongarch@lists.linux.dev>; Sat, 23 Nov 2024 15:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732377460; cv=none; b=DQcEBJye1rlgof+lr2qTXmBb1WSjo1ZdJ85E+QextWdznHlK0RKduWm/OMDh5jR6RinNIni5ZiBU7/nYC24J290FCzj0Nnbr/LoZ0Fe5Sp+BmSQf5Wj20Ia6hMuZUo6pfmIdE5B6vThUs/huvAcl8h3WxH363R5QabGop4vc5zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732377460; c=relaxed/simple;
	bh=hwWmkgrcAPGWl+ptMm1tghlsH4kqOvd4DTCxLptzDFk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=jYtBgmoXUvrDLxfCw+O46F9CSZuoAt68jbX5JSV+Lb8batGgsIaLTkWiRuiimQoH4YVP3OcaZ3qxFMFhsXtdhW6yuRrcQG4fxe0C3B+LZhgkrvhXVFhkbz5tP8hYPezW2oM78DWZbPgA9tR3PmEWhXkscsM+FWSlLKFvxul+LwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mv5jyFhg; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mv5jyFhg"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-724e1b08fc7so1554616b3a.0
        for <loongarch@lists.linux.dev>; Sat, 23 Nov 2024 07:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732377458; x=1732982258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7GR/93q8vbl1Y02szPjwXhKCJRJHqZnIo22AIrKeYk=;
        b=mv5jyFhg5Usr7x7Jk070efDHBlbfv34aqvG5m4iVaoABenfS02DQ6SJL7L3OuV+PaN
         KOvKiXFR0dkob0DGn3FpxvjYTdU2dSlanm93Bw4W2kx7uAg3B9e+lkHqHpo6Kw2jUTYs
         YFaQVw8a2zxlRK9CgufLCqp8BD336NpFEEX4EFoG+nWJt2A80Vp1qzIXpeKzoyXxmiwz
         OcgIRgvMYBF/7FeSE5y1bh/6Uv4cPN3m1jrBDG/+pUdOdLrcoECVCGQGjVJ5Qf/bAhku
         bod7pj4dvRqy6we9sXW1hk71lXSFCiUqpbEVEIwMrPOAPv6sJ3L7h5LnqzPnxESrC8Dx
         MUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732377458; x=1732982258;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B7GR/93q8vbl1Y02szPjwXhKCJRJHqZnIo22AIrKeYk=;
        b=aHDLyyS+Cc1j7yqlxTytOeqE9DG/O6C5WI4h8XmgZDySMOF2d1Kw3cFDWAZ1Fn5wPv
         Wb/aO4F8i9Lnt1bgUtYAVtfN2YguM0TDsk2zaoPiikFC7JbY+3QCqT77Hy3fkJ6NPSCt
         EBcXtYTugNgieh2Y9R1xxnZbk5YZhZ8ItRdsHrVkozfvfoAYyvNqs4uk9968o7lzfTx5
         tbrG0TNaLPOKJzVgQUG4jU8TrW7hkLho1BUcJ/Bocyi4dWodaof9XxlLhPoRNO9bS8mt
         xZfal5AjxfGGeOgv5PPADHv4hlk441OAMZ4sfL02JGa/lTgKDp7yTavjag5wT3rWg9Lv
         5MTA==
X-Gm-Message-State: AOJu0YybYUPiKP9dPYBD6WeEX1kBotsvoTlWoIHuqmMevxoLcMRIRCmP
	LLDqNSX8Q0GkynSA/Mo1ZP0TRBUOa0w8IdfJKgEMUyrp5JuviLRv
X-Gm-Gg: ASbGncvlplxdEMHvYJ4pFCviPi0FL/gK4cA0QmIeQLlXwglDjFHgST1RuZ3r13aMKyi
	o1efAOWqV0MgovFRkP8xxekPH+YA9Q+tqea2xbUDLkxv+6lLyALMukeb7E2K8wa36EfZzjdYNLz
	uhNPxFzu3WhmnsHuPHDr1juXCrHdArtNBTsQ9e9zwa3WsfgQzomh5xte4tlrUW3oLBNlUhkPfYW
	bf/vmnj0PNH+gvQhwiZLjh7DrAoUgnWmb2MfToKctyAnz6CNUg=
X-Google-Smtp-Source: AGHT+IFMJCfOvYOEF4yxWvSC12dnHHtF5pdzV67OyIXKQZXcx/OHeGlHJ4q3kn0LfBDukmlj77ZR/Q==
X-Received: by 2002:a05:6a00:10c8:b0:71e:47a2:676 with SMTP id d2e1a72fcca58-724df5d58ffmr9258267b3a.6.1732377456687;
        Sat, 23 Nov 2024 07:57:36 -0800 (PST)
Received: from localhost ([98.97.42.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de5762bfsm3505538b3a.184.2024.11.23.07.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 07:57:35 -0800 (PST)
Date: Sat, 23 Nov 2024 07:57:32 -0800
From: John Fastabend <john.fastabend@gmail.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, 
 bpf@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Message-ID: <6741fb6c516cc_c6be20839@john.notmuch>
In-Reply-To: <4f6c74e0-dd22-8460-96fa-f408291a3ef8@loongson.cn>
References: <20241119065230.19157-1-yangtiezhu@loongson.cn>
 <673fd322ce3ac_1118208b3@john.notmuch>
 <4f6c74e0-dd22-8460-96fa-f408291a3ef8@loongson.cn>
Subject: Re: [PATCH] LoongArch: BPF: Sign-extend return values
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Tiezhu Yang wrote:
> On 11/22/2024 08:41 AM, John Fastabend wrote:
> > Tiezhu Yang wrote:
> >> (1) Description of Problem:
> >>
> >> When testing BPF JIT with the latest compiler toolchains on LoongArch,
> >> there exist some strange failed test cases, dmesg shows something like
> >> this:
> >>
> >>   # dmesg -t | grep FAIL | head -1
> >>   ... ret -3 != -3 (0xfffffffd != 0xfffffffd)FAIL ...
> 
> ...
> 
> >>
> >> (5) Final Solution:
> >>
> >> Keep a5 zero-extended, but explicitly sign-extend a0 (which is used
> >> outside BPF land). Because libbpf currently defines the return value
> >> of an ebpf program as a 32-bit unsigned integer, just use addi.w to
> >> extend bit 31 into bits 63 through 32 of a5 to a0. This is similar
> >> with commit 2f1b0d3d7331 ("riscv, bpf: Sign-extend return values").
> >>
> >> Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
> >> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> >> ---
> >>  arch/loongarch/net/bpf_jit.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> >> index 7dbefd4ba210..dd350cba1252 100644
> >> --- a/arch/loongarch/net/bpf_jit.c
> >> +++ b/arch/loongarch/net/bpf_jit.c
> >> @@ -179,7 +179,7 @@ static void __build_epilogue(struct jit_ctx *ctx, bool is_tail_call)
> >>
> >>  	if (!is_tail_call) {
> >>  		/* Set return value */
> >> -		move_reg(ctx, LOONGARCH_GPR_A0, regmap[BPF_REG_0]);
> >> +		emit_insn(ctx, addiw, LOONGARCH_GPR_A0, regmap[BPF_REG_0], 0);
> >
> > Not overly familiar with this JIT but just to check this wont be used
> > for BPF 2 BPF calls correct?
> 
> I am not sure I understand your comment correctly, but with and without
> this patch, the LoongArch JIT uses a5 as a dedicated register for BPF
> return values, a5 is kept as zero-extended for bpf2bpf, just make a0
> (which is used outside BPF land) as sign-extend, all of the test cases
> in test_bpf.ko passed with "echo 1 > /proc/sys/net/core/bpf_jit_enable".
> 
> Thanks,
> Tiezhu
> 

Got it.

Acked-by: John Fastabend <john.fastabend@gmail.com>
