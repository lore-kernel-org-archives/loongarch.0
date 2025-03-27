Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B9C2163B2
	for <loongarch@lists.linux.dev>; Thu, 27 Mar 2025 14:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743085976; cv=none; b=pKp+bQuMl8DQTzOAhpkQPp32rqZWpZQkkidFw+ngmzTT6vv3LtfAMHjVyMTY1tcbQ8/0nA/grFokPzo61b6nAB/q8ThjUiT2eBM55spzUtRAB4w0DNF1CKBRZHysk7kycily7HQDFpofZdVrpJn7IscjBFFu6LQh+SH9lAk3boY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743085976; c=relaxed/simple;
	bh=SlSpDNGcF9tes4e0zEu1wDuZRURWsxEymPc1Hxa3I+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rQy8fCQAN5TEWBNXxhqx6weuUvDfGW4ehqx03DVm8++nyLGYdlOEyd33imnnj2tyLfeN4h/MA6GaDC9gzgpN4szOC8x89NMZa5M9iMtZm+KkUvVzj3LIsMG0XjS1gARol3NYwv1lB0cKCu8ifQ6r6vG4t4SgcWg4d9Hi8vsRvMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6+k9ZEP; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6+k9ZEP"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-601a891ab8fso586577eaf.1
        for <loongarch@lists.linux.dev>; Thu, 27 Mar 2025 07:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743085974; x=1743690774; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9c+V+yyatY40KwSh2gkT+ww1rGMA56ItZglBMmFuto=;
        b=F6+k9ZEPOIVDrUsazK8fsJTEIGaWVaHeBJzaZT760E6Eu4z4P5ZnMlwBO8mo4CrzLn
         +eEF3RoJbI9rmfQTnsKYfnueFikxlfKZ3Ptj/F9jxMk/hB2TdV7oM2P36KVmyrNEAZRr
         OlSLKwR6UpJs5aW4wMZKPOabJ83riwW3LNncQD8K7uq2/3eTquTo7udByxTTrmpx6ZeZ
         a0/PCl1tlpVYnrBzcumL7jg3E6cBdxIkql9Npt6gKM6/ADK8dMHzp8x0wCma6vB1ctg9
         84n31Ck+KywA/u6o7+6hJIknw7jkloFdTiOqySqmhbGy15+uwN9Ok+rJkmbKGY2JpjqI
         Q8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743085974; x=1743690774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9c+V+yyatY40KwSh2gkT+ww1rGMA56ItZglBMmFuto=;
        b=HHNIZ64q7BNrWm+WfscEc2XhKC6Z7xKIqorBrtqTF8knSANdRRJ7YjuqgkVLqKSSvy
         yuPCsyH0K3G9H56IQS80fxJ4hoyjqMNhjiFhmHCt0sQDpbK0CI/K0fjQMKQIX2/JW/NP
         f1972wWljCdMYyBrjh5ghOjnc0uLCGHnRr/QiJxPathUjmFAwmdWtdlXOt2v+4jnOsaT
         k8AmwBhtpI4FNqW92wAUCMIeDKY3wudjApmL2xJltkfkxH0NZtZVMqfvVgv9ZgKwpkRf
         V3AU9CQAl7RNxhNSSK1Z/uIno0ZUAurMtx0TRDtIIslj5JJ45z2lQHZ6gOhpD9TFsErS
         BAmw==
X-Gm-Message-State: AOJu0YxE84lzriI5/kj0CdcFgx1Hzu4PLJbKpJ5xtaYW3esMNVB+EGzy
	rHJrWzKB+s66AgyQNX5sMmg/xh6RDEbbT8mNzkuKHxtexSSuKuNKsiV2VgmAnBzcUvxA8zgQ+LA
	QmzOoEhbO1QaceAOQIn+4LFsgIfg=
X-Gm-Gg: ASbGncsibQ+JrHalgxL2VxfkKOzibOy3citj4s9ex6GPe4L3pbdh9mhoK2YwHl/iWAm
	HNgr9H61Wd1LvuBPEhgVprygnxMlTqGPlgP1gaezRK8BPde+KGx5vALMfXNTIyorcm2MSx67Jbk
	q9aQymKTaG4l60H1o1pV6kKBaqZg==
X-Google-Smtp-Source: AGHT+IE54KQKqh8JZBtzoIUWRZtFp1/nOgJbkQ9uIBwjkDd27BigEFGZKOYoN1VpK0a8yH5tyuBBwL72JRS6OOzAQyM=
X-Received: by 2002:a05:6820:418d:b0:5fe:9b5a:531 with SMTP id
 006d021491bc7-60282f734a0mr274299eaf.0.1743085973885; Thu, 27 Mar 2025
 07:32:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250325141046.38347-1-hengqi.chen@gmail.com> <d4870294-86c2-c458-3b2d-b581afcd9fa9@loongson.cn>
 <98a786e6-4c07-c6d0-38ae-bc5c5f7eb1f2@loongson.cn>
In-Reply-To: <98a786e6-4c07-c6d0-38ae-bc5c5f7eb1f2@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 27 Mar 2025 22:32:43 +0800
X-Gm-Features: AQ5f1JonN7RXX3LYUkvLNYdba23POaq4dooYdtZLKiEvKoOwASq4jD92azsCGms
Message-ID: <CAEyhmHTA55=r2VzsTvRMeoqJnX+7_S7NQW4kT1TG-JD6FyUzWA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: BPF: Don't override subprog's return value
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, bpf@vger.kernel.org, chenhuacai@kernel.org, 
	john.fastabend@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tiezhu,

On Wed, Mar 26, 2025 at 12:13=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.c=
n> wrote:
>
> On 3/26/25 00:07, Tiezhu Yang wrote:
> > On 3/25/25 22:10, Hengqi Chen wrote:
> >> The verifier test `calls: div by 0 in subprog` triggers a panic at the
> >> ld.bu instruction. The ld.bu insn is trying to load byte from memory
> >> address returned by the subprog. The subprog actually set the correct
> >> address at the a5 register (dedicated register for BPF return values).
> >> But at commit 73c359d1d356 ("LoongArch: BPF: Sign-extend return values=
")
> >> we also sign extended a5 to the a0 register (return value in LoongArch=
).
> >> For function call insn, we later propagate the a0 register back to a5
> >> register. This is right for native calls but wrong for bpf2bpf calls
> >> which expect zero-extended return value in a5 register. So only move a=
0
> >> to a5 for native calls (i.e. non-BPF_PSEUDO_CALL).
> >>
> >> Fixes: 73c359d1d356 ("LoongArch: BPF: Sign-extend return values")
> >> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> >> ---
> >>   arch/loongarch/net/bpf_jit.c | 4 +++-
> >>   1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit=
.c
> >> index a06bf89fed67..73ff1a657aa5 100644
> >> --- a/arch/loongarch/net/bpf_jit.c
> >> +++ b/arch/loongarch/net/bpf_jit.c
> >> @@ -907,7 +907,9 @@ static int build_insn(const struct bpf_insn *insn,
> >> struct jit_ctx *ctx, bool ext
> >>           move_addr(ctx, t1, func_addr);
> >>           emit_insn(ctx, jirl, LOONGARCH_GPR_RA, t1, 0);
> >> -        move_reg(ctx, regmap[BPF_REG_0], LOONGARCH_GPR_A0);
> >> +
> >> +        if (insn->src_reg !=3D BPF_PSEUDO_CALL)
> >> +            move_reg(ctx, regmap[BPF_REG_0], LOONGARCH_GPR_A0);
> >>           break;
> >>       /* tail call */
> >
> > In my opinion, it is better to give a test case and show the test
> > result without and with this change.
> >
> > The test case should be put in the commit message at least and then
> > added into tools/testing/selftests/bpf or lib/test_bpf.c if not exist.
>
> Oh, it seems that there is a test case `calls: div by 0 in subprog`, so
> it will be great to add a test case in lib/test_bpf.c to test bpf jit if
> possible.
>

Don't think this is necessary, the verifier test is well maintained and
part of the BPF CI.

Actually, I am not familiar with the test_bpf.ko :)

> Thanks,
> Tiezhu
>
