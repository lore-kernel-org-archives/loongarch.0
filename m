Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F38233929
	for <loongarch@lists.linux.dev>; Tue,  7 Jul 2026 09:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416431; cv=none; b=BqrPNT+hsOUYp06vv+K6lltl8b5Lb521wr8l6e6q3l9BWtbrEEl8O013DPtTxDC/W46kdYTPFe8czkGYuxCJk1tHEtPTBsBLQS33AIt3iDsHEAIyR0Rza6MvDxows4Y1p4Jm/sNA8ZGSBrHXPdgqi0kA47LrEF7zUP9aHSzUrLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416431; c=relaxed/simple;
	bh=R/Ik5SAwXJUrqpt2kvjRGMeAGlzi/WQ932Xmmd0UumE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nhzYN9pvAeMwMn8eKCEwPdEfL0Dk6JUT6vpQywhBwhusp6LS6Vu3ADPWU6e0erbprHpLUrAX5auIggUFt30PJjssdevq6LD7C9mDFIZ5hld5W7baYumksvrCqQrqw0TAGisoD7RH2eaaiXhqwK1V4HCApiJwB8ubXqTtvJ31bJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwVBeLil; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwVBeLil"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cacd69a9c0so33852295ad.1
        for <loongarch@lists.linux.dev>; Tue, 07 Jul 2026 02:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783416430; x=1784021230; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=R/Ik5SAwXJUrqpt2kvjRGMeAGlzi/WQ932Xmmd0UumE=;
        b=AwVBeLilekwnmIds3WsV1ckThqDDpYBjCKubnhkyOvTBokYpqVnTCDY+Mbj/PqSpBn
         7dRter36N8yHhq8BwNzTXHd8WTCXO5QD3fio0GDPaaVb8BdkfGxVE8EeIi1zRotqinX8
         QpglDs1L5HqiT3GJZuiaDUVpjzt3ddCAd+FzfFAGiZrSiLYtN6ssX+S4p1VBIfSYMZb4
         tFUPMwOe5lyZFMX8B9Sf41e842RwHW4sJYS7kYyH8tYK/PIMQIOwrzMyJ2wq0a0Z/yNU
         +Lf6/fQI81CN5u6BL+/+LQKA5cfTW5HI29R0q39si/eWoRD9by/z36UD+eBN6iEkeX5G
         hpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783416430; x=1784021230;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R/Ik5SAwXJUrqpt2kvjRGMeAGlzi/WQ932Xmmd0UumE=;
        b=Oyhec2lsfwHvyVWmcW/jEW4bfg+K7MGMbSPtaCxR12NMiAY+OSV6CptblxlwIEVpjN
         YqaodrCoh8FEVGQOWfzk+XjE7ugwa61hzVTZcFuuS95/zJrryGI5ExK4PdQNU5YPAsFT
         Pv91XGmpPPJJRHQ1Vxt6YrrAU102p9pUfEbEe4YZNL1Mso+ReyTnVRcCJHJ2Al8ECMKK
         0tmYDu9GzcpfoR3YIZli5T47tni+zdiZgU8r04zr2wSBsSYAIgNtefmHwELPN5dl24ab
         CgQaPWzZVD65tb3TzI05iUfCpAw+2Z+MwECOklPmsdZgxjcRGXf+QrW2IlrRSJVRHlYN
         GQXg==
X-Forwarded-Encrypted: i=1; AHgh+RqViFq6fv3QTvrCZE42Ic9iqSzmHkWXjtj40vNwxaJyc0CQDhLKgb+sCRHjld11kwWugnM57xpttUQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwhTQjmFPngsR+npHQKSY0sziAn4wwQ9XhFCz3CNy9qbO9Txo1
	Wi1+NBgNyqeBAH5zXIy739aF3f5emdX9TPycZIy4rz1vJnlJi0Ap3vyFuIatW9Fg
X-Gm-Gg: AfdE7cna2wz/U1871/g8Mjsaj4o5T5smh9+qSe3ZRo8kD8Bgk1l32rnBeMIYEKiTXQJ
	lxLOSfUp0Zbx39mwEA3xe//U5I0M/JiglJoeyTTDOXpJbuigU9uq1dwZgh4SOa3AORenusUNYQ5
	3dau4FT9ZIZo0DnG9EBMRlmwgVJPJ4q5wxsP8oATBB90GvLSMlUMpqMO6P2cYA/LZ7xBXKmqeSX
	6s91GrDhHjU5CZlbuHwaPtH/ENvuvndxNiI+6Sn401ImhjK5PD/aXv3cjjxK/i4uI+RaEcvDx0o
	CrNIngg5TEZodu7wIJAKnFY0F87AuDqABcXHBjICKX+c3gVFhmaYCQCwaB1qy5p3lDQlnNH2kth
	BXIshw3TxcAnoxOv3EG5LR7caZVswdWPh42QxSPp6exdwDvpWvmznPlvWNVwPaIfZ1EzLwebhN8
	+0/Nfw87hZL5o9bl/A3W5UJGK08y3/i8h43BsMouSA
X-Received: by 2002:a17:902:c402:b0:2c9:bd64:8c8b with SMTP id d9443c01a7336-2ccbee1f011mr49355895ad.31.1783416429639;
        Tue, 07 Jul 2026 02:27:09 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e1aesm8350915ad.39.2026.07.07.02.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:27:09 -0700 (PDT)
Message-ID: <1c1738784ae321ed5c9dfa0aca6d0f483592713f.camel@gmail.com>
Subject: Re: [PATCH bpf-next v8 2/2] bpf: Reject programs with inlined
 helpers if JIT is not available
From: Eduard Zingerman <eddyz87@gmail.com>
To: Leon Hwang <leon.hwang@linux.dev>, Tiezhu Yang <yangtiezhu@loongson.cn>,
  Alexei Starovoitov	 <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko	 <andrii@kernel.org>, Kumar
 Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>,  Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis
 <emil@etsalapatis.com>, KaFai Wan <kafai.wan@linux.dev>
Cc: bpf@vger.kernel.org, loongarch@lists.linux.dev, Puranjay Mohan
	 <puranjay@kernel.org>, =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Date: Tue, 07 Jul 2026 02:27:06 -0700
In-Reply-To: <e86ba5c0-41c2-4492-a316-7693c7d8d3fd@linux.dev>
References: <20260706040006.10331-1-yangtiezhu@loongson.cn>
	 <20260706040006.10331-3-yangtiezhu@loongson.cn>
	 <abd697d839043d80e0230d2b9ab30b214dfa34d7.camel@gmail.com>
	 <e86ba5c0-41c2-4492-a316-7693c7d8d3fd@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2026-07-07 at 10:03 +0800, Leon Hwang wrote:
> On 7/7/26 05:41, Eduard Zingerman wrote:
> > On Mon, 2026-07-06 at 12:00 +0800, Tiezhu Yang wrote:
> > > When an architecture (such as LoongArch, ARM64, and RISC-V) implement=
s
> > > bpf_jit_inlines_helper_call(), the verifier skips rewriting the helpe=
r
> > > call offset (insn->imm) during the bpf_do_misc_fixups() phase, becaus=
e
> > > the helper is expected to be inlined by the JIT compiler. As a result=
,
> > > insn->imm remains as the raw helper enum ID.
> > >=20
> > > However, if JIT is disabled at runtime (net.core.bpf_jit_enable=3D0) =
or
> > > if the JIT compilation later dynamically fails (e.g., due to OOM), th=
e
> > > core BPF subsystem falls back to the BPF interpreter.
> > >=20
> > > When the interpreter executes (__bpf_call_base + insn->imm) with the
> > > unpatched raw helper ID, it jumps into an unaligned invalid address
> > > space, triggering an instruction alignment fault or a memory access
> > > panic.
> > >=20
> > > Fix this by setting 'jit_required' to 1 when helper call rewriting is
> > > skipped for JIT inlining. Loading will be rejected early with -EINVAL
> > > if JIT is disabled, or safely rejected with -ENOTSUPP during runtime
> > > selection if JIT compilation dynamically fails, effectively preventin=
g
> > > the kernel panic.
> > >=20
> > > Fixes: 2ddec2c80b44 ("riscv, bpf: inline bpf_get_smp_processor_id()")
> > > Suggested-by: Alexei Starovoitov <ast@kernel.org>
> > > Suggested-by: KaFai Wan <kafai.wan@linux.dev>
> > > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > > ---
> >=20
> > Sorry, I'm late to the party.
> > As far as I understand, the patch #1 doesn't really change anything fun=
ctionally,
> > it just adds the flag, right?
> >=20
> > As for the patch #2 and looking at the helpers that jits currently inli=
ne:
> > - bpf_get_smp_processor_id (implemented as a function in the helpers.c)
> > - bpf_get_current_task (implemented as a function in the bpf_trace.c)
> > - bpf_get_current_task_btf (implemented as a function in the bpf_trace.=
c)
> >=20
> > It is perfectly fine to call these as helper functions even if jit is
> > not available. But this was broken since:
> > 2ddec2c80b44 ("riscv, bpf: inline bpf_get_smp_processor_id()")
> > from May 2024, so I guess nobody really cares?
>=20
>=20
> Vincent Thiberville reported an interpreter fallback issue for the
> internal BPF_ADDR_PERCPU insn [1].

As far as I understand, [1] is caused by map lookup helper inlining,
bpf_jit_inlines_helper_call() is unrelated this mechanism and only
covers that three helpers I listed above.

> And, I was trying to fix assorted interpreter fallback issues [2].
>=20
> I think it is worth fixing the interpreter fallback issue for the JIT
> inlineable helper.

Meaning that you'd prefer the bpf_get_smp_processor_id() and co to
work correctly w/o JIT, do I understand you correctly?

>=20
> [1]
> https://lore.kernel.org/bpf/MR1P264MB331494502C9D13D8A9EAFB99B7E82@MR1P26=
4MB3314.FRAP264.PROD.OUTLOOK.COM/
> [2] https://lore.kernel.org/bpf/20260626154330.33619-1-leon.hwang@linux.d=
ev/
>=20
> Thanks,
> Leon
>=20
> >=20
> > Imo, the simplest and least intrusive fix is to add a wrapper in the
> > verifier.c that would call both bpf_jit_inlines_helper_call() and
> > check if the jit is enabled and use that wrapper instead of direct
> > calls to bpf_jit_inlines_helper_call().
> >=20
> > Anyway, since this was broken all-along, might as well land as-is.
> > Thoughts?
> >=20
> > [...]
