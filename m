Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1B53909B5
	for <loongarch@lists.linux.dev>; Tue,  7 Jul 2026 09:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415615; cv=none; b=Jh0NWBzZZ+tlZ1h6tmzfnGAh6tGiuaE4oo8KrjlZsUuuSeyztLRVuo9JhflycveZZIEL4JPrEOAB5go3nRNQlzLHK5QGt8iAHOgILIfiG7234BlhizqSVRHu4ntQkG2x5w0/OBStVOhU4Hy8iyNFj4a5UnloUD2oHgMBIT3q8FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415615; c=relaxed/simple;
	bh=SAMsfCqQ90e8Mr+Byud3oSw6Ke4rL+V87eU2pPZa88k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N+5oN5rT4V9pLa61qfOK+7LCxCDrtw1BtIk7ImzGy+VER8MJ0hGoMmCxt8mrR2A7DsmsGpNcf7D/MS2mxg1IscuMhk2TUNe1hsO80XuJSfcQaV3i0VBjaxNCt88rLc601UkWGOTQpcVQ5j+xGtvzi7rB3sxiwQ3QNZKJE583zJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCHFCrVp; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCHFCrVp"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so2962325a12.2
        for <loongarch@lists.linux.dev>; Tue, 07 Jul 2026 02:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783415613; x=1784020413; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U/SgXEBGKzfENQtAx4I6q1a9J5/Avyd8/iNOtQpGsWw=;
        b=ZCHFCrVpU1Sm2/CWENqNxAasplOeanyTbA3fQgA76J3XMnWW6IpVq+pWfZfvav7/eZ
         ImSyXakcitrpe1jeZaNiBmNGAsA5x1dPH9oV0HL9O1qRXBNAvMwPBYBr8yXyPNAP9GfK
         p7D8pVcuS6G+kZhf7qjuvLT1jvwFXeSXMc9FiIiTh5xsUkX3FuJqQ7U9tUv5YHkvBDRI
         bhl7CVKe/iZzUYurBnZsPSTz0vGs4DhSd5darYatqhXmvFWNIJOP67Ab+Fts2P/CLETg
         5Y7zWHzz73s/JyET3wA6LaqjZR9CvYd5eUSj60vVC0Y1LVg0nxasMZLxf4hwSVQTKBjF
         dpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415613; x=1784020413;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U/SgXEBGKzfENQtAx4I6q1a9J5/Avyd8/iNOtQpGsWw=;
        b=MIt7QJg12k5CjZxqs1sKiaWLRo5qzqHS0PyGndOobjzQz57T+rSCE6Jdn1TU8XmwAO
         zpGSwXVsccq13lo5Ot/iyilOAHCvtYuOQGgsYi4f1HrOEcQlnFUGQ83nk2k83d8HCPUY
         8m0O4yMqif2VP/LBXgcUbN6dXPyiviNLhq86zqERERV59zAHuMXSkkYlQlhYIUQIGOKk
         6GcIfkIxyAISSjCWwz+FFSNScM0k6N7fXw8AQXIpY3dhCmS0m5yK4ZmCn36rzlQgKpN2
         OEc1aqcrtfwJ8W4SRuTrd9d6YcqHfvPWSzLKGFAA72ljKDkb3McvnJBjPSYiyRUkjpCU
         UqZQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYSyf+OSryStBM8sE9MkzUp57M41U20cO1CpYcLKPT1zLNux20bx1KTW/2Wzcmv17hvs9hJ1nMMBE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpALcLjXe3xwuaBchby8+mtnnZV691J9RrAyE99UdIU4W9iVoj
	9kLVjbIcxzHh+VsPU4FWdUQGr/fgcXHYWA5Bn7uZwmjTMbOaIwTpif4M
X-Gm-Gg: AfdE7ckgnZ2ZGnQ1hFJvlpmRSgyF/dIgXQCLNi0gf8pgmCAgTTYY+Z1PEL5qghzKC+v
	7ywaGcETvwUa/hW0iU+G0IBKzBzsliIw7yihsuRxCkF7AeDQQcJ5T9Sn5huRaD92bt5w7g2NURk
	3paIGBn125iFXOVpaOnSZ+Qies4SfTcgv/NlpTfCKVegXWRagcgAoNkLn/+EAvpL9subqfXXqiu
	7OhmmFRtPgsIOIVod+eqS2lrWmPPt/tmRCzO8YjBfni2ChvGVLO7HrA6RdBKkIan1mLBaMbU2ye
	Q/Qv8tLwhnnnkgtDY63DamAfyjrRmfopcWd+LHdYkdIQ4PQdKD41oJYDxV+D2nmaxnq3FgZKMps
	dAP3GBoLi5MGnEIkKIIBHglua1E5nI6bFEt1IQppBDMMkIJ4ddshZbkqf/IT1+hUwn5srhrVc47
	b6cAW17gCPnRrSI6GVvWjyAcb+aiXAfB+Li+msjxh1
X-Received: by 2002:a05:6a21:7a43:b0:3b2:b1ed:d1df with SMTP id adf61e73a8af0-3c08ee5184amr5383065637.29.1783415613019;
        Tue, 07 Jul 2026 02:13:33 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3a2e42bsm650999a12.30.2026.07.07.02.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:13:32 -0700 (PDT)
Message-ID: <cab476b7a3e205164d43f791d84b0e0b8101d974.camel@gmail.com>
Subject: Re: [PATCH bpf-next v8 2/2] bpf: Reject programs with inlined
 helpers if JIT is not available
From: Eduard Zingerman <eddyz87@gmail.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Kumar Kartikeya Dwivedi	 <memxor@gmail.com>, Martin
 KaFai Lau <martin.lau@linux.dev>, Song Liu	 <song@kernel.org>, Yonghong
 Song <yonghong.song@linux.dev>, Jiri Olsa	 <jolsa@kernel.org>, Emil
 Tsalapatis <emil@etsalapatis.com>, KaFai Wan	 <kafai.wan@linux.dev>
Cc: bpf@vger.kernel.org, loongarch@lists.linux.dev, Leon Hwang
	 <leon.hwang@linux.dev>, Puranjay Mohan <puranjay@kernel.org>, 
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?=
	 <bjorn@kernel.org>
Date: Tue, 07 Jul 2026 02:13:29 -0700
In-Reply-To: <33d3eb99-ef5a-5413-b2f6-3217b54cce4d@loongson.cn>
References: <20260706040006.10331-1-yangtiezhu@loongson.cn>
	 <20260706040006.10331-3-yangtiezhu@loongson.cn>
	 <abd697d839043d80e0230d2b9ab30b214dfa34d7.camel@gmail.com>
	 <33d3eb99-ef5a-5413-b2f6-3217b54cce4d@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2026-07-07 at 09:37 +0800, Tiezhu Yang wrote:
> On 2026/7/7 =E4=B8=8A=E5=8D=885:41, Eduard Zingerman wrote:
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
> >=20
> > Imo, the simplest and least intrusive fix is to add a wrapper in the
> > verifier.c that would call both bpf_jit_inlines_helper_call() and
> > check if the jit is enabled and use that wrapper instead of direct
> > calls to bpf_jit_inlines_helper_call().
> >=20
> > Anyway, since this was broken all-along, might as well land as-is.
> > Thoughts?
>=20
> In the previous v4 [1], there is a similar way to fix unaligned
> interpreter panic on JIT fallback path, but it was explicitly
> rejected by the BPF maintainer Alexei [2].

bpf_fixup_fallback_helpers() is not at all what I suggest and is
indeed a terrible idea. What I suggest is something like:

  bool bpf_inline_helper_call(...)
  {
	return bpf_jit_inlines_helper_call(...) && <jit-is-enabled>;
  }

Used in verifier.c and fixups.c to decide whether to inline the helper.

> Furthermore, Alexei
> said "The interpreter has to be removed completely... sooner
> or later." [3]. So if JIT is not available, rejecting the program
> load is the intended design.
>=20
> [1]=20
> https://lore.kernel.org/bpf/20260615025316.24429-1-yangtiezhu@loongson.cn=
/
> [2] https://lore.kernel.org/bpf/DJMRIZ5PDWP4.12OOZ8H881H6O@gmail.com/
> [3] https://lore.kernel.org/bpf/DJN001X0S57Y.18CKUS4NDDQT1@gmail.com/
>=20
> Thanks,
> Tiezhu
