Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CE447ECE8
	for <loongarch@lists.linux.dev>; Mon,  6 Jul 2026 21:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374110; cv=none; b=NqMqFilsRPgkZqqJuQk1xTI9sMUa7k3kWOZB4+kbeK4YM6i0HufnbYybGXmE3rswkM/eFJSI5tnWtVT+wWU87NXr9KWrEVB5FGiFjU5UNWnSVNTqk8nn3CKlcXYyV7HyolDw9EUkjZ5hB3wQXMEJOgWMJGNoajFizyiiHQZ6LA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374110; c=relaxed/simple;
	bh=+zlMuA2f63v5NWpjsw4zSCanE6j88FQ9OFKGCMT/pr8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IwHmfRt6pONLUjybsJljoReHX3KButDR8+x4dOZWOWDjUE6SK+WHlAF6nGbyOIRE8e+4GX9tI/fyDEuO/4EXtFrwqhmFKlMmhiZCLBwdKNXnXjUO+aP/ECphZ+g9YcuPH7d+ZodU1WpTzgf6pq/yBRuN+P/gonbWm4s9ZHFkjmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CaEq/eQS; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CaEq/eQS"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381ed661712so3090874a91.2
        for <loongarch@lists.linux.dev>; Mon, 06 Jul 2026 14:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783374108; x=1783978908; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+zlMuA2f63v5NWpjsw4zSCanE6j88FQ9OFKGCMT/pr8=;
        b=CaEq/eQSQuNDBkI5Id2o3H53EnCVyi58EK/cDh9P6VlGmpJu/aripk9oEL/Jm2ilEL
         /eyWVis6dLIxFovyHZR3sqlNtLoFJqZQfsyKJ64DMAEcx9oLCnb9B5ZboXZmhSQMdQjc
         mCylCMcmYlsbR28XxuyOEDbiKQ9/n8KrNOrqXwqjbId1Pf/k50jsEuESm4ib0RKGU9H+
         IR7urFeYLJXQl7oTvosCVNv+OBg85yGdH+VgqojziwUsNoo3fVEZ71K0oGZq1q5ecx8P
         IH+07dOBlNQOyymTulNgB8oLt0+kL589+suXZL1FEyt4WH40VtcqDsV7eZKeZpXvZx65
         nHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374108; x=1783978908;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+zlMuA2f63v5NWpjsw4zSCanE6j88FQ9OFKGCMT/pr8=;
        b=rn80eTrhpDyAGdzUsNULkpUUIJHWJQbjjPTOPNPep+h0UUCtrkmp8V65AnSbB6OECL
         SfBM4EDhlRcrgpQrZRC2Tx4GkUBv1wgii1gx/OHraLKrdYKtrnS4SmQLC8XI5Mzv8F1F
         aBvAWuLBAjpEj++CWVp1i+BbjPzupabO4M96w+ovzVVDTw/u2EGkQTcUu8NZ/py1TRQj
         aC3/M+PHgtrCUeoDkt0f2Ed6h/57mwCXj5eh3M3VDJK168qEDxq1pP+/RfFZ/nbyHRBM
         9haxdk2Q2h07Y8ybWRZfHAtG0q/cOam0qOTPjSNp24HcQjo5FcvUwha7R0IIk2c3BjuD
         g0bQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8Ayt02Q8d6l4Ttky8b/tZ+AproCERTrYZTExkIQZSIS0CkIKQOVlvA82RENpkbfLPHrS5ghhefIA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzA+ZbudDYP0EE7UoFTsMsFrUHYIuAwn4WjFF12+GrM0RhVr0UD
	YUoGCcHNu03ie2sFvRm6gSQ3i7YX/4Mn9vGmxSf5bTQfEuB2W8gRLjER
X-Gm-Gg: AfdE7ckVehKlawR+/PlgyCDtsLOX5JOXD0NRAEiRyAK0CwlwnAlbazA+9pe6CXcoDDf
	o+PT2hL8uexi81347lxVkB60wst+yvnE70ZRDgiv+P26oy3Lu6aeVPhRa8s9zTCKEvnjZaYkvCr
	FUEYySTLRu3Rs3yuDxYYw502fxZt7++PyPIGoTWndTT/AGJvRlimF/EnCuK15OJFqrcS9AOuWFU
	TSNQcLODaINEJeouW3wbUsOSYZOw0N5tdKMGOzU/RGitKyZw6M8IyTXPa+op0o043hBUtP6zuyh
	6ROvxBh8gCzfGG8YCg3dQFYgbIDdbtLiwAL4lf91KptFZCPtWOWaeb/Wx31kkQoNWLJs2n06hWN
	UGEy4i0HsbBSpTuEwRiOw0K6WRLIJtfpIdvUWCwYhXz3aCOlk83b8K9d8332ZppuRbTocCHO8Xn
	HosJaOiCO3aX+apTcIbzjoILEG2VOoQCYR0FkSxuSXvJrSL9byEeqGSWzQakKdPFJPYFw0YA==
X-Received: by 2002:a05:6a21:e8b:b0:3bf:b931:b3ec with SMTP id adf61e73a8af0-3c08effc8c8mr2675609637.57.1783374108056;
        Mon, 06 Jul 2026 14:41:48 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:612f:7084:be32:532a? ([2620:10d:c090:500::1:55b9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483e0a2sm587541eec.12.2026.07.06.14.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:41:47 -0700 (PDT)
Message-ID: <abd697d839043d80e0230d2b9ab30b214dfa34d7.camel@gmail.com>
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
Date: Mon, 06 Jul 2026 14:41:45 -0700
In-Reply-To: <20260706040006.10331-3-yangtiezhu@loongson.cn>
References: <20260706040006.10331-1-yangtiezhu@loongson.cn>
	 <20260706040006.10331-3-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2026-07-06 at 12:00 +0800, Tiezhu Yang wrote:
> When an architecture (such as LoongArch, ARM64, and RISC-V) implements
> bpf_jit_inlines_helper_call(), the verifier skips rewriting the helper
> call offset (insn->imm) during the bpf_do_misc_fixups() phase, because
> the helper is expected to be inlined by the JIT compiler. As a result,
> insn->imm remains as the raw helper enum ID.
>=20
> However, if JIT is disabled at runtime (net.core.bpf_jit_enable=3D0) or
> if the JIT compilation later dynamically fails (e.g., due to OOM), the
> core BPF subsystem falls back to the BPF interpreter.
>=20
> When the interpreter executes (__bpf_call_base + insn->imm) with the
> unpatched raw helper ID, it jumps into an unaligned invalid address
> space, triggering an instruction alignment fault or a memory access
> panic.
>=20
> Fix this by setting 'jit_required' to 1 when helper call rewriting is
> skipped for JIT inlining. Loading will be rejected early with -EINVAL
> if JIT is disabled, or safely rejected with -ENOTSUPP during runtime
> selection if JIT compilation dynamically fails, effectively preventing
> the kernel panic.
>=20
> Fixes: 2ddec2c80b44 ("riscv, bpf: inline bpf_get_smp_processor_id()")
> Suggested-by: Alexei Starovoitov <ast@kernel.org>
> Suggested-by: KaFai Wan <kafai.wan@linux.dev>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---

Sorry, I'm late to the party.
As far as I understand, the patch #1 doesn't really change anything functio=
nally,
it just adds the flag, right?

As for the patch #2 and looking at the helpers that jits currently inline:
- bpf_get_smp_processor_id (implemented as a function in the helpers.c)
- bpf_get_current_task (implemented as a function in the bpf_trace.c)
- bpf_get_current_task_btf (implemented as a function in the bpf_trace.c)

It is perfectly fine to call these as helper functions even if jit is
not available. But this was broken since:
2ddec2c80b44 ("riscv, bpf: inline bpf_get_smp_processor_id()")
from May 2024, so I guess nobody really cares?

Imo, the simplest and least intrusive fix is to add a wrapper in the
verifier.c that would call both bpf_jit_inlines_helper_call() and
check if the jit is enabled and use that wrapper instead of direct
calls to bpf_jit_inlines_helper_call().

Anyway, since this was broken all-along, might as well land as-is.
Thoughts?

[...]
