Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF783B8955
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 09:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777456384; cv=none; b=ozhF2YPD4ikuTU7BWsUEmUhuSyXEmSoc9lyLBmzXHCFMBzUYFBDlL0WGCHrYnJ6Jc1h6ENlqSADOWzpCvkwR0yX2H0tUnmxdW8DN6anReTf9L/r4mqe1xjURb/H69CKATMwcwFwQXqei1Ld9Gf6YBIsH1AQCCIcmF48v9QfDJSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777456384; c=relaxed/simple;
	bh=SfAe5z76KpyTy+2Tz85r4N7KkagN59Wf81GU2C4jSKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MdFN7bqawlF9GWpOwX7hq0L65pHEIUUE2Q0dZv88u9S752LOLm3fTm7dkEQ8wbOLPIFer3Cj/5RLgqNClomvmni1XzKJe4PUq4FrgvN6fJZeldStS1T0pN78wTNE4xVmHGSWQR1PGwYmlIQTUonSJ8w90UWCeMP9B72HadK2MmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dp3WE6Rx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dp3WE6Rx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03881C2BCC4
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 09:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777456384;
	bh=SfAe5z76KpyTy+2Tz85r4N7KkagN59Wf81GU2C4jSKA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dp3WE6Rxf2XR3ZbuTdAPePacw+1B8hGLP7OTFQEmiZRxspdQA9yTpFsbZehRK80dp
	 eHWuUoM7aeKeqgL4hR6pz3WLUd+8/QpDm3gqcSS6+BV5g6IakCU92E3GSD/EWsUaVM
	 ni8QzkoVTdPOY8d+7kWX63o9myQwSZinT4GVLYUJx0Ltqh13M0oVD+8MN3JT8xH3st
	 DJxIqEYAqCU+AvlWX6jN6DLltLLnWkRX+SvTthgo/VAISLu4bNqKpYm7M3647UAwBy
	 YEdjjnji0Zo8BaYUpap6e3/jMo0EUUX8HSeorSpggEFuljQQnhBpB2/WuUihCXmdiI
	 j3LuHQxgzGHzA==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ba922426c5cso1078993166b.3
        for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 02:53:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9SGHHIzQc1+UH5vlHHI3WkWOeXuVbMaB+3l5oyLDHMIkMzu4ECu/ha3ZOahAcxzgjX95jv/Jjjkhs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzAaDiqTKWyPHF2nl4y1rBf7jnv05LMe075l0CHL4a2SI3p7jwv
	fABMrK1pBi9TupT1/M0bEcPXv17aXu+oZxJymy4xM/m1M+L/bNrfMbkSmPEO5L2/ssdeLx+yPyy
	SUDb7Fh16F04wTTQBqfzyh/V/jkbab8A=
X-Received: by 2002:a17:907:c48a:b0:bb2:71a9:37d7 with SMTP id
 a640c23a62f3a-bb803e5d204mr421956866b.39.1777456382555; Wed, 29 Apr 2026
 02:53:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428130031.409066-1-cuitao@kylinos.cn> <bdfd9d8a-7614-420f-0ef3-fddc694fe9e4@loongson.cn>
In-Reply-To: <bdfd9d8a-7614-420f-0ef3-fddc694fe9e4@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 29 Apr 2026 17:53:16 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6xGgm2mRLZFOMmqKZr503YnSKGsBssoVceTrfDs0hPKQ@mail.gmail.com>
X-Gm-Features: AVHnY4LfV4T4m2LwmYaA05vZX2XAfwUBxhR4gE7ZK1a1f5K_TQi5WlHZrQjPbko
Message-ID: <CAAhV-H6xGgm2mRLZFOMmqKZr503YnSKGsBssoVceTrfDs0hPKQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch/KVM: Use kvm_set_pte() in kvm_flush_pte
To: Bibo Mao <maobibo@loongson.cn>
Cc: Tao Cui <cuitao@kylinos.cn>, zhaotianrui@loongson.cn, loongarch@lists.linux.dev, 
	kernel@xen0n.name
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 11:25=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wro=
te:
>
>
>
> On 2026/4/28 =E4=B8=8B=E5=8D=889:00, Tao Cui wrote:
> > kvm_flush_pte() is the only caller that directly assigns *pte instead
> > of using the kvm_set_pte() wrapper. Use the wrapper for consistency
> > with the rest of the file.
> >
> > No functional change intended.
> >
> > Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> > ---
> >   arch/loongarch/kvm/mmu.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
> > index a7fa458e3360..e104897aa532 100644
> > --- a/arch/loongarch/kvm/mmu.c
> > +++ b/arch/loongarch/kvm/mmu.c
> > @@ -95,7 +95,7 @@ static int kvm_flush_pte(kvm_pte_t *pte, phys_addr_t =
addr, kvm_ptw_ctx *ctx)
> >       else
> >               kvm->stat.pages--;
> >
> > -     *pte =3D ctx->invalid_entry;
> > +     kvm_set_pte(pte, ctx->invalid_entry);
> >
> >       return 1;
> >   }
> >
> Reviewed-by: Bibo Mao <maobibo@loongson.cn>
Applied, thanks.

Huacai
>
>
